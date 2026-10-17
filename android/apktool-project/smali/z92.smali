.class public final synthetic Lz92;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lta2;


# direct methods
.method public synthetic constructor <init>(Lta2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz92;->j:Lta2;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object p0, p0, Lz92;->j:Lta2;

    .line 2
    .line 3
    iget-object v0, p0, Lta2;->b:Le52;

    .line 4
    .line 5
    iget-object v0, v0, Le52;->i:Lqb2;

    .line 6
    .line 7
    iget-boolean p0, p0, Lta2;->d:Z

    .line 8
    .line 9
    sget-object v1, Lea2;->a:Lea2;

    .line 10
    .line 11
    iget-object v2, v0, Lqb2;->c:Lsa1;

    .line 12
    .line 13
    invoke-interface {v2}, Lsa1;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lvb2;

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lsd0;->k:Lsd0;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget p0, v0, Lqb2;->e:I

    .line 27
    .line 28
    and-int/lit8 p0, p0, 0x40

    .line 29
    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    iget-object p0, v0, Lqb2;->f:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 33
    .line 34
    monitor-enter p0

    .line 35
    :try_start_0
    iget v3, v0, Lqb2;->e:I

    .line 36
    .line 37
    and-int/lit8 v4, v3, 0x40

    .line 38
    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    or-int/lit8 v1, v3, 0x40

    .line 45
    .line 46
    iput v1, v0, Lqb2;->e:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    monitor-exit p0

    .line 52
    goto :goto_2

    .line 53
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw v0

    .line 55
    :cond_2
    :goto_2
    iget-object p0, v0, Lqb2;->h:Lj60;

    .line 56
    .line 57
    if-nez p0, :cond_6

    .line 58
    .line 59
    iget-object p0, v0, Lqb2;->g:Ljava/lang/Object;

    .line 60
    .line 61
    monitor-enter p0

    .line 62
    :try_start_1
    iget-object v1, v0, Lqb2;->h:Lj60;

    .line 63
    .line 64
    if-nez v1, :cond_5

    .line 65
    .line 66
    if-nez v2, :cond_3

    .line 67
    .line 68
    sget-object v2, Lob2;->a:Lob2;

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :catchall_1
    move-exception v0

    .line 72
    goto :goto_5

    .line 73
    :cond_3
    :goto_3
    iget-object v1, v0, Lqb2;->a:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v1}, Lk42;->t(Landroid/content/Context;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-nez v3, :cond_4

    .line 80
    .line 81
    sget-object v3, Lib2;->j:Lib2;

    .line 82
    .line 83
    iget-object v4, v0, Lqb2;->b:Lsa1;

    .line 84
    .line 85
    invoke-interface {v4}, Lsa1;->get()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    check-cast v5, Ljava/util/concurrent/Executor;

    .line 90
    .line 91
    const/4 v6, 0x0

    .line 92
    invoke-static {v3, v6}, Ljava/util/concurrent/Executors;->callable(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v1, v3, v5}, Lk42;->r(Landroid/content/Context;Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lc0;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v3, Lnb2;

    .line 101
    .line 102
    invoke-direct {v3, v0, v2}, Lnb2;-><init>(Lqb2;Lvb2;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v4}, Lsa1;->get()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ljava/util/concurrent/Executor;

    .line 110
    .line 111
    invoke-static {v1, v3, v2}, Lv0;->q(Lqj0;Lka;Ljava/util/concurrent/Executor;)Lt0;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Lqb2;->h:Lj60;

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_4
    iget-object v1, v0, Lqb2;->d:Lsa1;

    .line 119
    .line 120
    invoke-interface {v1}, Lsa1;->get()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Lv62;

    .line 125
    .line 126
    new-instance v3, Lpb2;

    .line 127
    .line 128
    invoke-direct {v3, v0, v2}, Lpb2;-><init>(Lqb2;Lvb2;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v3}, Lv62;->a(Lpb2;)Lj;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, v0, Lqb2;->h:Lj60;

    .line 136
    .line 137
    :goto_4
    new-instance v2, Lhb2;

    .line 138
    .line 139
    invoke-direct {v2, v1}, Lhb2;-><init>(Lj60;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, v0, Lqb2;->b:Lsa1;

    .line 143
    .line 144
    invoke-interface {v0}, Lsa1;->get()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Ljava/util/concurrent/Executor;

    .line 149
    .line 150
    invoke-virtual {v1, v2, v0}, Lc0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 151
    .line 152
    .line 153
    :cond_5
    monitor-exit p0

    .line 154
    return-void

    .line 155
    :goto_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 156
    throw v0

    .line 157
    :cond_6
    return-void
.end method
