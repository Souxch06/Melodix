.class public Lcom/google/firebase/perf/metrics/AppStartTrace;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;
.implements Lbi0;


# static fields
.field public static final F:Loc1;

.field public static final G:J

.field public static final H:J

.field public static volatile I:Lcom/google/firebase/perf/metrics/AppStartTrace;

.field public static J:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field public A:Lct0;

.field public B:Z

.field public C:I

.field public final D:Lo9;

.field public E:Z

.field public j:Z

.field public final k:Lvd1;

.field public final l:Lkn;

.field public final m:Lid1;

.field public n:Landroid/app/Application;

.field public o:Z

.field public final p:Loc1;

.field public final q:Loc1;

.field public r:Loc1;

.field public s:Loc1;

.field public t:Loc1;

.field public u:Loc1;

.field public v:Loc1;

.field public w:Loc1;

.field public x:Loc1;

.field public y:Loc1;

.field public z:Loc1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Loc1;

    .line 2
    .line 3
    invoke-direct {v0}, Loc1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 7
    .line 8
    const-wide/32 v0, 0x3938700

    .line 9
    .line 10
    .line 11
    sput-wide v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->G:J

    .line 12
    .line 13
    const-wide/32 v0, 0xc350

    .line 14
    .line 15
    .line 16
    sput-wide v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->H:J

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Lvd1;Lmz;Lkn;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->j:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->s:Loc1;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->v:Loc1;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->w:Loc1;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->x:Loc1;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->y:Loc1;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->z:Loc1;

    .line 27
    .line 28
    iput-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 29
    .line 30
    iput p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->C:I

    .line 31
    .line 32
    new-instance v1, Lo9;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lo9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->D:Lo9;

    .line 38
    .line 39
    iput-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 40
    .line 41
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->k:Lvd1;

    .line 42
    .line 43
    iput-object p3, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->l:Lkn;

    .line 44
    .line 45
    sput-object p4, Lcom/google/firebase/perf/metrics/AppStartTrace;->J:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 46
    .line 47
    invoke-static {}, Lld1;->H()Lid1;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "_experiment_app_start_ttid"

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lid1;->n(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 57
    .line 58
    invoke-static {}, Landroid/os/Process;->getStartElapsedRealtime()J

    .line 59
    .line 60
    .line 61
    move-result-wide p1

    .line 62
    sget-object p3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 63
    .line 64
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    .line 65
    .line 66
    .line 67
    move-result-wide p1

    .line 68
    invoke-static {}, Loc1;->e()J

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    invoke-static {}, Loc1;->a()J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    sub-long v3, p1, v3

    .line 77
    .line 78
    add-long/2addr v3, v1

    .line 79
    new-instance p4, Loc1;

    .line 80
    .line 81
    invoke-direct {p4, v3, v4, p1, p2}, Loc1;-><init>(JJ)V

    .line 82
    .line 83
    .line 84
    iput-object p4, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->p:Loc1;

    .line 85
    .line 86
    invoke-static {}, Lu30;->c()Lu30;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-class p2, Lkf;

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lkf;

    .line 97
    .line 98
    if-eqz p1, :cond_0

    .line 99
    .line 100
    iget-wide p1, p1, Lkf;->b:J

    .line 101
    .line 102
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    .line 103
    .line 104
    .line 105
    move-result-wide p1

    .line 106
    invoke-static {}, Loc1;->e()J

    .line 107
    .line 108
    .line 109
    move-result-wide p3

    .line 110
    invoke-static {}, Loc1;->a()J

    .line 111
    .line 112
    .line 113
    move-result-wide v0

    .line 114
    sub-long v0, p1, v0

    .line 115
    .line 116
    add-long/2addr v0, p3

    .line 117
    new-instance p3, Loc1;

    .line 118
    .line 119
    invoke-direct {p3, v0, v1, p1, p2}, Loc1;-><init>(JJ)V

    .line 120
    .line 121
    .line 122
    move-object v0, p3

    .line 123
    :cond_0
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->q:Loc1;

    .line 124
    .line 125
    return-void
.end method

.method public static e(Landroid/app/Application;)Z
    .locals 5

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/app/ActivityManager;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ":"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_4

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 54
    .line 55
    iget v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 56
    .line 57
    const/16 v4, 0x64

    .line 58
    .line 59
    if-eq v3, v4, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-nez v3, :cond_3

    .line 69
    .line 70
    iget-object v2, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 79
    return p0

    .line 80
    :cond_4
    const/4 p0, 0x0

    .line 81
    return p0
.end method

.method public static setLauncherActivityOnCreateTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static setLauncherActivityOnResumeTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static setLauncherActivityOnStartTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final a()Loc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->q:Loc1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->F:Loc1;

    .line 7
    .line 8
    return-object p0
.end method

.method public final d()Loc1;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->p:Loc1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final f(Lid1;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->x:Loc1;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->y:Loc1;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->z:Loc1;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/google/firebase/perf/metrics/AppStartTrace;->J:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 15
    .line 16
    new-instance v1, Lo6;

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-direct {v1, p0, v2, p1}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->g()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final declared-synchronized g()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    sget-object v0, Lmv0;->r:Lmv0;

    .line 9
    .line 10
    iget-object v0, v0, Lmv0;->o:Landroidx/lifecycle/a;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->n:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->j:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    throw v0
.end method

.method public final declared-synchronized onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->s:Loc1;

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v2, 0x22

    .line 11
    .line 12
    if-lt v1, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p2}, Loc1;->b()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    sget-wide v3, Lcom/google/firebase/perf/metrics/AppStartTrace;->H:J

    .line 19
    .line 20
    cmp-long p2, v1, v3

    .line 21
    .line 22
    if-lez p2, :cond_2

    .line 23
    .line 24
    :cond_1
    iput-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 25
    .line 26
    :cond_2
    const/4 p2, 0x0

    .line 27
    iput-object p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->s:Loc1;

    .line 28
    .line 29
    :goto_0
    iget-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 30
    .line 31
    if-nez p2, :cond_7

    .line 32
    .line 33
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_3
    iget-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 39
    .line 40
    if-nez p2, :cond_5

    .line 41
    .line 42
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->n:Landroid/app/Application;

    .line 43
    .line 44
    invoke-static {p2}, Lcom/google/firebase/perf/metrics/AppStartTrace;->e(Landroid/app/Application;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_4

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    const/4 p2, 0x0

    .line 52
    goto :goto_2

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_4

    .line 55
    :cond_5
    :goto_1
    move p2, v0

    .line 56
    :goto_2
    iput-boolean p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 57
    .line 58
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 59
    .line 60
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Loc1;

    .line 64
    .line 65
    invoke-direct {p1}, Loc1;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->r:Loc1;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Loc1;->c(Loc1;)J

    .line 77
    .line 78
    .line 79
    move-result-wide p1

    .line 80
    sget-wide v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->G:J

    .line 81
    .line 82
    cmp-long p1, p1, v1

    .line 83
    .line 84
    if-lez p1, :cond_6

    .line 85
    .line 86
    iput-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    .line 88
    :cond_6
    monitor-exit p0

    .line 89
    return-void

    .line 90
    :cond_7
    :goto_3
    monitor-exit p0

    .line 91
    return-void

    .line 92
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    throw p1
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->l:Lkn;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lsn;->X()Lsn;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lkn;->g(Lbe2;)Lgs0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lgs0;->b()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lgs0;->a()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const v0, 0x1020002

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->D:Lo9;

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_1
    return-void
.end method

.method public final declared-synchronized onActivityResumed(Landroid/app/Activity;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 3
    .line 4
    if-nez v0, :cond_7

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->l:Lkn;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lsn;->X()Lsn;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lkn;->g(Lbe2;)Lgs0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lgs0;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Lgs0;->a()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v2

    .line 44
    :goto_0
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const v1, 0x1020002

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v4, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->D:Lo9;

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 62
    .line 63
    .line 64
    new-instance v3, Ln9;

    .line 65
    .line 66
    invoke-direct {v3, p0, v2}, Ln9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;I)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Lo50;

    .line 70
    .line 71
    invoke-direct {v2, v1, v3}, Lo50;-><init>(Landroid/view/View;Ln9;)V

    .line 72
    .line 73
    .line 74
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 75
    .line 76
    const/16 v4, 0x1a

    .line 77
    .line 78
    const/4 v5, 0x1

    .line 79
    if-ge v3, v4, :cond_3

    .line 80
    .line 81
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_2

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_2

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    new-instance v3, Lbj;

    .line 99
    .line 100
    invoke-direct {v3, v5, v2}, Lbj;-><init>(ILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    :goto_1
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3, v2}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 112
    .line 113
    .line 114
    :goto_2
    new-instance v2, Ln9;

    .line 115
    .line 116
    invoke-direct {v2, p0, v5}, Ln9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;I)V

    .line 117
    .line 118
    .line 119
    new-instance v3, Ln9;

    .line 120
    .line 121
    const/4 v4, 0x2

    .line 122
    invoke-direct {v3, p0, v4}, Ln9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;I)V

    .line 123
    .line 124
    .line 125
    new-instance v4, Lpt0;

    .line 126
    .line 127
    invoke-direct {v4, v1, v2, v3}, Lpt0;-><init>(Landroid/view/View;Ln9;Ln9;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, v4}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :catchall_0
    move-exception p1

    .line 139
    goto :goto_5

    .line 140
    :cond_4
    :goto_3
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    .line 142
    if-eqz v1, :cond_5

    .line 143
    .line 144
    monitor-exit p0

    .line 145
    return-void

    .line 146
    :cond_5
    :try_start_1
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 147
    .line 148
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Loc1;

    .line 152
    .line 153
    invoke-direct {v1}, Loc1;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;

    .line 157
    .line 158
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->A:Lct0;

    .line 167
    .line 168
    invoke-static {}, Lg5;->c()Lg5;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->a()Loc1;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->u:Loc1;

    .line 180
    .line 181
    invoke-virtual {p1, v2}, Loc1;->c(Loc1;)J

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    sget-object p1, Lcom/google/firebase/perf/metrics/AppStartTrace;->J:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 188
    .line 189
    new-instance v1, Ln9;

    .line 190
    .line 191
    const/4 v2, 0x3

    .line 192
    invoke-direct {v1, p0, v2}, Ln9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 196
    .line 197
    .line 198
    if-nez v0, :cond_6

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->g()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    .line 202
    .line 203
    :cond_6
    monitor-exit p0

    .line 204
    return-void

    .line 205
    :cond_7
    :goto_4
    monitor-exit p0

    .line 206
    return-void

    .line 207
    :goto_5
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 208
    throw p1
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final declared-synchronized onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance p1, Loc1;

    .line 16
    .line 17
    invoke-direct {p1}, Loc1;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->t:Loc1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAppEnteredBackground()V
    .locals 3
    .annotation runtime Lzr0;
        value = .enum Lvh0;->ON_STOP:Lvh0;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->w:Loc1;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Loc1;

    .line 15
    .line 16
    invoke-direct {v0}, Loc1;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->w:Loc1;

    .line 20
    .line 21
    invoke-static {}, Lld1;->H()Lid1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "_experiment_firstBackgrounding"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lid1;->n(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-wide v1, v1, Loc1;->j:J

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->w:Loc1;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Loc1;->c(Loc1;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    invoke-virtual {v0, v1, v2}, Lid1;->m(J)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lld1;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lid1;->j(Lld1;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method

.method public onAppEnteredForeground()V
    .locals 3
    .annotation runtime Lzr0;
        value = .enum Lvh0;->ON_START:Lvh0;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->o:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->v:Loc1;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Loc1;

    .line 15
    .line 16
    invoke-direct {v0}, Loc1;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->v:Loc1;

    .line 20
    .line 21
    invoke-static {}, Lld1;->H()Lid1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "_experiment_firstForegrounding"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lid1;->n(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-wide v1, v1, Loc1;->j:J

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/google/firebase/perf/metrics/AppStartTrace;->d()Loc1;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->v:Loc1;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Loc1;->c(Loc1;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    invoke-virtual {v0, v1, v2}, Lid1;->m(J)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lld1;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/AppStartTrace;->m:Lid1;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lid1;->j(Lld1;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method
