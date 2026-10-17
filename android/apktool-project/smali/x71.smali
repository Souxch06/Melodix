.class public final Lx71;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ls50;

    .line 2
    .line 3
    check-cast p2, Liq;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lx71;->j(Liq;Ljava/lang/Object;)Liq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lx71;

    .line 10
    .line 11
    sget-object p1, Lwe1;->a:Lwe1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lx71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method public final j(Liq;Ljava/lang/Object;)Liq;
    .locals 0

    .line 1
    new-instance p0, Lx71;

    .line 2
    .line 3
    const/4 p2, 0x2

    .line 4
    invoke-direct {p0, p2, p1}, Lcb1;-><init>(ILiq;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lwe1;->a:Lwe1;

    .line 5
    .line 6
    return-object p0
.end method
