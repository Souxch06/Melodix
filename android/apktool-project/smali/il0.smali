.class public final Lil0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/util/Map$Entry;


# instance fields
.field public j:I

.field public k:I

.field public l:Z

.field public final synthetic m:Lca;


# direct methods
.method public constructor <init>(Lca;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lil0;->m:Lca;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lil0;->l:Z

    .line 8
    .line 9
    invoke-virtual {p1}, Lca;->d()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    iput p1, p0, Lil0;->j:I

    .line 16
    .line 17
    const/4 p1, -0x1

    .line 18
    iput p1, p0, Lil0;->k:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    instance-of v0, p1, Ljava/util/Map$Entry;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    check-cast p1, Ljava/util/Map$Entry;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v2, p0, Lil0;->k:I

    .line 18
    .line 19
    iget-object v3, p0, Lil0;->m:Lca;

    .line 20
    .line 21
    invoke-virtual {v3, v2, v1}, Lca;->b(II)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eq v0, v2, :cond_2

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return v1

    .line 37
    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget p0, p0, Lil0;->k:I

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {v3, p0, v0}, Lca;->b(II)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    if-eq p1, p0, :cond_4

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    return v1

    .line 60
    :cond_4
    :goto_1
    return v0

    .line 61
    :cond_5
    const-string p0, "This container does not support retaining Map.Entry objects"

    .line 62
    .line 63
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return v1
.end method

.method public final getKey()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lil0;->k:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iget-object p0, p0, Lil0;->m:Lca;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lca;->b(II)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "This container does not support retaining Map.Entry objects"

    .line 16
    .line 17
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final getValue()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lil0;->k:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iget-object p0, p0, Lil0;->m:Lca;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lca;->b(II)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "This container does not support retaining Map.Entry objects"

    .line 16
    .line 17
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Lil0;->k:I

    .line 2
    .line 3
    iget p0, p0, Lil0;->j:I

    .line 4
    .line 5
    if-ge v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final hashCode()I
    .locals 4

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget v0, p0, Lil0;->k:I

    .line 7
    .line 8
    iget-object v2, p0, Lil0;->m:Lca;

    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Lca;->b(II)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget p0, p0, Lil0;->k:I

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-virtual {v2, p0, v3}, Lca;->b(II)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    move v0, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    :goto_0
    if-nez p0, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_1
    xor-int p0, v0, v1

    .line 37
    .line 38
    return p0

    .line 39
    :cond_2
    const-string p0, "This container does not support retaining Map.Entry objects"

    .line 40
    .line 41
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v1
.end method

.method public final next()Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lil0;->hasNext()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lil0;->k:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    add-int/2addr v0, v1

    .line 11
    iput v0, p0, Lil0;->k:I

    .line 12
    .line 13
    iput-boolean v1, p0, Lil0;->l:Z

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public final remove()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lil0;->m:Lca;

    .line 6
    .line 7
    iget v1, p0, Lil0;->k:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lca;->g(I)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lil0;->k:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    iput v0, p0, Lil0;->k:I

    .line 17
    .line 18
    iget v0, p0, Lil0;->j:I

    .line 19
    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    iput v0, p0, Lil0;->j:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lil0;->l:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 31
    .line 32
    .line 33
    throw p0
.end method

.method public final setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lil0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lil0;->k:I

    .line 6
    .line 7
    iget-object p0, p0, Lil0;->m:Lca;

    .line 8
    .line 9
    iget v1, p0, Lca;->d:I

    .line 10
    .line 11
    packed-switch v1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 15
    .line 16
    const-string p1, "not a map"

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0

    .line 22
    :pswitch_0
    iget-object p0, p0, Lca;->e:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Lda;

    .line 25
    .line 26
    shl-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    iget-object p0, p0, Lu71;->k:[Ljava/lang/Object;

    .line 31
    .line 32
    aget-object v1, p0, v0

    .line 33
    .line 34
    aput-object p1, p0, v0

    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_0
    const-string p0, "This container does not support retaining Map.Entry objects"

    .line 38
    .line 39
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lil0;->getKey()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lil0;->getValue()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
