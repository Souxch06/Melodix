.class public final Lz32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lz32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lz32;->k:Lc52;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lz32;->k:Lc52;

    .line 5
    .line 6
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ly02;

    .line 9
    .line 10
    iget-object v2, v1, Ly02;->m:Lmt1;

    .line 11
    .line 12
    invoke-virtual {v1}, Ly02;->p()Lky1;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lky1;->r()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v3, Lxx1;->d0:Lwx1;

    .line 21
    .line 22
    invoke-virtual {v2, v1, v3}, Lmt1;->u(Ljava/lang/String;Lwx1;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 31
    .line 32
    .line 33
    :try_start_1
    iget-object p0, p0, Lz32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :catchall_1
    move-exception v1

    .line 43
    iget-object p0, p0, Lz32;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 46
    .line 47
    .line 48
    throw v1

    .line 49
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p0
.end method
