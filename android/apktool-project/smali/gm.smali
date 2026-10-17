.class public interface abstract Lgm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public a(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract b(Lsw0;)Llw0;
.end method

.method public c(Lsw0;)Ljava/util/Set;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lgm;->b(Lsw0;)Llw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/Set;

    .line 10
    .line 11
    return-object p0
.end method

.method public d(Ljava/lang/Class;)Llw0;
    .locals 0

    .line 1
    invoke-static {p1}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Lgm;->f(Lsw0;)Llw0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract e(Lsw0;)Lis0;
.end method

.method public abstract f(Lsw0;)Llw0;
.end method

.method public g(Lsw0;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lgm;->f(Lsw0;)Llw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
