.class public final Ldo1;
.super Lvk;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final z(Lk00;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget-object v0, Lbf2;->n:Lbf2;

    .line 10
    .line 11
    iget-object p0, p0, Lvk;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lcf2;

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0, p0}, Lk00;->e(Ljava/lang/Object;Lbf2;Lcf2;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
