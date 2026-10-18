.class public final Lg41;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public j:Ljava/lang/Runnable;

.field public final synthetic k:Lh41;


# direct methods
.method public constructor <init>(Lh41;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg41;->k:Lh41;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    :try_start_0
    iget-object v2, p0, Lg41;->k:Lh41;

    .line 4
    .line 5
    iget-object v2, v2, Lh41;->k:Ljava/util/ArrayDeque;

    .line 6
    .line 7
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    const/4 v3, 0x1

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :try_start_1
    iget-object v0, p0, Lg41;->k:Lh41;

    .line 12
    .line 13
    iget v4, v0, Lh41;->l:I

    .line 14
    .line 15
    const/4 v5, 0x4

    .line 16
    if-ne v4, v5, :cond_0

    .line 17
    .line 18
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 26
    .line 27
    .line 28
    goto :goto_2

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_5

    .line 31
    :cond_0
    :try_start_2
    iget-wide v6, v0, Lh41;->m:J

    .line 32
    .line 33
    const-wide/16 v8, 0x1

    .line 34
    .line 35
    add-long/2addr v6, v8

    .line 36
    iput-wide v6, v0, Lh41;->m:J

    .line 37
    .line 38
    iput v5, v0, Lh41;->l:I

    .line 39
    .line 40
    move v0, v3

    .line 41
    :cond_1
    iget-object v4, p0, Lg41;->k:Lh41;

    .line 42
    .line 43
    iget-object v4, v4, Lh41;->k:Ljava/util/ArrayDeque;

    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Ljava/lang/Runnable;

    .line 50
    .line 51
    iput-object v4, p0, Lg41;->j:Ljava/lang/Runnable;

    .line 52
    .line 53
    if-nez v4, :cond_3

    .line 54
    .line 55
    iget-object p0, p0, Lg41;->k:Lh41;

    .line 56
    .line 57
    iput v3, p0, Lh41;->l:I

    .line 58
    .line 59
    monitor-exit v2

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    :goto_2
    return-void

    .line 64
    :cond_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 66
    .line 67
    .line 68
    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 69
    or-int/2addr v1, v2

    .line 70
    const/4 v2, 0x0

    .line 71
    :try_start_4
    iget-object v3, p0, Lg41;->j:Ljava/lang/Runnable;

    .line 72
    .line 73
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 74
    .line 75
    .line 76
    :goto_3
    :try_start_5
    iput-object v2, p0, Lg41;->j:Ljava/lang/Runnable;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_1
    move-exception p0

    .line 80
    goto :goto_6

    .line 81
    :catchall_2
    move-exception v0

    .line 82
    goto :goto_4

    .line 83
    :catch_0
    move-exception v3

    .line 84
    :try_start_6
    sget-object v4, Lh41;->o:Ljava/util/logging/Logger;

    .line 85
    .line 86
    sget-object v5, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 87
    .line 88
    new-instance v6, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v7, "Exception while executing runnable "

    .line 94
    .line 95
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v7, p0, Lg41;->j:Ljava/lang/Runnable;

    .line 99
    .line 100
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-virtual {v4, v5, v6, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 108
    .line 109
    .line 110
    goto :goto_3

    .line 111
    :goto_4
    :try_start_7
    iput-object v2, p0, Lg41;->j:Ljava/lang/Runnable;

    .line 112
    .line 113
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 114
    :goto_5
    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 115
    :try_start_9
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 116
    :goto_6
    if-eqz v1, :cond_4

    .line 117
    .line 118
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 123
    .line 124
    .line 125
    :cond_4
    throw p0
.end method

.method public run()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lg41;->a()V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception v0

    .line 6
    iget-object v1, p0, Lg41;->k:Lh41;

    .line 7
    .line 8
    iget-object v1, v1, Lh41;->k:Ljava/util/ArrayDeque;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_1
    iget-object p0, p0, Lg41;->k:Lh41;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput v2, p0, Lh41;->l:I

    .line 15
    .line 16
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw v0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 20
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lg41;->j:Ljava/lang/Runnable;

    .line 2
    .line 3
    const-string v1, "}"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "SequentialExecutorWorker{running="

    .line 10
    .line 11
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "SequentialExecutorWorker{state="

    .line 28
    .line 29
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lg41;->k:Lh41;

    .line 33
    .line 34
    iget p0, p0, Lh41;->l:I

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-eq p0, v2, :cond_4

    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    if-eq p0, v2, :cond_3

    .line 41
    .line 42
    const/4 v2, 0x3

    .line 43
    if-eq p0, v2, :cond_2

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    if-eq p0, v2, :cond_1

    .line 47
    .line 48
    const-string p0, "null"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string p0, "RUNNING"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const-string p0, "QUEUED"

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const-string p0, "QUEUING"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    const-string p0, "IDLE"

    .line 61
    .line 62
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
