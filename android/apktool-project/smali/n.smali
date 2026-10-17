.class public abstract Ln;
.super Lng0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Liq;
.implements Lzq;


# instance fields
.field public final l:Lsq;


# direct methods
.method public constructor <init>(Lsq;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lng0;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Ltb0;->n:Ltb0;

    .line 5
    .line 6
    invoke-interface {p1, p2}, Lsq;->j(Lrq;)Lqq;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lng0;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Lng0;->D(Lng0;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p0}, Lsq;->h(Lsq;)Lsq;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ln;->l:Lsq;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final C(Lrl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ln;->l:Lsq;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lrs0;->i(Lsq;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final L(Ljava/lang/Object;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lql;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lql;

    .line 6
    .line 7
    iget-object v0, p1, Lql;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 10
    .line 11
    sget-wide v2, Lql;->b:J

    .line 12
    .line 13
    invoke-virtual {v1, p1, v2, v3}, Lsun/misc/Unsafe;->getIntVolatile(Ljava/lang/Object;J)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    invoke-virtual {p0, v0, p1}, Ln;->T(Ljava/lang/Throwable;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0, p1}, Ln;->U(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public T(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public U(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final V(Lcr;Ln;Lf90;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Lwe1;->a:Lwe1;

    .line 6
    .line 7
    if-eqz p1, :cond_3

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p1, v1, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p1, v1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    iget-object p1, p0, Ln;->l:Lsq;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p1, v0}, Lbh;->E(Lsq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    invoke-static {v1, p3}, Lfe1;->e(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p3, p2, p0}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    :try_start_2
    invoke-static {p1, v0}, Lbh;->A(Lsq;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    sget-object p1, Lar;->j:Lar;

    .line 36
    .line 37
    if-eq p2, p1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ln;->d(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_0

    .line 45
    :catchall_1
    move-exception p2

    .line 46
    :try_start_3
    invoke-static {p1, v0}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    new-instance p2, Lj11;

    .line 51
    .line 52
    invoke-direct {p2, p1}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p2}, Ln;->d(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    new-instance p0, Lrl;

    .line 60
    .line 61
    invoke-direct {p0}, Lrl;-><init>()V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_1
    check-cast p3, Lkq;

    .line 66
    .line 67
    invoke-virtual {p3, p0, p2}, Lkq;->j(Liq;Ljava/lang/Object;)Liq;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Lqe0;->i(Liq;)Liq;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {p0, v0}, Liq;->d(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void

    .line 79
    :cond_3
    :try_start_4
    check-cast p3, Lkq;

    .line 80
    .line 81
    invoke-virtual {p3, p0, p2}, Lkq;->j(Liq;Ljava/lang/Object;)Liq;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Lqe0;->i(Liq;)Liq;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1, v0}, Lfe1;->C(Liq;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catchall_2
    move-exception p1

    .line 94
    new-instance p2, Lj11;

    .line 95
    .line 96
    invoke-direct {p2, p1}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p2}, Ln;->d(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    throw p1
.end method

.method public final a()Lsq;
    .locals 0

    .line 1
    iget-object p0, p0, Ln;->l:Lsq;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lk11;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, Lql;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {p1, v0, v1}, Lql;-><init>(Ljava/lang/Throwable;Z)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lng0;->I(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, Lxg;->h:Log0;

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0, p1}, Ln;->n(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final getContext()Lsq;
    .locals 0

    .line 1
    iget-object p0, p0, Ln;->l:Lsq;

    .line 2
    .line 3
    return-object p0
.end method

.method public final r()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, " was cancelled"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
