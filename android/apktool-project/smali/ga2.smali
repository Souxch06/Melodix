.class public final synthetic Lga2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lta2;

.field public final synthetic k:Lu0;


# direct methods
.method public synthetic constructor <init>(Lta2;Lu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lga2;->j:Lta2;

    .line 5
    .line 6
    iput-object p2, p0, Lga2;->k:Lu0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lga2;->j:Lta2;

    .line 2
    .line 3
    iget-object p0, p0, Lga2;->k:Lu0;

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lk42;->g(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lyb2;

    .line 10
    .line 11
    new-instance v1, Ltw0;

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    const/4 v3, 0x3

    .line 15
    const/4 v4, 0x6

    .line 16
    invoke-direct {v1, v4, v2, v3}, Ltw0;-><init>(III)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lai;

    .line 20
    .line 21
    invoke-direct {v2, p0, v1}, Lai;-><init>(Lyb2;Ltw0;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v1, v0, Lta2;->d:Z

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v3, v0, Lta2;->a:Lai;

    .line 29
    .line 30
    if-nez v3, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception p0

    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :catch_1
    move-exception p0

    .line 37
    goto :goto_3

    .line 38
    :cond_0
    :goto_0
    monitor-enter v0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    if-nez v1, :cond_3

    .line 40
    .line 41
    :try_start_1
    iget-object v3, v0, Lta2;->a:Lai;

    .line 42
    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    :cond_2
    :try_start_2
    iget-object v1, v3, Lai;->d:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v1, Lrz0;

    .line 50
    .line 51
    iget-object v2, v2, Lai;->d:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v2, Lrz0;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Lrz0;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-nez v1, :cond_4

    .line 60
    .line 61
    iget-object p0, v0, Lta2;->b:Le52;

    .line 62
    .line 63
    iget-object p0, p0, Le52;->e:Lsa1;

    .line 64
    .line 65
    invoke-interface {p0}, Lsa1;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Lvb2;

    .line 70
    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    invoke-interface {p0}, Lvb2;->a()V
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_0

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    :goto_1
    :try_start_3
    iput-object v2, v0, Lta2;->a:Lai;

    .line 80
    .line 81
    iget-object v1, v0, Lta2;->f:Lmd1;

    .line 82
    .line 83
    iget-object v1, v1, Lmd1;->k:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 88
    .line 89
    .line 90
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :cond_4
    :try_start_4
    iget-boolean v1, v0, Lta2;->d:Z

    .line 92
    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    iget-object v1, v0, Lta2;->b:Le52;

    .line 96
    .line 97
    iget-object v2, v1, Le52;->d:Lsa1;

    .line 98
    .line 99
    invoke-interface {v2}, Lsa1;->get()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Lv62;

    .line 104
    .line 105
    invoke-virtual {p0}, Lyb2;->r()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    iget-object v2, v2, Lv62;->a:Lu32;

    .line 116
    .line 117
    invoke-virtual {v2, p0}, Lu32;->c(Ljava/lang/String;)Ljd2;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p0}, Lv62;->b(Ljd2;)Lj;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-class v2, Ljava/lang/Throwable;

    .line 126
    .line 127
    new-instance v3, Lha2;

    .line 128
    .line 129
    const/4 v4, 0x0

    .line 130
    invoke-direct {v3, v4, v0}, Lha2;-><init>(ILjava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    new-instance v4, Lk;

    .line 138
    .line 139
    invoke-direct {v4, p0, v2, v3}, Ll;-><init>(Lqj0;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v1, v4}, Lrs0;->o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-interface {p0, v4, v1}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    :try_end_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_4 .. :try_end_4} :catch_0

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :goto_2
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 151
    :try_start_6
    throw p0
    :try_end_6
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_6 .. :try_end_6} :catch_0

    .line 152
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    instance-of p0, p0, Ljava/lang/SecurityException;

    .line 157
    .line 158
    if-nez p0, :cond_5

    .line 159
    .line 160
    iget-object p0, v0, Lta2;->c:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    add-int/lit8 p0, p0, 0x40

    .line 173
    .line 174
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 175
    .line 176
    .line 177
    :cond_5
    return-void
.end method
