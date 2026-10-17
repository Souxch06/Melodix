.class public final Lqo;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/io/Serializable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lqo;->a:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Lro;
    .locals 4

    .line 1
    new-instance v0, Lro;

    .line 2
    .line 3
    iget-boolean v1, p0, Lqo;->a:Z

    .line 4
    .line 5
    iget-boolean v2, p0, Lqo;->b:Z

    .line 6
    .line 7
    iget-object v3, p0, Lqo;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, [Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lqo;->d:Ljava/io/Serializable;

    .line 12
    .line 13
    check-cast p0, [Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2, v3, p0}, Lro;-><init>(ZZ[Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public varargs b([Lek;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lqo;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    array-length v1, p1

    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    array-length v1, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_0

    .line 15
    .line 16
    aget-object v4, p1, v3

    .line 17
    .line 18
    iget-object v4, v4, Lek;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-array p1, v2, [Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, [Ljava/lang/String;

    .line 33
    .line 34
    array-length v0, p1

    .line 35
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, [Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lqo;->c([Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string p0, "no cipher suites for cleartext connections"

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public varargs c([Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lqo;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v0, p1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, [Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Lqo;->c:Ljava/lang/Object;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "At least one cipher suite is required"

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p0, "no cipher suites for cleartext connections"

    .line 24
    .line 25
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public varargs d([Lsc1;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lqo;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    array-length v1, p1

    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    array-length v1, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_0

    .line 15
    .line 16
    aget-object v4, p1, v3

    .line 17
    .line 18
    iget-object v4, v4, Lsc1;->j:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-array p1, v2, [Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, [Ljava/lang/String;

    .line 33
    .line 34
    array-length v0, p1

    .line 35
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, [Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lqo;->e([Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string p0, "no TLS versions for cleartext connections"

    .line 46
    .line 47
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public varargs e([Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lqo;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v0, p1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, [Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Lqo;->d:Ljava/io/Serializable;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "At least one TLS version is required"

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p0, "no TLS versions for cleartext connections"

    .line 24
    .line 25
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
