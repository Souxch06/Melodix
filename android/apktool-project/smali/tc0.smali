.class public final Ltc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final I:Lo51;


# instance fields
.field public A:J

.field public B:J

.field public C:J

.field public D:J

.field public final E:Ljava/net/Socket;

.field public final F:Lbd0;

.field public final G:Lpc0;

.field public final H:Ljava/util/LinkedHashSet;

.field public final j:Lmc0;

.field public final k:Ljava/util/LinkedHashMap;

.field public final l:Ljava/lang/String;

.field public m:I

.field public n:I

.field public o:Z

.field public final p:Lqb1;

.field public final q:Lob1;

.field public final r:Lob1;

.field public final s:Lob1;

.field public final t:Lmz;

.field public u:J

.field public v:J

.field public w:J

.field public x:J

.field public final y:Lo51;

.field public z:Lo51;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lo51;

    .line 2
    .line 3
    invoke-direct {v0}, Lo51;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x7

    .line 7
    const v2, 0xffff

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lo51;->b(II)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    const/16 v2, 0x4000

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lo51;->b(II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ltc0;->I:Lo51;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Li7;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Li7;->o:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lmc0;

    .line 7
    .line 8
    iput-object v0, p0, Ltc0;->j:Lmc0;

    .line 9
    .line 10
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 16
    .line 17
    iget-object v0, p1, Li7;->l:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iput-object v0, p0, Ltc0;->l:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    iput v0, p0, Ltc0;->n:I

    .line 28
    .line 29
    iget-object v0, p1, Li7;->j:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v0, Lqb1;

    .line 32
    .line 33
    iput-object v0, p0, Ltc0;->p:Lqb1;

    .line 34
    .line 35
    invoke-virtual {v0}, Lqb1;->d()Lob1;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, p0, Ltc0;->q:Lob1;

    .line 40
    .line 41
    invoke-virtual {v0}, Lqb1;->d()Lob1;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, p0, Ltc0;->r:Lob1;

    .line 46
    .line 47
    invoke-virtual {v0}, Lqb1;->d()Lob1;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Ltc0;->s:Lob1;

    .line 52
    .line 53
    sget-object v0, Lmz;->p:Lmz;

    .line 54
    .line 55
    iput-object v0, p0, Ltc0;->t:Lmz;

    .line 56
    .line 57
    new-instance v0, Lo51;

    .line 58
    .line 59
    invoke-direct {v0}, Lo51;-><init>()V

    .line 60
    .line 61
    .line 62
    const/4 v2, 0x7

    .line 63
    const/high16 v3, 0x1000000

    .line 64
    .line 65
    invoke-virtual {v0, v2, v3}, Lo51;->b(II)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Ltc0;->y:Lo51;

    .line 69
    .line 70
    sget-object v0, Ltc0;->I:Lo51;

    .line 71
    .line 72
    iput-object v0, p0, Ltc0;->z:Lo51;

    .line 73
    .line 74
    invoke-virtual {v0}, Lo51;->a()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    int-to-long v2, v0

    .line 79
    iput-wide v2, p0, Ltc0;->D:J

    .line 80
    .line 81
    iget-object v0, p1, Li7;->k:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v0, Ljava/net/Socket;

    .line 84
    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iput-object v0, p0, Ltc0;->E:Ljava/net/Socket;

    .line 88
    .line 89
    new-instance v0, Lbd0;

    .line 90
    .line 91
    iget-object v2, p1, Li7;->n:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v2, Lrx0;

    .line 94
    .line 95
    if-eqz v2, :cond_1

    .line 96
    .line 97
    invoke-direct {v0, v2}, Lbd0;-><init>(Lrx0;)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Ltc0;->F:Lbd0;

    .line 101
    .line 102
    new-instance v0, Lpc0;

    .line 103
    .line 104
    new-instance v2, Lwc0;

    .line 105
    .line 106
    iget-object p1, p1, Li7;->m:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p1, Lsx0;

    .line 109
    .line 110
    if-eqz p1, :cond_0

    .line 111
    .line 112
    invoke-direct {v2, p1}, Lwc0;-><init>(Lsx0;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {v0, p0, v2}, Lpc0;-><init>(Ltc0;Lwc0;)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Ltc0;->G:Lpc0;

    .line 119
    .line 120
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 121
    .line 122
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object p1, p0, Ltc0;->H:Ljava/util/LinkedHashSet;

    .line 126
    .line 127
    return-void

    .line 128
    :cond_0
    const-string p0, "source"

    .line 129
    .line 130
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw v1

    .line 134
    :cond_1
    const-string p0, "sink"

    .line 135
    .line 136
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw v1

    .line 140
    :cond_2
    const-string p0, "socket"

    .line 141
    .line 142
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw v1

    .line 146
    :cond_3
    const-string p0, "connectionName"

    .line 147
    .line 148
    invoke-static {p0}, Ldl1;->p(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw v1
.end method


# virtual methods
.method public final a(IILjava/io/IOException;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    if-eqz p2, :cond_2

    .line 5
    .line 6
    sget-object v1, Ljg1;->a:[B

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0, p1}, Ltc0;->j(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :catch_0
    monitor-enter p0

    .line 12
    :try_start_1
    iget-object p1, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-array v0, v1, [Lad0;

    .line 28
    .line 29
    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p1, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_2

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    check-cast v0, [Lad0;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    array-length p1, v0

    .line 47
    :goto_1
    if-ge v1, p1, :cond_1

    .line 48
    .line 49
    aget-object v2, v0, v1

    .line 50
    .line 51
    :try_start_2
    invoke-virtual {v2, p2, p3}, Lad0;->c(ILjava/io/IOException;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 52
    .line 53
    .line 54
    :catch_1
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    :try_start_3
    iget-object p1, p0, Ltc0;->F:Lbd0;

    .line 58
    .line 59
    invoke-virtual {p1}, Lbd0;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 60
    .line 61
    .line 62
    :catch_2
    :try_start_4
    iget-object p1, p0, Ltc0;->E:Ljava/net/Socket;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 65
    .line 66
    .line 67
    :catch_3
    iget-object p1, p0, Ltc0;->q:Lob1;

    .line 68
    .line 69
    invoke-virtual {p1}, Lob1;->f()V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ltc0;->r:Lob1;

    .line 73
    .line 74
    invoke-virtual {p1}, Lob1;->f()V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ltc0;->s:Lob1;

    .line 78
    .line 79
    invoke-virtual {p0}, Lob1;->f()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :goto_2
    monitor-exit p0

    .line 84
    throw p1

    .line 85
    :cond_2
    throw v0

    .line 86
    :cond_3
    throw v0
.end method

.method public final close()V
    .locals 3

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {p0, v2, v0, v1}, Ltc0;->a(IILjava/io/IOException;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final flush()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltc0;->F:Lbd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lbd0;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final declared-synchronized g(I)Lad0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lad0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-object p1

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public final declared-synchronized h(I)Lad0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lad0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-object p1

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p1
.end method

.method public final j(I)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ltc0;->F:Lbd0;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    :try_start_1
    iget-boolean v1, p0, Ltc0;->o:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    :try_start_3
    iput-boolean v1, p0, Ltc0;->o:Z

    .line 18
    .line 19
    iget v1, p0, Ltc0;->m:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 20
    .line 21
    :try_start_4
    monitor-exit p0

    .line 22
    iget-object p0, p0, Ltc0;->F:Lbd0;

    .line 23
    .line 24
    sget-object v2, Ljg1;->a:[B

    .line 25
    .line 26
    invoke-virtual {p0, v2, v1, p1}, Lbd0;->j([BII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :catchall_1
    move-exception p1

    .line 32
    :try_start_5
    monitor-exit p0

    .line 33
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 34
    :goto_0
    monitor-exit v0

    .line 35
    throw p0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    throw p0
.end method

.method public final declared-synchronized l(J)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ltc0;->A:J

    .line 3
    .line 4
    add-long/2addr v0, p1

    .line 5
    iput-wide v0, p0, Ltc0;->A:J

    .line 6
    .line 7
    iget-wide p1, p0, Ltc0;->B:J

    .line 8
    .line 9
    sub-long/2addr v0, p1

    .line 10
    iget-object p1, p0, Ltc0;->y:Lo51;

    .line 11
    .line 12
    invoke-virtual {p1}, Lo51;->a()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    div-int/lit8 p1, p1, 0x2

    .line 17
    .line 18
    int-to-long p1, p1

    .line 19
    cmp-long p1, v0, p1

    .line 20
    .line 21
    if-ltz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1, v0, v1}, Ltc0;->t(IJ)V

    .line 25
    .line 26
    .line 27
    iget-wide p1, p0, Ltc0;->B:J

    .line 28
    .line 29
    add-long/2addr p1, v0

    .line 30
    iput-wide p1, p0, Ltc0;->B:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public final r(IZLeh;J)V
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p4, v0

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ltc0;->F:Lbd0;

    .line 9
    .line 10
    invoke-virtual {p0, p2, p1, p3, v3}, Lbd0;->g(ZILeh;I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    :goto_0
    cmp-long v2, p4, v0

    .line 15
    .line 16
    if-lez v2, :cond_4

    .line 17
    .line 18
    monitor-enter p0

    .line 19
    :goto_1
    :try_start_0
    iget-wide v4, p0, Ltc0;->C:J

    .line 20
    .line 21
    iget-wide v6, p0, Ltc0;->D:J

    .line 22
    .line 23
    cmp-long v2, v4, v6

    .line 24
    .line 25
    if-ltz v2, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_3

    .line 45
    :cond_1
    new-instance p1, Ljava/io/IOException;

    .line 46
    .line 47
    const-string p2, "stream closed"

    .line 48
    .line 49
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    :cond_2
    sub-long/2addr v6, v4

    .line 54
    :try_start_1
    invoke-static {p4, p5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    long-to-int v2, v4

    .line 59
    iget-object v4, p0, Ltc0;->F:Lbd0;

    .line 60
    .line 61
    iget v4, v4, Lbd0;->l:I

    .line 62
    .line 63
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iget-wide v4, p0, Ltc0;->C:J

    .line 68
    .line 69
    int-to-long v6, v2

    .line 70
    add-long/2addr v4, v6

    .line 71
    iput-wide v4, p0, Ltc0;->C:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    monitor-exit p0

    .line 74
    sub-long/2addr p4, v6

    .line 75
    iget-object v4, p0, Ltc0;->F:Lbd0;

    .line 76
    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    cmp-long v5, p4, v0

    .line 80
    .line 81
    if-nez v5, :cond_3

    .line 82
    .line 83
    const/4 v5, 0x1

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    move v5, v3

    .line 86
    :goto_2
    invoke-virtual {v4, v5, p1, p3, v2}, Lbd0;->g(ZILeh;I)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 95
    .line 96
    .line 97
    new-instance p1, Ljava/io/InterruptedIOException;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    .line 100
    .line 101
    .line 102
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 103
    :goto_3
    monitor-exit p0

    .line 104
    throw p1

    .line 105
    :cond_4
    return-void
.end method

.method public final s(II)V
    .locals 8

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltc0;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x5b

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "] writeSynReset"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    new-instance v2, Loc0;

    .line 31
    .line 32
    const/4 v7, 0x2

    .line 33
    move-object v4, p0

    .line 34
    move v5, p1

    .line 35
    move v6, p2

    .line 36
    invoke-direct/range {v2 .. v7}, Loc0;-><init>(Ljava/lang/String;Ltc0;III)V

    .line 37
    .line 38
    .line 39
    iget-object p0, v4, Ltc0;->q:Lob1;

    .line 40
    .line 41
    const-wide/16 p1, 0x0

    .line 42
    .line 43
    invoke-virtual {p0, v2, p1, p2}, Lob1;->c(Ljb1;J)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    throw p0
.end method

.method public final t(IJ)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ltc0;->l:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x5b

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "] windowUpdate"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v2, Lsc0;

    .line 29
    .line 30
    move-object v4, p0

    .line 31
    move v5, p1

    .line 32
    move-wide v6, p2

    .line 33
    invoke-direct/range {v2 .. v7}, Lsc0;-><init>(Ljava/lang/String;Ltc0;IJ)V

    .line 34
    .line 35
    .line 36
    iget-object p0, v4, Ltc0;->q:Lob1;

    .line 37
    .line 38
    const-wide/16 p1, 0x0

    .line 39
    .line 40
    invoke-virtual {p0, v2, p1, p2}, Lob1;->c(Ljb1;J)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
