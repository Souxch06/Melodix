.class public final Lc02;
.super Lvk0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic f:Lk02;


# direct methods
.method public constructor <init>(Lk02;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lc02;->f:Lk02;

    .line 2
    .line 3
    const/16 p1, 0x14

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lvk0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lc02;->f:Lk02;

    .line 7
    .line 8
    invoke-virtual {p0}, Laa2;->m()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ls92;->k:Lsa2;

    .line 15
    .line 16
    iget-object v0, v0, Lsa2;->l:Ldu1;

    .line 17
    .line 18
    invoke-static {v0}, Lsa2;->T(Laa2;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ldu1;->t0(Ljava/lang/String;)Lc9;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Ly02;

    .line 32
    .line 33
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 34
    .line 35
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 39
    .line 40
    const-string v2, "Populate EES config from database on cache miss. appId"

    .line 41
    .line 42
    invoke-virtual {v1, p1, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, v0, Lc9;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, [B

    .line 48
    .line 49
    invoke-virtual {p0, p1, v0}, Lk02;->u(Ljava/lang/String;[B)Lqy1;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, p1, v0}, Lk02;->t(Ljava/lang/String;Lqy1;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lk02;->t:Lc02;

    .line 57
    .line 58
    monitor-enter p0

    .line 59
    :try_start_0
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 60
    .line 61
    iget-object v1, p0, Lvk0;->a:Ljava/util/LinkedHashMap;

    .line 62
    .line 63
    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    monitor-exit p0

    .line 67
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Lfv1;

    .line 72
    .line 73
    return-object p0

    .line 74
    :catchall_0
    move-exception p1

    .line 75
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    throw p1
.end method
