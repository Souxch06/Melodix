.class public final Lnm0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Lg5;


# instance fields
.field public final a:Ljava/util/concurrent/ScheduledExecutorService;

.field public final b:Ljava/util/concurrent/ConcurrentLinkedQueue;

.field public final c:Ljava/lang/Runtime;

.field public d:Ljava/util/concurrent/ScheduledFuture;

.field public e:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lnm0;->f:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, p0, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;

    .line 14
    .line 15
    const-wide/16 v2, -0x1

    .line 16
    .line 17
    iput-wide v2, p0, Lnm0;->e:J

    .line 18
    .line 19
    iput-object v0, p0, Lnm0;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 20
    .line 21
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lnm0;->b:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 27
    .line 28
    iput-object v1, p0, Lnm0;->c:Ljava/lang/Runtime;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(JLoc1;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-wide p1, p0, Lnm0;->e:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    :try_start_1
    iget-object v0, p0, Lnm0;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 5
    .line 6
    new-instance v1, Lmm0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, p0, p3, v2}, Lmm0;-><init>(Lnm0;Loc1;I)V

    .line 10
    .line 11
    .line 12
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    move-wide v4, p1

    .line 17
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    move-object p1, v0

    .line 26
    goto :goto_1

    .line 27
    :catch_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    :try_start_2
    sget-object p2, Lnm0;->f:Lg5;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    .line 37
    :goto_0
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    throw p1
.end method

.method public final b(Loc1;)Li5;
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-wide v0, p1, Loc1;->j:J

    .line 6
    .line 7
    invoke-virtual {p1}, Loc1;->b()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    add-long/2addr v2, v0

    .line 12
    invoke-static {}, Li5;->r()Lh5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lea0;->i()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lea0;->k:Lia0;

    .line 20
    .line 21
    check-cast v0, Li5;

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3}, Li5;->s(J)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lnm0;->c:Ljava/lang/Runtime;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Runtime;->totalMemory()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p0}, Ljava/lang/Runtime;->freeMemory()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    sub-long/2addr v0, v2

    .line 37
    const/4 p0, 0x5

    .line 38
    invoke-static {p0}, Lx81;->f(I)J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    mul-long/2addr v2, v0

    .line 43
    const-wide/16 v0, 0x400

    .line 44
    .line 45
    div-long/2addr v2, v0

    .line 46
    invoke-static {v2, v3}, Lml;->A(J)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p1}, Lea0;->i()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p1, Lea0;->k:Lia0;

    .line 54
    .line 55
    check-cast v0, Li5;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Li5;->t(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Lea0;->h()Lia0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Li5;

    .line 65
    .line 66
    return-object p0
.end method
