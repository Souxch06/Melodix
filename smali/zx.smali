.class public final Lzx;
.super Ljb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p3, p0, Lzx;->e:I

    .line 2
    .line 3
    iput-object p1, p0, Lzx;->f:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p2, p1}, Ljb1;-><init>(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 0

    .line 10
    iput p3, p0, Lzx;->e:I

    iput-object p2, p0, Lzx;->f:Ljava/lang/Object;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Ljb1;-><init>(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 15

    .line 1
    iget v0, p0, Lzx;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const-wide/16 v3, -0x1

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lzx;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lp80;

    .line 13
    .line 14
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-wide v3

    .line 18
    :pswitch_0
    iget-object p0, p0, Lzx;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lxe0;

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    iget-object v0, p0, Lxe0;->d:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v7, 0x0

    .line 35
    const-wide/high16 v8, -0x8000000000000000L

    .line 36
    .line 37
    move-wide v9, v8

    .line 38
    move-object v8, v7

    .line 39
    move v7, v2

    .line 40
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v11

    .line 44
    if-eqz v11, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v11

    .line 50
    check-cast v11, Lzx0;

    .line 51
    .line 52
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    monitor-enter v11

    .line 56
    :try_start_0
    invoke-virtual {p0, v11, v5, v6}, Lxe0;->d(Lzx0;J)I

    .line 57
    .line 58
    .line 59
    move-result v12

    .line 60
    if-lez v12, :cond_0

    .line 61
    .line 62
    add-int/lit8 v7, v7, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    iget-wide v12, v11, Lzx0;->q:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .line 69
    sub-long v12, v5, v12

    .line 70
    .line 71
    cmp-long v14, v12, v9

    .line 72
    .line 73
    if-lez v14, :cond_1

    .line 74
    .line 75
    move-object v8, v11

    .line 76
    move-wide v9, v12

    .line 77
    :cond_1
    :goto_1
    monitor-exit v11

    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    monitor-exit v11

    .line 81
    throw p0

    .line 82
    :cond_2
    iget-wide v11, p0, Lxe0;->a:J

    .line 83
    .line 84
    cmp-long v0, v9, v11

    .line 85
    .line 86
    if-gez v0, :cond_5

    .line 87
    .line 88
    const/4 v0, 0x5

    .line 89
    if-le v2, v0, :cond_3

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    if-lez v2, :cond_4

    .line 93
    .line 94
    sub-long v3, v11, v9

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    if-lez v7, :cond_8

    .line 98
    .line 99
    move-wide v3, v11

    .line 100
    goto :goto_3

    .line 101
    :cond_5
    :goto_2
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    monitor-enter v8

    .line 105
    :try_start_1
    iget-object v0, v8, Lzx0;->p:Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 111
    const-wide/16 v3, 0x0

    .line 112
    .line 113
    if-nez v0, :cond_6

    .line 114
    .line 115
    monitor-exit v8

    .line 116
    goto :goto_3

    .line 117
    :cond_6
    :try_start_2
    iget-wide v11, v8, Lzx0;->q:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 118
    .line 119
    add-long/2addr v11, v9

    .line 120
    cmp-long v0, v11, v5

    .line 121
    .line 122
    if-eqz v0, :cond_7

    .line 123
    .line 124
    monitor-exit v8

    .line 125
    goto :goto_3

    .line 126
    :cond_7
    :try_start_3
    iput-boolean v1, v8, Lzx0;->j:Z

    .line 127
    .line 128
    iget-object v0, p0, Lxe0;->d:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 131
    .line 132
    invoke-virtual {v0, v8}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 133
    .line 134
    .line 135
    monitor-exit v8

    .line 136
    iget-object v0, v8, Lzx0;->d:Ljava/net/Socket;

    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    .line 140
    .line 141
    invoke-static {v0}, Ljg1;->c(Ljava/net/Socket;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lxe0;->d:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_8

    .line 153
    .line 154
    iget-object p0, p0, Lxe0;->b:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast p0, Lob1;

    .line 157
    .line 158
    invoke-virtual {p0}, Lob1;->a()V

    .line 159
    .line 160
    .line 161
    :cond_8
    :goto_3
    return-wide v3

    .line 162
    :catchall_1
    move-exception p0

    .line 163
    monitor-exit v8

    .line 164
    throw p0

    .line 165
    :pswitch_1
    iget-object p0, p0, Lzx;->f:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast p0, Ltc0;

    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    const/4 v0, 0x2

    .line 173
    :try_start_4
    iget-object v1, p0, Ltc0;->F:Lbd0;

    .line 174
    .line 175
    invoke-virtual {v1, v2, v0, v2}, Lbd0;->r(ZII)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 176
    .line 177
    .line 178
    goto :goto_4

    .line 179
    :catch_0
    move-exception v1

    .line 180
    invoke-virtual {p0, v0, v0, v1}, Ltc0;->a(IILjava/io/IOException;)V

    .line 181
    .line 182
    .line 183
    :goto_4
    return-wide v3

    .line 184
    :pswitch_2
    iget-object p0, p0, Lzx;->f:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast p0, Lay;

    .line 187
    .line 188
    monitor-enter p0

    .line 189
    :try_start_5
    iget-boolean v0, p0, Lay;->u:Z

    .line 190
    .line 191
    if-eqz v0, :cond_b

    .line 192
    .line 193
    iget-boolean v0, p0, Lay;->v:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 194
    .line 195
    if-eqz v0, :cond_9

    .line 196
    .line 197
    goto :goto_7

    .line 198
    :cond_9
    :try_start_6
    invoke-virtual {p0}, Lay;->y()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 199
    .line 200
    .line 201
    goto :goto_5

    .line 202
    :catchall_2
    move-exception v0

    .line 203
    goto :goto_9

    .line 204
    :catch_1
    :try_start_7
    iput-boolean v1, p0, Lay;->w:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 205
    .line 206
    :goto_5
    :try_start_8
    invoke-virtual {p0}, Lay;->r()Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_a

    .line 211
    .line 212
    invoke-virtual {p0}, Lay;->w()V

    .line 213
    .line 214
    .line 215
    iput v2, p0, Lay;->r:I
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 216
    .line 217
    goto :goto_6

    .line 218
    :catch_2
    :try_start_9
    iput-boolean v1, p0, Lay;->x:Z

    .line 219
    .line 220
    new-instance v0, Lpg;

    .line 221
    .line 222
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 223
    .line 224
    .line 225
    new-instance v1, Lrx0;

    .line 226
    .line 227
    invoke-direct {v1, v0}, Lrx0;-><init>(La81;)V

    .line 228
    .line 229
    .line 230
    iput-object v1, p0, Lay;->p:Lrx0;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 231
    .line 232
    :cond_a
    :goto_6
    monitor-exit p0

    .line 233
    goto :goto_8

    .line 234
    :cond_b
    :goto_7
    monitor-exit p0

    .line 235
    :goto_8
    return-wide v3

    .line 236
    :goto_9
    monitor-exit p0

    .line 237
    throw v0

    .line 238
    nop

    .line 239
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
