.class public Lh31;
.super Ln;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lbr;


# instance fields
.field public final m:Liq;


# direct methods
.method public constructor <init>(Liq;Lsq;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p2, v0}, Ln;-><init>(Lsq;Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lh31;->m:Liq;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final G()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final c()Lbr;
    .locals 1

    .line 1
    iget-object p0, p0, Lh31;->m:Liq;

    .line 2
    .line 3
    instance-of v0, p0, Lbr;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lbr;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lh31;->m:Liq;

    .line 2
    .line 3
    invoke-static {p0}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Lcg1;->u(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Lfe1;->C(Liq;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public n(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lh31;->m:Liq;

    .line 2
    .line 3
    invoke-static {p1}, Lcg1;->u(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Liq;->d(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
