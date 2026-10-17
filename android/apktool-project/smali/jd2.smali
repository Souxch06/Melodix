.class public final Ljd2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Lo80;

.field public c:Z

.field public volatile d:Z

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Exception;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Lo80;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, v0, Lo80;->b:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object v0, p0, Ljd2;->b:Lo80;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/Executor;Lvr0;)V
    .locals 1

    .line 1
    new-instance v0, Lkz1;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lvr0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lo80;->f(Llb2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljd2;->q()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final b(Lwr0;)V
    .locals 2

    .line 1
    sget-object v0, Lmb1;->a:Lq10;

    .line 2
    .line 3
    new-instance v1, Lkz1;

    .line 4
    .line 5
    invoke-direct {v1, v0, p1}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lwr0;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Lo80;->f(Llb2;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljd2;->q()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final c(Ljava/util/concurrent/Executor;Lyr0;)V
    .locals 1

    .line 1
    new-instance v0, Lkz1;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lyr0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lo80;->f(Llb2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljd2;->q()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d(Ljava/util/concurrent/Executor;Lcs0;)V
    .locals 1

    .line 1
    new-instance v0, Lkz1;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lcs0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lo80;->f(Llb2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljd2;->q()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e(Ljava/util/concurrent/Executor;Ljq;)Ljd2;
    .locals 3

    .line 1
    new-instance v0, Ljd2;

    .line 2
    .line 3
    invoke-direct {v0}, Ljd2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lgw1;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, p1, p2, v0, v2}, Lgw1;-><init>(Ljava/util/concurrent/Executor;Ljq;Ljd2;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lo80;->f(Llb2;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljd2;->q()V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public final f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;
    .locals 3

    .line 1
    new-instance v0, Ljd2;

    .line 2
    .line 3
    invoke-direct {v0}, Ljd2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lgw1;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-direct {v1, p1, p2, v0, v2}, Lgw1;-><init>(Ljava/util/concurrent/Executor;Ljq;Ljd2;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lo80;->f(Llb2;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljd2;->q()V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public final g()Ljava/lang/Exception;
    .locals 1

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ljd2;->f:Ljava/lang/Exception;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final h()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 5
    .line 6
    const-string v2, "Task is not yet complete"

    .line 7
    .line 8
    invoke-static {v2, v1}, Lbh;->j(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Ljd2;->d:Z

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ljd2;->f:Ljava/lang/Exception;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ljd2;->e:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-object p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p0, Ld21;

    .line 26
    .line 27
    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    new-instance p0, Ljava/util/concurrent/CancellationException;

    .line 32
    .line 33
    const-string v1, "Task is already canceled."

    .line 34
    .line 35
    invoke-direct {p0, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p0

    .line 39
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p0
.end method

.method public final i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ljd2;->c:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final j()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Ljd2;->d:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ljd2;->f:Ljava/lang/Exception;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit v0

    .line 22
    return v2

    .line 23
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public final k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;
    .locals 2

    .line 1
    new-instance v0, Ljd2;

    .line 2
    .line 3
    invoke-direct {v0}, Ljd2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lkz1;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2, v0}, Lkz1;-><init>(Ljava/util/concurrent/Executor;Lpa1;Ljd2;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Lo80;->f(Llb2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljd2;->q()V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final l(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ljd2;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Ljd2;->c:Z

    .line 9
    .line 10
    iput-object p1, p0, Ljd2;->e:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lo80;->g(Ljd2;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p0
.end method

.method public final m(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Ljd2;->c:Z

    .line 15
    .line 16
    iput-object p1, p0, Ljd2;->e:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lo80;->g(Ljd2;)V

    .line 22
    .line 23
    .line 24
    return v1

    .line 25
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p0
.end method

.method public final n(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    const-string v0, "Exception must not be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    invoke-virtual {p0}, Ljd2;->p()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ljd2;->c:Z

    .line 14
    .line 15
    iput-object p1, p0, Ljd2;->f:Ljava/lang/Exception;

    .line 16
    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lo80;->g(Ljd2;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p0
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ljd2;->c:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Ljd2;->d:Z

    .line 16
    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object v0, p0, Ljd2;->b:Lo80;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lo80;->g(Ljd2;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p0
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ljd2;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {p0}, Ljd2;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Ljd2;->g()Ljava/lang/Exception;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Ljd2;->j()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-boolean p0, p0, Ljd2;->d:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "cancellation"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "unknown issue"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0}, Ljd2;->h()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v1, "result "

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const-string p0, "failure"

    .line 49
    .line 50
    :goto_0
    new-instance v1, Lsk;

    .line 51
    .line 52
    const-string v2, "Complete with: "

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    const-string p0, "DuplicateTaskCompletionException can only be created from completed Task."

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :goto_1
    throw v1

    .line 70
    :cond_4
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    iget-object v0, p0, Ljd2;->b:Lo80;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lo80;->g(Ljd2;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0
.end method
