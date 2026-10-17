.class public final Lpb1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lqb1;


# direct methods
.method public constructor <init>(Lqb1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lpb1;->j:Lqb1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lpb1;->j:Lqb1;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {v0}, Lqb1;->b()Ljb1;

    .line 5
    .line 6
    .line 7
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 8
    monitor-exit v0

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    iget-object v0, v1, Ljb1;->c:Lob1;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lpb1;->j:Lqb1;

    .line 18
    .line 19
    sget-object v3, Lqb1;->i:Ljava/util/logging/Logger;

    .line 20
    .line 21
    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v4

    .line 33
    const-string v6, "starting"

    .line 34
    .line 35
    invoke-static {v1, v0, v6}, Lk42;->l(Ljb1;Lob1;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    const-wide/16 v4, -0x1

    .line 40
    .line 41
    :goto_1
    :try_start_1
    invoke-virtual {v2, v1}, Lqb1;->e(Ljb1;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    sub-long/2addr v2, v4

    .line 51
    invoke-static {v2, v3}, Lk42;->f(J)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "finished run in "

    .line 56
    .line 57
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v1, v0, v2}, Lk42;->l(Ljb1;Lob1;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception v6

    .line 66
    :try_start_2
    iget-object v2, v2, Lqb1;->a:Lpa0;

    .line 67
    .line 68
    iget-object v2, v2, Lpa0;->k:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 71
    .line 72
    invoke-virtual {v2, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 76
    :catchall_1
    move-exception p0

    .line 77
    if-eqz v3, :cond_3

    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    sub-long/2addr v2, v4

    .line 84
    invoke-static {v2, v3}, Lk42;->f(J)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    const-string v3, "failed a run in "

    .line 89
    .line 90
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v1, v0, v2}, Lk42;->l(Ljb1;Lob1;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    throw p0

    .line 98
    :catchall_2
    move-exception p0

    .line 99
    monitor-exit v0

    .line 100
    throw p0
.end method
