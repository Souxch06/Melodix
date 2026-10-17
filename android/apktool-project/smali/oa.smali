.class public Loa;
.super Lnc1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final h:Ljava/util/concurrent/locks/ReentrantLock;

.field public static final i:Ljava/util/concurrent/locks/Condition;

.field public static final j:J

.field public static final k:J

.field public static l:Loa;


# instance fields
.field public e:Z

.field public f:Loa;

.field public g:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Loa;->h:Ljava/util/concurrent/locks/ReentrantLock;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    sput-object v0, Loa;->i:Ljava/util/concurrent/locks/Condition;

    .line 16
    .line 17
    const-wide/32 v0, 0xea60

    .line 18
    .line 19
    .line 20
    sput-wide v0, Loa;->j:J

    .line 21
    .line 22
    const-wide v0, 0xdf8475800L

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    sput-wide v0, Loa;->k:J

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final h()V
    .locals 9

    .line 1
    iget-wide v0, p0, Lnc1;->c:J

    .line 2
    .line 3
    iget-boolean v2, p0, Lnc1;->a:Z

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v3, v0, v3

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v4, Loa;->h:Ljava/util/concurrent/locks/ReentrantLock;

    .line 15
    .line 16
    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    iget-boolean v5, p0, Loa;->e:Z

    .line 20
    .line 21
    if-nez v5, :cond_8

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    iput-boolean v5, p0, Loa;->e:Z

    .line 25
    .line 26
    sget-object v6, Loa;->l:Loa;

    .line 27
    .line 28
    if-nez v6, :cond_1

    .line 29
    .line 30
    new-instance v6, Loa;

    .line 31
    .line 32
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v6, Loa;->l:Loa;

    .line 36
    .line 37
    new-instance v6, Lla;

    .line 38
    .line 39
    const-string v7, "Okio Watchdog"

    .line 40
    .line 41
    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v6, v5}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_4

    .line 53
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 54
    .line 55
    .line 56
    move-result-wide v5

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Lnc1;->c()J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    sub-long/2addr v2, v5

    .line 66
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    add-long/2addr v0, v5

    .line 71
    iput-wide v0, p0, Loa;->g:J

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    if-eqz v3, :cond_3

    .line 75
    .line 76
    add-long/2addr v0, v5

    .line 77
    iput-wide v0, p0, Loa;->g:J

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    if-eqz v2, :cond_7

    .line 81
    .line 82
    invoke-virtual {p0}, Lnc1;->c()J

    .line 83
    .line 84
    .line 85
    move-result-wide v0

    .line 86
    iput-wide v0, p0, Loa;->g:J

    .line 87
    .line 88
    :goto_1
    sub-long/2addr v0, v5

    .line 89
    sget-object v2, Loa;->l:Loa;

    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    .line 93
    .line 94
    :goto_2
    iget-object v3, v2, Loa;->f:Loa;

    .line 95
    .line 96
    if-eqz v3, :cond_5

    .line 97
    .line 98
    iget-wide v7, v3, Loa;->g:J

    .line 99
    .line 100
    sub-long/2addr v7, v5

    .line 101
    cmp-long v7, v0, v7

    .line 102
    .line 103
    if-gez v7, :cond_4

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    move-object v2, v3

    .line 107
    goto :goto_2

    .line 108
    :cond_5
    :goto_3
    iput-object v3, p0, Loa;->f:Loa;

    .line 109
    .line 110
    iput-object p0, v2, Loa;->f:Loa;

    .line 111
    .line 112
    sget-object p0, Loa;->l:Loa;

    .line 113
    .line 114
    if-ne v2, p0, :cond_6

    .line 115
    .line 116
    sget-object p0, Loa;->i:Ljava/util/concurrent/locks/Condition;

    .line 117
    .line 118
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    .line 120
    .line 121
    :cond_6
    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_7
    :try_start_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 126
    .line 127
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 128
    .line 129
    .line 130
    throw p0

    .line 131
    :cond_8
    const-string p0, "Unbalanced enter/exit"

    .line 132
    .line 133
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    :goto_4
    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 140
    .line 141
    .line 142
    throw p0
.end method

.method public final i()Z
    .locals 4

    .line 1
    sget-object v0, Loa;->h:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-boolean v1, p0, Loa;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 12
    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    :try_start_1
    iput-boolean v2, p0, Loa;->e:Z

    .line 16
    .line 17
    sget-object v1, Loa;->l:Loa;

    .line 18
    .line 19
    :goto_0
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v3, v1, Loa;->f:Loa;

    .line 22
    .line 23
    if-ne v3, p0, :cond_1

    .line 24
    .line 25
    iget-object v3, p0, Loa;->f:Loa;

    .line 26
    .line 27
    iput-object v3, v1, Loa;->f:Loa;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput-object v1, p0, Loa;->f:Loa;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 33
    .line 34
    .line 35
    return v2

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-object v1, v3

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :goto_1
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 46
    .line 47
    .line 48
    throw p0
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method
