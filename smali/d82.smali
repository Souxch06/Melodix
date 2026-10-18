.class public final synthetic Ld82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Li82;

.field public final synthetic k:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic l:Lbc2;

.field public final synthetic m:Lv92;


# direct methods
.method public synthetic constructor <init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;Lbc2;Lv92;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld82;->j:Li82;

    .line 5
    .line 6
    iput-object p2, p0, Ld82;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    iput-object p3, p0, Ld82;->l:Lbc2;

    .line 9
    .line 10
    iput-object p4, p0, Ld82;->m:Lv92;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ld82;->j:Li82;

    .line 2
    .line 3
    iget-object v1, p0, Ld82;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    iget-object v2, p0, Ld82;->l:Lbc2;

    .line 6
    .line 7
    iget-object p0, p0, Ld82;->m:Lv92;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v3, v0, Li82;->m:Lcy1;

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    iget-object p0, v0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Ly02;

    .line 17
    .line 18
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 19
    .line 20
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 24
    .line 25
    const-string v2, "[sgtm] Failed to get upload batches; not connected to service"

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Lso;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_2

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    :try_start_2
    new-instance v4, Lg62;

    .line 37
    .line 38
    invoke-direct {v4, v0, v1}, Lg62;-><init>(Li82;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v3, v2, p0, v4}, Lcy1;->m(Lbc2;Lv92;Liy1;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Li82;->y()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :goto_0
    :try_start_3
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Ly02;

    .line 51
    .line 52
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 53
    .line 54
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 58
    .line 59
    const-string v2, "[sgtm] Failed to get upload batches; remote exception"

    .line 60
    .line 61
    invoke-virtual {v0, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 65
    .line 66
    .line 67
    :goto_1
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :goto_2
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 70
    throw p0
.end method
