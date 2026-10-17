.class public final Lr72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lcy1;

.field public final synthetic k:Ly72;


# direct methods
.method public constructor <init>(Ly72;Lcy1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lr72;->j:Lcy1;

    .line 5
    .line 6
    iput-object p1, p0, Lr72;->k:Ly72;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lr72;->k:Ly72;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, v0, Ly72;->j:Z

    .line 6
    .line 7
    iget-object v1, v0, Ly72;->l:Li82;

    .line 8
    .line 9
    invoke-virtual {v1}, Li82;->C()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, v1, Let;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Ly02;

    .line 18
    .line 19
    iget-object v2, v2, Ly02;->o:Lzy1;

    .line 20
    .line 21
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, v2, Lzy1;->v:Lso;

    .line 25
    .line 26
    const-string v3, "Connected to remote service"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Lso;->b(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lr72;->j:Lcy1;

    .line 32
    .line 33
    invoke-virtual {v1}, Lgx1;->l()V

    .line 34
    .line 35
    .line 36
    iput-object v2, v1, Li82;->m:Lcy1;

    .line 37
    .line 38
    invoke-virtual {v1}, Li82;->y()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Li82;->A()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    iget-object p0, p0, Lr72;->k:Ly72;

    .line 49
    .line 50
    iget-object p0, p0, Ly72;->l:Li82;

    .line 51
    .line 52
    iget-object v0, p0, Li82;->p:Ljava/util/concurrent/ScheduledExecutorService;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Li82;->p:Ljava/util/concurrent/ScheduledExecutorService;

    .line 61
    .line 62
    :cond_1
    return-void

    .line 63
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw p0
.end method
