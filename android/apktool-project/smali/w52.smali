.class public final Lw52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljd2;

.field public final synthetic k:Lkz1;


# direct methods
.method public constructor <init>(Lkz1;Ljd2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lw52;->j:Ljd2;

    .line 5
    .line 6
    iput-object p1, p0, Lw52;->k:Lkz1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lw52;->k:Lkz1;

    .line 2
    .line 3
    iget-object v1, v0, Lkz1;->l:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v0, v0, Lkz1;->m:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcs0;

    .line 9
    .line 10
    iget-object p0, p0, Lw52;->j:Ljd2;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljd2;->h()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {v0, p0}, Lcs0;->h(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    monitor-exit v1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method
