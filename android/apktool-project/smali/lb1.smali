.class public final Llb1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljd2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljd2;

    invoke-direct {v0}, Ljd2;-><init>()V

    iput-object v0, p0, Llb1;->a:Ljd2;

    return-void
.end method

.method public constructor <init>(Lny0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljd2;

    .line 5
    .line 6
    invoke-direct {v0}, Ljd2;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Llb1;->a:Ljd2;

    .line 10
    .line 11
    new-instance v0, Lmd1;

    .line 12
    .line 13
    const/16 v1, 0x13

    .line 14
    .line 15
    invoke-direct {v0, v1, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Lmd1;

    .line 19
    .line 20
    invoke-direct {p0, p1, v0}, Lmd1;-><init>(Lny0;Lmd1;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lny0;->k:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljd2;

    .line 26
    .line 27
    sget-object v0, Lmb1;->a:Lq10;

    .line 28
    .line 29
    invoke-virtual {p1, v0, p0}, Ljd2;->d(Ljava/util/concurrent/Executor;Lcs0;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object p0, p0, Llb1;->a:Ljd2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, "Exception must not be null"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lbh;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ljd2;->a:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-boolean v1, p0, Ljd2;->c:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Ljd2;->c:Z

    .line 24
    .line 25
    iput-object p1, p0, Ljd2;->f:Ljava/lang/Exception;

    .line 26
    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iget-object p1, p0, Ljd2;->b:Lo80;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lo80;->g(Ljd2;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0
.end method

.method public final b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Llb1;->a:Ljd2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljd2;->m(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
