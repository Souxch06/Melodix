.class public abstract Lo;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lqq;


# instance fields
.field public final j:Lrq;


# direct methods
.method public constructor <init>(Lrq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lo;->j:Lrq;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p2, p1, p0}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getKey()Lrq;
    .locals 0

    .line 1
    iget-object p0, p0, Lo;->j:Lrq;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lsq;)Lsq;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ls00;->j:Ls00;

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Li9;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-direct {v0, v1}, Li9;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p0, v0}, Lsq;->g(Ljava/lang/Object;Lf90;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lsq;

    .line 20
    .line 21
    return-object p0
.end method

.method public j(Lrq;)Lqq;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lqe0;->f(Lqq;Lrq;)Lqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Lrq;)Lsq;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lqe0;->k(Lqq;Lrq;)Lsq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
