.class public final Lpu;
.super Lcb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public n:Ljava/lang/Throwable;

.field public o:I

.field public final synthetic p:Lwu;


# direct methods
.method public constructor <init>(Lwu;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lpu;->p:Lwu;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1, p2}, Lcb1;-><init>(ILiq;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Liq;

    .line 2
    .line 3
    new-instance v0, Lpu;

    .line 4
    .line 5
    iget-object p0, p0, Lpu;->p:Lwu;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lpu;-><init>(Lwu;Liq;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lwe1;->a:Lwe1;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lpu;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lpu;->o:I

    .line 2
    .line 3
    iget-object v1, p0, Lpu;->p:Lwu;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    sget-object v4, Lar;->j:Lar;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-eq v0, v3, :cond_1

    .line 12
    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lpu;->n:Ljava/lang/Throwable;

    .line 16
    .line 17
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    goto :goto_3

    .line 21
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 22
    .line 23
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :cond_1
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :try_start_1
    iput v3, p0, Lpu;->o:I

    .line 38
    .line 39
    invoke-virtual {v1, v3, p0}, Lwu;->h(ZLkq;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-ne p1, v4, :cond_3

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_3
    :goto_0
    check-cast p1, Lr91;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    goto :goto_4

    .line 49
    :goto_1
    invoke-virtual {v1}, Lwu;->c()Lef0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object p1, p0, Lpu;->n:Ljava/lang/Throwable;

    .line 54
    .line 55
    iput v2, p0, Lpu;->o:I

    .line 56
    .line 57
    invoke-interface {v0, p0}, Lef0;->b(Lkq;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    if-ne p0, v4, :cond_4

    .line 62
    .line 63
    :goto_2
    return-object v4

    .line 64
    :cond_4
    move-object v5, p1

    .line 65
    move-object p1, p0

    .line 66
    move-object p0, v5

    .line 67
    :goto_3
    check-cast p1, Ljava/lang/Number;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    new-instance v0, Lqx0;

    .line 74
    .line 75
    invoke-direct {v0, p0, p1}, Lqx0;-><init>(Ljava/lang/Throwable;I)V

    .line 76
    .line 77
    .line 78
    move-object p1, v0

    .line 79
    :goto_4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    new-instance v0, Lps0;

    .line 82
    .line 83
    invoke-direct {v0, p1, p0}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-object v0
.end method
