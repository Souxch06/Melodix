.class public final Lt0;
.super Lv0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public final r(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lka;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Lka;->apply(Ljava/lang/Object;)Lqj0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "AsyncFunction.apply returned null instead of a Future. Did you mean to return immediateFuture(null)? %s"

    .line 8
    .line 9
    invoke-static {p0, p2, p1}, Las;->e(Lqj0;Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public final s(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lqj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lc0;->n(Lqj0;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
