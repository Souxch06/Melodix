.class public final Lhn;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljn;


# direct methods
.method public constructor <init>(Ljn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lhn;->j:Ljn;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object p0, p0, Lhn;->j:Ljn;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljn;->a()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    const/4 v1, 0x1

    .line 12
    :try_start_1
    iput-boolean v1, p0, Ljn;->b:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 18
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Ljn;->o:Lmn;

    .line 24
    .line 25
    invoke-virtual {v0}, Lmn;->c()Lln;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ljava/util/Date;

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 36
    .line 37
    .line 38
    iget-object v0, v0, Lln;->b:Ljava/util/Date;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ljn;->h()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    iget-object v0, p0, Ljn;->j:Lh40;

    .line 51
    .line 52
    check-cast v0, Lg40;

    .line 53
    .line 54
    invoke-virtual {v0}, Lg40;->e()Ljd2;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0}, Lg40;->c()Ljd2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    filled-new-array {v1, v0}, [Ljd2;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Lbe2;->y([Ljd2;)Ljd2;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object v3, p0, Ljn;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 71
    .line 72
    new-instance v4, Lgn;

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    invoke-direct {v4, p0, v1, v0, v5}, Lgn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v3, v4}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {v0}, [Ljd2;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v1}, Lbe2;->y([Ljd2;)Ljd2;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v2, p0, Ljn;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 91
    .line 92
    new-instance v3, Lkm;

    .line 93
    .line 94
    const/4 v4, 0x4

    .line 95
    invoke-direct {v3, p0, v4, v0}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v2, v3}, Ljd2;->e(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :catchall_1
    move-exception v0

    .line 103
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 104
    throw v0
.end method
