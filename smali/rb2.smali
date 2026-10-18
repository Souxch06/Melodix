.class public final Lrb2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lsb2;

.field public final synthetic k:Lho0;

.field public final synthetic l:J


# direct methods
.method public constructor <init>(Ltb2;Lsb2;Lho0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lrb2;->j:Lsb2;

    .line 5
    .line 6
    iput-object p3, p0, Lrb2;->k:Lho0;

    .line 7
    .line 8
    iput-wide p4, p0, Lrb2;->l:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lrb2;->j:Lsb2;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lrb2;->k:Lho0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v1, Lbe1;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {p0, v2}, Ljava/util/concurrent/Executors;->callable(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v1, v2}, Lbe1;-><init>(Ljava/util/concurrent/Callable;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, v0, Lho0;->k:Ljava/util/concurrent/ScheduledExecutorService;

    .line 22
    .line 23
    iget-wide v2, p0, Lrb2;->l:J

    .line 24
    .line 25
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    invoke-interface {v0, v1, v2, v3, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Lfo0;

    .line 32
    .line 33
    invoke-direct {v0, v1, p0}, Lfo0;-><init>(Lc0;Ljava/util/concurrent/ScheduledFuture;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Lgb2;

    .line 37
    .line 38
    invoke-direct {p0, v0}, Lgb2;-><init>(Lqj0;)V

    .line 39
    .line 40
    .line 41
    sget-object v1, Ltx;->j:Ltx;

    .line 42
    .line 43
    invoke-virtual {v0, p0, v1}, Lfo0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
