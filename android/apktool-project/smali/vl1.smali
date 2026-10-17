.class public final synthetic Lvl1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lm4;

.field public final synthetic k:Lny0;


# direct methods
.method public synthetic constructor <init>(Lm4;Lny0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvl1;->j:Lm4;

    .line 5
    .line 6
    iput-object p2, p0, Lvl1;->k:Lny0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lvl1;->j:Lm4;

    .line 2
    .line 3
    iget-object p0, p0, Lvl1;->k:Lny0;

    .line 4
    .line 5
    iget-object v0, v0, Lm4;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    check-cast v0, Lpb2;

    .line 11
    .line 12
    :try_start_0
    iget-object p0, p0, Lny0;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, [B

    .line 15
    .line 16
    sget-object v1, Lgp1;->a:Lgp1;

    .line 17
    .line 18
    sget v1, Lso1;->a:I

    .line 19
    .line 20
    sget-object v1, Lgp1;->b:Lgp1;

    .line 21
    .line 22
    invoke-static {p0, v1}, Lxa2;->s([BLgp1;)Lxa2;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Laq1; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    iget-object v1, v0, Lpb2;->b:Lqb2;

    .line 27
    .line 28
    iget-object v1, v1, Lqb2;->f:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x0

    .line 35
    move v3, v2

    .line 36
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_d

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Lea2;

    .line 47
    .line 48
    invoke-virtual {p0}, Lxa2;->r()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    sget-object v4, Lta2;->h:Lny0;

    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    if-eqz v5, :cond_b

    .line 62
    .line 63
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    if-eqz v7, :cond_2

    .line 68
    .line 69
    goto/16 :goto_7

    .line 70
    .line 71
    :cond_2
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    move v7, v2

    .line 76
    :cond_3
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    if-eqz v8, :cond_c

    .line 81
    .line 82
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    check-cast v8, Ljava/lang/String;

    .line 87
    .line 88
    iget-object v9, v4, Lny0;->k:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v9, Ljava/util/concurrent/ConcurrentHashMap;

    .line 91
    .line 92
    invoke-virtual {v9, v8}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    check-cast v8, Lw92;

    .line 97
    .line 98
    if-eqz v8, :cond_3

    .line 99
    .line 100
    iget-object v8, v8, Lw92;->a:Lta2;

    .line 101
    .line 102
    iget-boolean v9, v8, Lta2;->d:Z

    .line 103
    .line 104
    if-nez v9, :cond_4

    .line 105
    .line 106
    move v8, v6

    .line 107
    goto :goto_6

    .line 108
    :cond_4
    iget-object v9, v8, Lta2;->a:Lai;

    .line 109
    .line 110
    if-eqz v9, :cond_a

    .line 111
    .line 112
    iget-boolean v10, v9, Lai;->a:Z

    .line 113
    .line 114
    const/4 v11, 0x3

    .line 115
    if-nez v10, :cond_6

    .line 116
    .line 117
    iget-object v9, v9, Lai;->e:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v9, Ltw0;

    .line 120
    .line 121
    iget v9, v9, Ltw0;->b:I

    .line 122
    .line 123
    if-ne v9, v11, :cond_5

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    iget-object v9, v8, Lta2;->g:Ll42;

    .line 127
    .line 128
    invoke-virtual {v9}, Ll42;->f()Z

    .line 129
    .line 130
    .line 131
    move-result v9

    .line 132
    if-eqz v9, :cond_a

    .line 133
    .line 134
    :cond_6
    :goto_2
    monitor-enter v8

    .line 135
    :try_start_1
    iget-object v9, v8, Lta2;->a:Lai;

    .line 136
    .line 137
    if-eqz v9, :cond_9

    .line 138
    .line 139
    iget-boolean v10, v9, Lai;->a:Z

    .line 140
    .line 141
    if-nez v10, :cond_8

    .line 142
    .line 143
    iget-object v9, v9, Lai;->e:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v9, Ltw0;

    .line 146
    .line 147
    iget v9, v9, Ltw0;->b:I

    .line 148
    .line 149
    if-ne v9, v11, :cond_7

    .line 150
    .line 151
    move v9, v6

    .line 152
    goto :goto_3

    .line 153
    :cond_7
    move v9, v2

    .line 154
    :goto_3
    if-nez v9, :cond_8

    .line 155
    .line 156
    iget-object v9, v8, Lta2;->g:Ll42;

    .line 157
    .line 158
    invoke-virtual {v9}, Ll42;->f()Z

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    if-eqz v9, :cond_9

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :catchall_0
    move-exception p0

    .line 166
    goto :goto_5

    .line 167
    :cond_8
    :goto_4
    const/4 v9, 0x0

    .line 168
    iput-object v9, v8, Lta2;->a:Lai;

    .line 169
    .line 170
    iget-object v9, v8, Lta2;->f:Lmd1;

    .line 171
    .line 172
    iget-object v9, v9, Lmd1;->k:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v9, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 175
    .line 176
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 177
    .line 178
    .line 179
    :cond_9
    monitor-exit v8

    .line 180
    :cond_a
    move v8, v2

    .line 181
    goto :goto_6

    .line 182
    :goto_5
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 183
    throw p0

    .line 184
    :goto_6
    or-int/2addr v7, v8

    .line 185
    goto :goto_1

    .line 186
    :cond_b
    :goto_7
    move v7, v2

    .line 187
    :cond_c
    if-eqz v7, :cond_1

    .line 188
    .line 189
    if-nez v3, :cond_1

    .line 190
    .line 191
    iget-object v3, v0, Lpb2;->a:Lvb2;

    .line 192
    .line 193
    invoke-interface {v3}, Lvb2;->a()V

    .line 194
    .line 195
    .line 196
    move v3, v6

    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :catch_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 200
    .line 201
    .line 202
    :cond_d
    return-void
.end method
