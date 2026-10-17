.class public abstract Ly52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lda;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lda;

    .line 2
    .line 3
    invoke-direct {v0}, Lu71;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ly52;->a:Lda;

    .line 7
    .line 8
    return-void
.end method

.method public static declared-synchronized a()V
    .locals 4

    .line 1
    const-class v0, Ly52;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ly52;->a:Lda;

    .line 5
    .line 6
    invoke-virtual {v1}, Lda;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    check-cast v2, Ljl0;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljl0;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lu71;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    throw v1

    .line 37
    :cond_1
    new-instance v1, Ljava/lang/ClassCastException;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/ClassCastException;-><init>()V

    .line 40
    .line 41
    .line 42
    throw v1

    .line 43
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw v1
.end method
