.class public final synthetic La52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lc52;


# direct methods
.method public synthetic constructor <init>(Lc52;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La52;->j:Lc52;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object p0, p0, La52;->j:Lc52;

    .line 2
    .line 3
    invoke-virtual {p0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ly02;

    .line 9
    .line 10
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 11
    .line 12
    iget-object v2, v0, Ly02;->o:Lzy1;

    .line 13
    .line 14
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 15
    .line 16
    .line 17
    iget-object v3, v1, Lvz1;->C:Loz1;

    .line 18
    .line 19
    invoke-virtual {v3}, Loz1;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-nez v4, :cond_2

    .line 24
    .line 25
    iget-object v1, v1, Lvz1;->D:Lrz1;

    .line 26
    .line 27
    invoke-virtual {v1}, Lrz1;->a()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    const-wide/16 v6, 0x1

    .line 32
    .line 33
    add-long/2addr v6, v4

    .line 34
    invoke-virtual {v1, v6, v7}, Lrz1;->b(J)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v6, 0x5

    .line 38
    .line 39
    cmp-long v1, v4, v6

    .line 40
    .line 41
    if-ltz v1, :cond_0

    .line 42
    .line 43
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, v2, Lzy1;->r:Lso;

    .line 47
    .line 48
    const-string v0, "Permanently failed to retrieve Deferred Deep Link. Reached maximum retries."

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    invoke-virtual {v3, p0}, Loz1;->b(Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v1, p0, Lc52;->B:Lc32;

    .line 59
    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    new-instance v1, Lc32;

    .line 63
    .line 64
    const/4 v2, 0x3

    .line 65
    const/4 v3, 0x0

    .line 66
    invoke-direct {v1, p0, v0, v2, v3}, Lc32;-><init>(Lc52;Lo22;IZ)V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lc52;->B:Lc32;

    .line 70
    .line 71
    :cond_1
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    invoke-virtual {v1, v2, v3}, Lfu1;->b(J)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, v2, Lzy1;->v:Lso;

    .line 81
    .line 82
    const-string v0, "Deferred Deep Link already retrieved. Not fetching again."

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
