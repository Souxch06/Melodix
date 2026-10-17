.class public final Ly9;
.super Lju1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static volatile x:Ly9;


# direct methods
.method public static B()Ly9;
    .locals 3

    .line 1
    sget-object v0, Ly9;->x:Ly9;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ly9;->x:Ly9;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-class v0, Ly9;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ly9;->x:Ly9;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ly9;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ljw;

    .line 21
    .line 22
    invoke-direct {v2}, Ljw;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v1, Ly9;->x:Ly9;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    sget-object v0, Ly9;->x:Ly9;

    .line 32
    .line 33
    return-object v0

    .line 34
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v1
.end method
