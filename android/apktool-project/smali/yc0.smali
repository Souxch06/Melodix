.class public final Lyc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public final j:J

.field public k:Z

.field public final l:Leh;

.field public final m:Leh;

.field public n:Z

.field public final synthetic o:Lad0;


# direct methods
.method public constructor <init>(Lad0;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lyc0;->o:Lad0;

    .line 5
    .line 6
    iput-wide p2, p0, Lyc0;->j:J

    .line 7
    .line 8
    iput-boolean p4, p0, Lyc0;->k:Z

    .line 9
    .line 10
    new-instance p1, Leh;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lyc0;->l:Leh;

    .line 16
    .line 17
    new-instance p1, Leh;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lyc0;->m:Leh;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lyc0;->o:Lad0;

    .line 2
    .line 3
    iget-object p0, p0, Lad0;->k:Lzc0;

    .line 4
    .line 5
    return-object p0
.end method

.method public final c(JLeh;)J
    .locals 11

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :goto_0
    iget-object p1, p0, Lyc0;->o:Lad0;

    .line 5
    .line 6
    monitor-enter p1

    .line 7
    :try_start_0
    iget-object p2, p1, Lad0;->k:Lzc0;

    .line 8
    .line 9
    invoke-virtual {p2}, Loa;->h()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 10
    .line 11
    .line 12
    :try_start_1
    monitor-enter p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    :try_start_2
    iget p2, p1, Lad0;->m:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 14
    .line 15
    :try_start_3
    monitor-exit p1

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p2, :cond_2

    .line 18
    .line 19
    iget-boolean p2, p0, Lyc0;->k:Z

    .line 20
    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    iget-object p2, p1, Lad0;->n:Ljava/io/IOException;

    .line 24
    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    new-instance p2, Ly91;

    .line 28
    .line 29
    monitor-enter p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 30
    :try_start_4
    iget v1, p1, Lad0;->m:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 31
    .line 32
    :try_start_5
    monitor-exit p1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-direct {p2, v1}, Ly91;-><init>(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    move-object v0, p2

    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_1
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 44
    :catchall_1
    move-exception p0

    .line 45
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 46
    :try_start_7
    throw p0

    .line 47
    :cond_2
    :goto_1
    iget-boolean p2, p0, Lyc0;->n:Z

    .line 48
    .line 49
    if-nez p2, :cond_9

    .line 50
    .line 51
    iget-object p2, p0, Lyc0;->m:Leh;

    .line 52
    .line 53
    iget-wide v1, p2, Leh;->k:J

    .line 54
    .line 55
    const-wide/16 v3, 0x0

    .line 56
    .line 57
    cmp-long v3, v1, v3

    .line 58
    .line 59
    const-wide/16 v4, -0x1

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    if-lez v3, :cond_3

    .line 63
    .line 64
    const-wide/16 v7, 0x2000

    .line 65
    .line 66
    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    invoke-virtual {p2, v1, v2, p3}, Leh;->c(JLeh;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    iget-wide v7, p1, Lad0;->c:J

    .line 75
    .line 76
    add-long/2addr v7, v1

    .line 77
    iput-wide v7, p1, Lad0;->c:J

    .line 78
    .line 79
    iget-wide v9, p1, Lad0;->d:J

    .line 80
    .line 81
    sub-long/2addr v7, v9

    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    iget-object p2, p1, Lad0;->b:Ltc0;

    .line 85
    .line 86
    iget-object p2, p2, Ltc0;->y:Lo51;

    .line 87
    .line 88
    invoke-virtual {p2}, Lo51;->a()I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    div-int/lit8 p2, p2, 0x2

    .line 93
    .line 94
    int-to-long v9, p2

    .line 95
    cmp-long p2, v7, v9

    .line 96
    .line 97
    if-ltz p2, :cond_5

    .line 98
    .line 99
    iget-object p2, p1, Lad0;->b:Ltc0;

    .line 100
    .line 101
    iget v3, p1, Lad0;->a:I

    .line 102
    .line 103
    invoke-virtual {p2, v3, v7, v8}, Ltc0;->t(IJ)V

    .line 104
    .line 105
    .line 106
    iget-wide v7, p1, Lad0;->c:J

    .line 107
    .line 108
    iput-wide v7, p1, Lad0;->d:J

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    iget-boolean p2, p0, Lyc0;->k:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 112
    .line 113
    if-nez p2, :cond_4

    .line 114
    .line 115
    if-nez v0, :cond_4

    .line 116
    .line 117
    :try_start_8
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 118
    .line 119
    .line 120
    const/4 v6, 0x1

    .line 121
    :cond_4
    move-wide v1, v4

    .line 122
    goto :goto_2

    .line 123
    :catch_0
    :try_start_9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 128
    .line 129
    .line 130
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 131
    .line 132
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 133
    .line 134
    .line 135
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 136
    :cond_5
    :goto_2
    :try_start_a
    iget-object p2, p1, Lad0;->k:Lzc0;

    .line 137
    .line 138
    invoke-virtual {p2}, Lzc0;->k()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 139
    .line 140
    .line 141
    monitor-exit p1

    .line 142
    if-eqz v6, :cond_6

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :cond_6
    cmp-long p0, v1, v4

    .line 147
    .line 148
    if-eqz p0, :cond_7

    .line 149
    .line 150
    return-wide v1

    .line 151
    :cond_7
    if-nez v0, :cond_8

    .line 152
    .line 153
    return-wide v4

    .line 154
    :cond_8
    throw v0

    .line 155
    :catchall_2
    move-exception p0

    .line 156
    goto :goto_4

    .line 157
    :cond_9
    :try_start_b
    new-instance p0, Ljava/io/IOException;

    .line 158
    .line 159
    const-string p2, "stream closed"

    .line 160
    .line 161
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 165
    :catchall_3
    move-exception p0

    .line 166
    :try_start_c
    monitor-exit p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 167
    :try_start_d
    throw p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 168
    :goto_3
    :try_start_e
    iget-object p2, p1, Lad0;->k:Lzc0;

    .line 169
    .line 170
    invoke-virtual {p2}, Lzc0;->k()V

    .line 171
    .line 172
    .line 173
    throw p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 174
    :goto_4
    monitor-exit p1

    .line 175
    throw p0
.end method

.method public final close()V
    .locals 4

    .line 1
    iget-object v0, p0, Lyc0;->o:Lad0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lyc0;->n:Z

    .line 6
    .line 7
    iget-object v1, p0, Lyc0;->m:Leh;

    .line 8
    .line 9
    iget-wide v2, v1, Leh;->k:J

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Leh;->skip(J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    cmp-long v0, v2, v0

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lyc0;->o:Lad0;

    .line 25
    .line 26
    sget-object v1, Ljg1;->a:[B

    .line 27
    .line 28
    iget-object v0, v0, Lad0;->b:Ltc0;

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Ltc0;->l(J)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lyc0;->o:Lad0;

    .line 34
    .line 35
    invoke-virtual {p0}, Lad0;->a()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    monitor-exit v0

    .line 41
    throw p0
.end method
