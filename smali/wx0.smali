.class public final Lwx0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lhi;


# instance fields
.field public final j:Lmr0;

.field public final k:Lm01;

.field public final l:Lxe0;

.field public final m:Lvx0;

.field public final n:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public o:Ljava/lang/Object;

.field public p:Lp10;

.field public q:Lzx0;

.field public r:Lai;

.field public s:Z

.field public t:Z

.field public u:Z

.field public volatile v:Z

.field public volatile w:Lai;

.field public volatile x:Lzx0;


# direct methods
.method public constructor <init>(Lmr0;Lm01;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lwx0;->j:Lmr0;

    .line 8
    .line 9
    iput-object p2, p0, Lwx0;->k:Lm01;

    .line 10
    .line 11
    iget-object p1, p1, Lmr0;->k:Lbv1;

    .line 12
    .line 13
    iget-object p1, p1, Lbv1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Lxe0;

    .line 16
    .line 17
    iput-object p1, p0, Lwx0;->l:Lxe0;

    .line 18
    .line 19
    new-instance p1, Lvx0;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lvx0;-><init>(Lwx0;)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Lnc1;->g(J)Lnc1;

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lwx0;->m:Lvx0;

    .line 30
    .line 31
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lwx0;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Lwx0;->u:Z

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final a(Lzx0;)V
    .locals 2

    .line 1
    sget-object v0, Ljg1;->a:[B

    .line 2
    .line 3
    iget-object v0, p0, Lwx0;->q:Lzx0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lwx0;->q:Lzx0;

    .line 8
    .line 9
    iget-object p1, p1, Lzx0;->p:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Lux0;

    .line 12
    .line 13
    iget-object v1, p0, Lwx0;->o:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Lux0;-><init>(Lwx0;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "Check failed."

    .line 23
    .line 24
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final b(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 1
    sget-object v0, Ljg1;->a:[B

    .line 2
    .line 3
    iget-object v0, p0, Lwx0;->q:Lzx0;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    invoke-virtual {p0}, Lwx0;->i()Ljava/net/Socket;

    .line 9
    .line 10
    .line 11
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    monitor-exit v0

    .line 13
    iget-object v0, p0, Lwx0;->q:Lzx0;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-static {v1}, Ljg1;->c(Ljava/net/Socket;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-nez v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p0, "Check failed."

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    monitor-exit v0

    .line 35
    throw p0

    .line 36
    :cond_2
    :goto_0
    iget-object p0, p0, Lwx0;->m:Lvx0;

    .line 37
    .line 38
    invoke-virtual {p0}, Loa;->i()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_3

    .line 43
    .line 44
    move-object p0, p1

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 47
    .line 48
    const-string v0, "timeout"

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz p1, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 56
    .line 57
    .line 58
    :cond_4
    :goto_1
    if-eqz p1, :cond_5

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    :cond_5
    return-object p0
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lwx0;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lwx0;->v:Z

    .line 8
    .line 9
    iget-object v0, p0, Lwx0;->w:Lai;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, v0, Lai;->d:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lo10;

    .line 16
    .line 17
    invoke-interface {v0}, Lo10;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Lwx0;->x:Lzx0;

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lzx0;->c:Ljava/net/Socket;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-static {p0}, Ljg1;->c(Ljava/net/Socket;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public final clone()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lwx0;

    .line 2
    .line 3
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 4
    .line 5
    iget-object p0, p0, Lwx0;->k:Lm01;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lwx0;-><init>(Lmr0;Lm01;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final d()Lf11;
    .locals 3

    .line 1
    iget-object v0, p0, Lwx0;->n:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lwx0;->m:Lvx0;

    .line 12
    .line 13
    invoke-virtual {v0}, Loa;->h()V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lgt0;->a:Lgt0;

    .line 17
    .line 18
    sget-object v0, Lgt0;->a:Lgt0;

    .line 19
    .line 20
    invoke-virtual {v0}, Lgt0;->g()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lwx0;->o:Ljava/lang/Object;

    .line 25
    .line 26
    :try_start_0
    iget-object v0, p0, Lwx0;->j:Lmr0;

    .line 27
    .line 28
    iget-object v0, v0, Lmr0;->j:Ler0;

    .line 29
    .line 30
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    :try_start_1
    iget-object v1, v0, Ler0;->n:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ljava/util/ArrayDeque;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 36
    .line 37
    .line 38
    :try_start_2
    monitor-exit v0

    .line 39
    invoke-virtual {p0}, Lwx0;->f()Lf11;

    .line 40
    .line 41
    .line 42
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 44
    .line 45
    iget-object v1, v1, Lmr0;->j:Ler0;

    .line 46
    .line 47
    iget-object v2, v1, Ler0;->n:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v2, Ljava/util/ArrayDeque;

    .line 50
    .line 51
    invoke-virtual {v1, v2, p0}, Ler0;->g(Ljava/util/ArrayDeque;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    goto :goto_0

    .line 57
    :catchall_1
    move-exception v1

    .line 58
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 60
    :goto_0
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 61
    .line 62
    iget-object v1, v1, Lmr0;->j:Ler0;

    .line 63
    .line 64
    iget-object v2, v1, Ler0;->n:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v2, Ljava/util/ArrayDeque;

    .line 67
    .line 68
    invoke-virtual {v1, v2, p0}, Ler0;->g(Ljava/util/ArrayDeque;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    throw v0

    .line 72
    :cond_0
    const-string p0, "Already Executed"

    .line 73
    .line 74
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    return-object p0
.end method

.method public final e(Z)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lwx0;->u:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lwx0;->w:Lai;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v1, p1, Lai;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lo10;

    .line 17
    .line 18
    invoke-interface {v1}, Lo10;->cancel()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p1, Lai;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Lwx0;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v1, p1, v2, v2, v0}, Lwx0;->g(Lai;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-object v0, p0, Lwx0;->r:Lai;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_1
    const-string p1, "released"

    .line 33
    .line 34
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    monitor-exit p0

    .line 42
    throw p1
.end method

.method public final f()Lf11;
    .locals 7

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lwx0;->j:Lmr0;

    .line 7
    .line 8
    iget-object v0, v0, Lmr0;->l:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v0, v2}, Lhl;->x(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lei;

    .line 14
    .line 15
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Lei;-><init>(Lmr0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    new-instance v0, Lno;

    .line 24
    .line 25
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const/4 v6, 0x1

    .line 31
    invoke-direct {v0, v6}, Lno;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    new-instance v0, Lei;

    .line 38
    .line 39
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 40
    .line 41
    iget-object v1, v1, Lmr0;->n:Lbi;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Lei;-><init>(Lbi;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    sget-object v0, Lno;->b:Lno;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lwx0;->j:Lmr0;

    .line 55
    .line 56
    iget-object v0, v0, Lmr0;->m:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {v0, v2}, Lhl;->x(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Lno;

    .line 62
    .line 63
    const/4 v1, 0x2

    .line 64
    invoke-direct {v0, v1}, Lno;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    new-instance v0, Lay0;

    .line 71
    .line 72
    iget-object v5, p0, Lwx0;->k:Lm01;

    .line 73
    .line 74
    iget-object v1, p0, Lwx0;->j:Lmr0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    const/4 v4, 0x0

    .line 81
    move-object v1, p0

    .line 82
    invoke-direct/range {v0 .. v5}, Lay0;-><init>(Lwx0;Ljava/util/ArrayList;ILai;Lm01;)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    const/4 v2, 0x0

    .line 87
    :try_start_0
    iget-object v3, v1, Lwx0;->k:Lm01;

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Lay0;->b(Lm01;)Lf11;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-boolean v3, v1, Lwx0;->v:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    if-nez v3, :cond_0

    .line 96
    .line 97
    invoke-virtual {v1, p0}, Lwx0;->h(Ljava/io/IOException;)Ljava/io/IOException;

    .line 98
    .line 99
    .line 100
    return-object v0

    .line 101
    :cond_0
    :try_start_1
    invoke-static {v0}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Ljava/io/IOException;

    .line 105
    .line 106
    const-string v3, "Canceled"

    .line 107
    .line 108
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    :catchall_0
    move-exception v0

    .line 113
    move v6, v2

    .line 114
    goto :goto_0

    .line 115
    :catch_0
    move-exception v0

    .line 116
    :try_start_2
    invoke-virtual {v1, v0}, Lwx0;->h(Ljava/io/IOException;)Ljava/io/IOException;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 124
    :catchall_1
    move-exception v0

    .line 125
    :goto_0
    if-nez v6, :cond_1

    .line 126
    .line 127
    invoke-virtual {v1, p0}, Lwx0;->h(Ljava/io/IOException;)Ljava/io/IOException;

    .line 128
    .line 129
    .line 130
    :cond_1
    throw v0
.end method

.method public final g(Lai;ZZLjava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lwx0;->w:Lai;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_5

    .line 13
    :cond_0
    monitor-enter p0

    .line 14
    const/4 p1, 0x1

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    :try_start_0
    iget-boolean v1, p0, Lwx0;->s:Z

    .line 19
    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    :goto_0
    if-eqz p3, :cond_7

    .line 26
    .line 27
    iget-boolean v1, p0, Lwx0;->t:Z

    .line 28
    .line 29
    if-eqz v1, :cond_7

    .line 30
    .line 31
    :cond_2
    if-eqz p2, :cond_3

    .line 32
    .line 33
    iput-boolean v0, p0, Lwx0;->s:Z

    .line 34
    .line 35
    :cond_3
    if-eqz p3, :cond_4

    .line 36
    .line 37
    iput-boolean v0, p0, Lwx0;->t:Z

    .line 38
    .line 39
    :cond_4
    iget-boolean p2, p0, Lwx0;->s:Z

    .line 40
    .line 41
    if-nez p2, :cond_5

    .line 42
    .line 43
    iget-boolean p3, p0, Lwx0;->t:Z

    .line 44
    .line 45
    if-nez p3, :cond_5

    .line 46
    .line 47
    move p3, p1

    .line 48
    goto :goto_1

    .line 49
    :cond_5
    move p3, v0

    .line 50
    :goto_1
    if-nez p2, :cond_6

    .line 51
    .line 52
    iget-boolean p2, p0, Lwx0;->t:Z

    .line 53
    .line 54
    if-nez p2, :cond_6

    .line 55
    .line 56
    iget-boolean p2, p0, Lwx0;->u:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    if-nez p2, :cond_6

    .line 59
    .line 60
    move v0, p1

    .line 61
    :cond_6
    move p2, v0

    .line 62
    move v0, p3

    .line 63
    goto :goto_3

    .line 64
    :goto_2
    monitor-exit p0

    .line 65
    throw p1

    .line 66
    :cond_7
    move p2, v0

    .line 67
    :goto_3
    monitor-exit p0

    .line 68
    if-eqz v0, :cond_8

    .line 69
    .line 70
    const/4 p3, 0x0

    .line 71
    iput-object p3, p0, Lwx0;->w:Lai;

    .line 72
    .line 73
    iget-object p3, p0, Lwx0;->q:Lzx0;

    .line 74
    .line 75
    if-eqz p3, :cond_8

    .line 76
    .line 77
    monitor-enter p3

    .line 78
    :try_start_1
    iget v0, p3, Lzx0;->m:I

    .line 79
    .line 80
    add-int/2addr v0, p1

    .line 81
    iput v0, p3, Lzx0;->m:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    .line 83
    monitor-exit p3

    .line 84
    goto :goto_4

    .line 85
    :catchall_1
    move-exception p0

    .line 86
    :try_start_2
    monitor-exit p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 87
    throw p0

    .line 88
    :cond_8
    :goto_4
    if-eqz p2, :cond_9

    .line 89
    .line 90
    invoke-virtual {p0, p4}, Lwx0;->b(Ljava/io/IOException;)Ljava/io/IOException;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_9
    :goto_5
    return-object p4
.end method

.method public final h(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lwx0;->u:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-boolean v1, p0, Lwx0;->u:Z

    .line 8
    .line 9
    iget-boolean v0, p0, Lwx0;->s:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Lwx0;->t:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lwx0;->b(Ljava/io/IOException;)Ljava/io/IOException;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    return-object p1

    .line 30
    :goto_1
    monitor-exit p0

    .line 31
    throw p1
.end method

.method public final i()Ljava/net/Socket;
    .locals 7

    .line 1
    iget-object v0, p0, Lwx0;->q:Lzx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljg1;->a:[B

    .line 7
    .line 8
    iget-object v1, v0, Lzx0;->p:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, v3

    .line 16
    :goto_0
    const/4 v5, -0x1

    .line 17
    if-ge v4, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    add-int/lit8 v4, v4, 0x1

    .line 24
    .line 25
    check-cast v6, Ljava/lang/ref/Reference;

    .line 26
    .line 27
    invoke-virtual {v6}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-static {v6, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v3, v5

    .line 42
    :goto_1
    const/4 v2, 0x0

    .line 43
    if-eq v3, v5, :cond_5

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    iput-object v2, p0, Lwx0;->q:Lzx0;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    iput-wide v3, v0, Lzx0;->q:J

    .line 61
    .line 62
    iget-object p0, p0, Lwx0;->l:Lxe0;

    .line 63
    .line 64
    iget-object v1, p0, Lxe0;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v1, Lob1;

    .line 67
    .line 68
    iget-object v3, p0, Lxe0;->d:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v3, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 71
    .line 72
    sget-object v4, Ljg1;->a:[B

    .line 73
    .line 74
    iget-boolean v4, v0, Lzx0;->j:Z

    .line 75
    .line 76
    if-nez v4, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Lxe0;->c:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast p0, Lzx;

    .line 81
    .line 82
    invoke-static {v1, p0}, Lob1;->d(Lob1;Ljb1;)V

    .line 83
    .line 84
    .line 85
    return-object v2

    .line 86
    :cond_2
    const/4 p0, 0x1

    .line 87
    iput-boolean p0, v0, Lzx0;->j:Z

    .line 88
    .line 89
    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_3

    .line 97
    .line 98
    invoke-virtual {v1}, Lob1;->a()V

    .line 99
    .line 100
    .line 101
    :cond_3
    iget-object p0, v0, Lzx0;->d:Ljava/net/Socket;

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_4
    return-object v2

    .line 108
    :cond_5
    const-string p0, "Check failed."

    .line 109
    .line 110
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v2
.end method
