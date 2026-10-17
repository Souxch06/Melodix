.class public final synthetic Ll4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lch;
.implements Ln4;
.implements Llw;


# instance fields
.field public final synthetic j:Lm4;


# direct methods
.method public synthetic constructor <init>(Lm4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll4;->j:Lm4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Llw0;)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll4;->j:Lm4;

    .line 2
    .line 3
    invoke-interface {p1}, Llw0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lj4;

    .line 8
    .line 9
    new-instance v0, Lbv1;

    .line 10
    .line 11
    const/16 v1, 0xe

    .line 12
    .line 13
    invoke-direct {v0, v1, p1}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ls7;

    .line 17
    .line 18
    const/16 v2, 0xc

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ls7;-><init>(I)V

    .line 21
    .line 22
    .line 23
    const-string v2, "clx"

    .line 24
    .line 25
    check-cast p1, Lk4;

    .line 26
    .line 27
    invoke-virtual {p1, v2, v1}, Lk4;->b(Ljava/lang/String;Ls7;)Lt11;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    const-string v2, "crash"

    .line 34
    .line 35
    invoke-virtual {p1, v2, v1}, Lk4;->b(Ljava/lang/String;Ls7;)Lt11;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :cond_0
    if-eqz v2, :cond_2

    .line 40
    .line 41
    new-instance p1, Lpa0;

    .line 42
    .line 43
    const/4 v2, 0x6

    .line 44
    invoke-direct {p1, v2}, Lpa0;-><init>(I)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Lc9;

    .line 48
    .line 49
    invoke-direct {v2, v0}, Lc9;-><init>(Lbv1;)V

    .line 50
    .line 51
    .line 52
    monitor-enter p0

    .line 53
    :try_start_0
    iget-object v0, p0, Lm4;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    const/4 v4, 0x0

    .line 62
    :goto_0
    if-ge v4, v3, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    add-int/lit8 v4, v4, 0x1

    .line 69
    .line 70
    check-cast v5, Lqr;

    .line 71
    .line 72
    iput-object v5, p1, Lpa0;->k:Ljava/lang/Object;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p1

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    iput-object p1, v1, Ls7;->l:Ljava/lang/Object;

    .line 78
    .line 79
    iput-object v2, v1, Ls7;->k:Ljava/lang/Object;

    .line 80
    .line 81
    iput-object p1, p0, Lm4;->c:Ljava/lang/Object;

    .line 82
    .line 83
    iput-object v2, p0, Lm4;->b:Ljava/lang/Object;

    .line 84
    .line 85
    monitor-exit p0

    .line 86
    return-void

    .line 87
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p1

    .line 89
    :cond_2
    return-void
.end method

.method public i(Lqr;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll4;->j:Lm4;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Lm4;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lch;

    .line 7
    .line 8
    instance-of v0, v0, Lux;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lm4;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object v0, p0, Lm4;->c:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lch;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Lch;->i(Lqr;)V

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p1
.end method

.method public k(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll4;->j:Lm4;

    .line 2
    .line 3
    iget-object p0, p0, Lm4;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ln4;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ln4;->k(Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
