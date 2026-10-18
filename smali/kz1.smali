.class public final Lkz1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Llb2;
.implements Lcs0;
.implements Lyr0;
.implements Lvr0;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/util/concurrent/Executor;

.field public final l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcs0;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lkz1;->j:I

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    iput-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lkz1;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lpa1;Ljd2;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lkz1;->j:I

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lkz1;->l:Ljava/lang/Object;

    iput-object p3, p0, Lkz1;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lvr0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lkz1;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    .line 13
    .line 14
    iput-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    iput-object p2, p0, Lkz1;->m:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lwr0;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lkz1;->j:I

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    iput-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lkz1;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lyr0;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lkz1;->j:I

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    iput-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lkz1;->m:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljd2;)V
    .locals 2

    .line 1
    iget v0, p0, Lkz1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Ld92;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ld92;-><init>(Lkz1;Ljd2;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_0
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    iget-object v0, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    new-instance v1, Lw52;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Lw52;-><init>(Lkz1;Ljd2;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p0

    .line 41
    :cond_0
    :goto_0
    return-void

    .line 42
    :pswitch_1
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget-boolean v0, p1, Ljd2;->d:Z

    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter v0

    .line 55
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 56
    iget-object v0, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 57
    .line 58
    new-instance v1, Lk32;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1}, Lk32;-><init>(Lkz1;Ljd2;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :catchall_1
    move-exception p0

    .line 68
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 69
    throw p0

    .line 70
    :cond_1
    :goto_1
    return-void

    .line 71
    :pswitch_2
    iget-object v0, p0, Lkz1;->l:Ljava/lang/Object;

    .line 72
    .line 73
    monitor-enter v0

    .line 74
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 75
    iget-object v0, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 76
    .line 77
    new-instance v1, Lv02;

    .line 78
    .line 79
    invoke-direct {v1, p0, p1}, Lv02;-><init>(Lkz1;Ljd2;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :catchall_2
    move-exception p0

    .line 87
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 88
    throw p0

    .line 89
    :pswitch_3
    iget-boolean p1, p1, Ljd2;->d:Z

    .line 90
    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    iget-object p1, p0, Lkz1;->l:Ljava/lang/Object;

    .line 94
    .line 95
    monitor-enter p1

    .line 96
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 97
    iget-object p1, p0, Lkz1;->k:Ljava/util/concurrent/Executor;

    .line 98
    .line 99
    new-instance v0, Lby1;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Lby1;-><init>(Lkz1;)V

    .line 102
    .line 103
    .line 104
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :catchall_3
    move-exception p0

    .line 109
    :try_start_7
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 110
    throw p0

    .line 111
    :cond_2
    :goto_2
    return-void

    .line 112
    nop

    .line 113
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lkz1;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljd2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljd2;->o()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lkz1;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljd2;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljd2;->l(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lkz1;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljd2;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
