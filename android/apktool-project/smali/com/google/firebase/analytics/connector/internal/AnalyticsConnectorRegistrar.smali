.class public Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static lambda$getComponents$0(Lgm;)Lj4;
    .locals 6

    .line 1
    const-class v0, Lu30;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lu30;

    .line 8
    .line 9
    const-class v1, Landroid/content/Context;

    .line 10
    .line 11
    invoke-interface {p0, v1}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/content/Context;

    .line 16
    .line 17
    const-class v2, Loa1;

    .line 18
    .line 19
    invoke-interface {p0, v2}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Loa1;

    .line 24
    .line 25
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    sget-object v2, Lk4;->c:Lk4;

    .line 42
    .line 43
    if-nez v2, :cond_2

    .line 44
    .line 45
    const-class v2, Lk4;

    .line 46
    .line 47
    monitor-enter v2

    .line 48
    :try_start_0
    sget-object v3, Lk4;->c:Lk4;

    .line 49
    .line 50
    if-nez v3, :cond_1

    .line 51
    .line 52
    new-instance v3, Landroid/os/Bundle;

    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    invoke-direct {v3, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 56
    .line 57
    .line 58
    const-string v4, "[DEFAULT]"

    .line 59
    .line 60
    invoke-virtual {v0}, Lu30;->a()V

    .line 61
    .line 62
    .line 63
    iget-object v5, v0, Lu30;->b:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_0

    .line 70
    .line 71
    check-cast p0, Le10;

    .line 72
    .line 73
    invoke-virtual {p0}, Le10;->a()V

    .line 74
    .line 75
    .line 76
    const-string p0, "dataCollectionDefaultEnabled"

    .line 77
    .line 78
    invoke-virtual {v0}, Lu30;->g()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {v3, p0, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    goto :goto_1

    .line 88
    :cond_0
    :goto_0
    new-instance p0, Lk4;

    .line 89
    .line 90
    invoke-static {v1, v3}, Ldx1;->e(Landroid/content/Context;Landroid/os/Bundle;)Ldx1;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Ldx1;->b:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 95
    .line 96
    invoke-direct {p0, v0}, Lk4;-><init>(Lcom/google/android/gms/measurement/api/AppMeasurementSdk;)V

    .line 97
    .line 98
    .line 99
    sput-object p0, Lk4;->c:Lk4;

    .line 100
    .line 101
    :cond_1
    monitor-exit v2

    .line 102
    goto :goto_2

    .line 103
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    throw p0

    .line 105
    :cond_2
    :goto_2
    sget-object p0, Lk4;->c:Lk4;

    .line 106
    .line 107
    return-object p0
.end method

.method public static synthetic zza(Lgm;)Lj4;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;->lambda$getComponents$0(Lgm;)Lj4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwl;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lj4;

    .line 2
    .line 3
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-class v0, Lu30;

    .line 8
    .line 9
    invoke-static {v0}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lvl;->a(Lbx;)V

    .line 14
    .line 15
    .line 16
    const-class v0, Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lvl;->a(Lbx;)V

    .line 23
    .line 24
    .line 25
    const-class v0, Loa1;

    .line 26
    .line 27
    invoke-static {v0}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lvl;->a(Lbx;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lt11;->s:Lt11;

    .line 35
    .line 36
    iput-object v0, p0, Lvl;->f:Ljm;

    .line 37
    .line 38
    invoke-virtual {p0}, Lvl;->c()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "fire-analytics"

    .line 46
    .line 47
    const-string v1, "23.2.0"

    .line 48
    .line 49
    invoke-static {v0, v1}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    filled-new-array {p0, v0}, [Lwl;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method
