.class public final Ll71;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lg90;


# instance fields
.field public n:I

.field public synthetic o:Ls50;

.field public synthetic p:Ljava/lang/Throwable;

.field public final synthetic q:Lq71;


# direct methods
.method public constructor <init>(Lq71;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll71;->q:Lq71;

    .line 2
    .line 3
    const/4 p1, 0x3

    .line 4
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ls50;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Throwable;

    .line 4
    .line 5
    check-cast p3, Liq;

    .line 6
    .line 7
    new-instance v0, Ll71;

    .line 8
    .line 9
    iget-object p0, p0, Ll71;->q:Lq71;

    .line 10
    .line 11
    invoke-direct {v0, p0, p3}, Ll71;-><init>(Lq71;Liq;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, v0, Ll71;->o:Ls50;

    .line 15
    .line 16
    iput-object p2, v0, Ll71;->p:Ljava/lang/Throwable;

    .line 17
    .line 18
    sget-object p0, Lwe1;->a:Lwe1;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll71;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Ll71;->n:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 14
    .line 15
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll71;->o:Ls50;

    .line 23
    .line 24
    iget-object v0, p0, Ll71;->p:Ljava/lang/Throwable;

    .line 25
    .line 26
    new-instance v3, Lu41;

    .line 27
    .line 28
    iget-object v4, p0, Ll71;->q:Lq71;

    .line 29
    .line 30
    iget-object v4, v4, Lq71;->b:Le51;

    .line 31
    .line 32
    invoke-virtual {v4, v1}, Le51;->a(Ly41;)Ly41;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {v3, v4, v1, v1}, Lu41;-><init>(Ly41;Ljc1;Ljava/util/Map;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll71;->o:Ls50;

    .line 43
    .line 44
    iput v2, p0, Ll71;->n:I

    .line 45
    .line 46
    invoke-interface {p1, v3, p0}, Ls50;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object p1, Lar;->j:Lar;

    .line 51
    .line 52
    if-ne p0, p1, :cond_2

    .line 53
    .line 54
    return-object p1

    .line 55
    :cond_2
    :goto_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 56
    .line 57
    return-object p0
.end method
