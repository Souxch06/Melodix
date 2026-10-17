.class public final Ldx1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static volatile h:Ldx1;


# instance fields
.field public final a:Ljava/util/concurrent/ExecutorService;

.field public final b:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

.field public final c:Ljava/util/ArrayList;

.field public d:I

.field public e:Z

.field public volatile f:Ltv1;

.field public volatile g:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v7, Liw;

    .line 5
    .line 6
    invoke-direct {v7, p0}, Liw;-><init>(Ldx1;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 10
    .line 11
    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x1

    .line 18
    const-wide/16 v3, 0x3c

    .line 19
    .line 20
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 21
    .line 22
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ljava/util/concurrent/Executors;->unconfigurableExecutorService(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ldx1;->a:Ljava/util/concurrent/ExecutorService;

    .line 33
    .line 34
    new-instance v0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;-><init>(Ldx1;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ldx1;->b:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 40
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ldx1;->c:Ljava/util/ArrayList;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    :try_start_0
    invoke-static {p1}, Lml;->G(Landroid/content/Context;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {p1, v2}, Lst;->A(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 57
    if-nez v2, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    :try_start_1
    const-string v2, "com.google.firebase.analytics.FirebaseAnalytics"

    .line 61
    .line 62
    const-class v3, Ldx1;

    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {v2, v0, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    iput-boolean v1, p0, Ldx1;->e:Z

    .line 73
    .line 74
    return-void

    .line 75
    :catch_1
    :goto_0
    new-instance v1, Lqw1;

    .line 76
    .line 77
    invoke-direct {v1, p0, p1, p2}, Lqw1;-><init>(Ldx1;Landroid/content/Context;Landroid/os/Bundle;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Landroid/app/Application;

    .line 88
    .line 89
    if-nez p1, :cond_1

    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    new-instance p2, Lcx1;

    .line 93
    .line 94
    invoke-direct {p2, v0, p0}, Lcx1;-><init>(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, p2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static e(Landroid/content/Context;Landroid/os/Bundle;)Ldx1;
    .locals 3

    .line 1
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ldx1;->h:Ldx1;

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    const-class v0, Ldx1;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ldx1;->h:Ldx1;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ldx1;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    new-instance v2, Landroid/os/Bundle;

    .line 28
    .line 29
    invoke-direct {v2, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 30
    .line 31
    .line 32
    move-object p1, v2

    .line 33
    :goto_0
    invoke-direct {v1, p0, p1}, Ldx1;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    sput-object v1, Ldx1;->h:Ldx1;

    .line 37
    .line 38
    :cond_1
    monitor-exit v0

    .line 39
    goto :goto_2

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0

    .line 42
    :cond_2
    :goto_2
    sget-object p0, Ldx1;->h:Ldx1;

    .line 43
    .line 44
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;
    .locals 6

    .line 1
    new-instance v5, Lqv1;

    .line 2
    .line 3
    invoke-direct {v5}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Luw1;

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-object v2, p1

    .line 10
    move-object v3, p2

    .line 11
    move v4, p3

    .line 12
    invoke-direct/range {v0 .. v5}, Luw1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;ZLqv1;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ldx1;->c(Lzw1;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 p0, 0x1388

    .line 19
    .line 20
    invoke-virtual {v5, p0, p1}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/os/BaseBundle;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    new-instance p1, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/os/BaseBundle;->size()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-direct {p1, p2}, Ljava/util/HashMap;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_3

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    check-cast p3, Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    instance-of v1, v0, Ljava/lang/Double;

    .line 67
    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    instance-of v1, v0, Ljava/lang/Long;

    .line 71
    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    instance-of v1, v0, Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    :cond_2
    invoke-virtual {p1, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    return-object p1

    .line 83
    :cond_4
    :goto_1
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 84
    .line 85
    return-object p0
.end method

.method public final b(Ljava/lang/String;)I
    .locals 2

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lqw1;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Lqw1;-><init>(Ldx1;Ljava/lang/String;Lqv1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 p0, 0x2710

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-class p1, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-static {p0, p1}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/Integer;

    .line 27
    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/16 p0, 0x19

    .line 31
    .line 32
    return p0

    .line 33
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public final c(Lzw1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ldx1;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ljava/lang/Exception;ZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ldx1;->e:Z

    .line 2
    .line 3
    or-int/2addr v0, p2

    .line 4
    iput-boolean v0, p0, Ldx1;->e:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    if-eqz p3, :cond_1

    .line 10
    .line 11
    new-instance p2, Lnw1;

    .line 12
    .line 13
    invoke-direct {p2, p0, p1}, Lnw1;-><init>(Ldx1;Ljava/lang/Exception;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ldx1;->c(Lzw1;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final f(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Lqv1;

    .line 2
    .line 3
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lpw1;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, p2, v0}, Lpw1;-><init>(Ldx1;Ljava/lang/String;Ljava/lang/String;Lqv1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 p0, 0x1388

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-class p1, Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p0, p1}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/util/List;

    .line 27
    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 31
    .line 32
    :cond_0
    return-object p0
.end method

.method public final g()J
    .locals 5

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
    const/4 v2, 0x2

    .line 9
    invoke-direct {v1, p0, v0, v2}, Ltw1;-><init>(Ldx1;Lqv1;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v1, 0x1f4

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-class v1, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lqv1;->F(Landroid/os/Bundle;Ljava/lang/Class;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Long;

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Ljava/util/Random;

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    xor-long/2addr v1, v3

    .line 42
    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    iget v2, p0, Ldx1;->d:I

    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    iput v2, p0, Ldx1;->d:I

    .line 54
    .line 55
    int-to-long v2, v2

    .line 56
    add-long/2addr v0, v2

    .line 57
    return-wide v0

    .line 58
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    return-wide v0
.end method
