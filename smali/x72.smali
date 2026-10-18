.class public final Lx72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Loo;

.field public final synthetic k:Ly72;


# direct methods
.method public constructor <init>(Ly72;Loo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lx72;->j:Loo;

    .line 5
    .line 6
    iput-object p1, p0, Lx72;->k:Ly72;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lx72;->k:Ly72;

    .line 2
    .line 3
    iget-object v0, v0, Ly72;->l:Li82;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Li82;->m:Lcy1;

    .line 7
    .line 8
    iget-object v2, p0, Lx72;->j:Loo;

    .line 9
    .line 10
    iget v2, v2, Loo;->k:I

    .line 11
    .line 12
    const/16 v3, 0x1e61

    .line 13
    .line 14
    if-ne v2, v3, :cond_1

    .line 15
    .line 16
    iget-object v2, v0, Li82;->p:Ljava/util/concurrent/ScheduledExecutorService;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput-object v2, v0, Li82;->p:Ljava/util/concurrent/ScheduledExecutorService;

    .line 26
    .line 27
    :cond_0
    new-instance v0, Lu72;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lu72;-><init>(Lx72;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lxx1;->Z:Lwx1;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Long;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 45
    .line 46
    invoke-interface {v2, v0, v3, v4, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {v0}, Li82;->A()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
