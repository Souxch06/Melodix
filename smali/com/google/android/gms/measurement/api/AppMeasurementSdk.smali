.class public Lcom/google/android/gms/measurement/api/AppMeasurementSdk;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ldx1;


# direct methods
.method public constructor <init>(Ldx1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 5
    .line 6
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/gms/measurement/api/AppMeasurementSdk;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ldx1;->e(Landroid/content/Context;Landroid/os/Bundle;)Ldx1;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    iget-object p0, p0, Ldx1;->b:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 7
    .line 8
    return-object p0
.end method


# virtual methods
.method public final a(Liw1;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 2
    .line 3
    iget-object v0, p0, Ldx1;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/util/Pair;

    .line 18
    .line 19
    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    new-instance v1, Lax1;

    .line 35
    .line 36
    invoke-direct {v1, p1}, Lax1;-><init>(Lx22;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Landroid/util/Pair;

    .line 40
    .line 41
    invoke-direct {v2, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    iget-object p1, p0, Ldx1;->f:Ltv1;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    :try_start_1
    iget-object p1, p0, Ldx1;->f:Ltv1;

    .line 53
    .line 54
    invoke-interface {p1, v1}, Ltv1;->registerOnMeasurementEventListener(Lzv1;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/BadParcelableException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/NetworkOnMainThreadException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    :cond_2
    new-instance p1, Lnw1;

    .line 59
    .line 60
    const/4 v0, 0x3

    .line 61
    invoke-direct {p1, p0, v1, v0}, Lnw1;-><init>(Ldx1;Ljava/lang/Object;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ldx1;->c(Lzw1;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    throw p0
.end method

.method public beginAdUnitExposure(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lrw1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1}, Lrw1;-><init>(Ldx1;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public endAdUnitExposure(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lrw1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1}, Lrw1;-><init>(Ldx1;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public generateEventId()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ldx1;->g()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getAppInstanceId()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, v2}, Ltw1;-><init>(Ldx1;Lqv1;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x32

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-class v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public getGmpAppId()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltw1;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, v2}, Ltw1;-><init>(Ldx1;Lqv1;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x1f4

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-class v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, v0}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6

    .line 1
    new-instance v0, Low1;

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Low1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ldx1;->c(Lzw1;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
