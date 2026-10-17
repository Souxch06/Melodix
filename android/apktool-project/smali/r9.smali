.class public final Lr9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field public static volatile A:Lr9;

.field public static final z:Lg5;


# instance fields
.field public final j:Ljava/util/WeakHashMap;

.field public final k:Ljava/util/WeakHashMap;

.field public final l:Ljava/util/WeakHashMap;

.field public final m:Ljava/util/WeakHashMap;

.field public final n:Ljava/util/HashMap;

.field public final o:Ljava/util/HashSet;

.field public final p:Ljava/util/HashSet;

.field public final q:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final r:Lvd1;

.field public final s:Lkn;

.field public final t:Lmz;

.field public u:Loc1;

.field public v:Loc1;

.field public w:Lx9;

.field public x:Z

.field public y:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lr9;->z:Lg5;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lvd1;Lmz;)V
    .locals 3

    .line 1
    invoke-static {}, Lkn;->e()Lkn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ln80;->e:Lg5;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/util/WeakHashMap;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 16
    .line 17
    new-instance v1, Ljava/util/WeakHashMap;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 23
    .line 24
    new-instance v1, Ljava/util/WeakHashMap;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lr9;->l:Ljava/util/WeakHashMap;

    .line 30
    .line 31
    new-instance v1, Ljava/util/WeakHashMap;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lr9;->m:Ljava/util/WeakHashMap;

    .line 37
    .line 38
    new-instance v1, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lr9;->n:Ljava/util/HashMap;

    .line 44
    .line 45
    new-instance v1, Ljava/util/HashSet;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lr9;->o:Ljava/util/HashSet;

    .line 51
    .line 52
    new-instance v1, Ljava/util/HashSet;

    .line 53
    .line 54
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Lr9;->p:Ljava/util/HashSet;

    .line 58
    .line 59
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 63
    .line 64
    .line 65
    iput-object v1, p0, Lr9;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    .line 67
    sget-object v1, Lx9;->m:Lx9;

    .line 68
    .line 69
    iput-object v1, p0, Lr9;->w:Lx9;

    .line 70
    .line 71
    iput-boolean v2, p0, Lr9;->x:Z

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    iput-boolean v1, p0, Lr9;->y:Z

    .line 75
    .line 76
    iput-object p1, p0, Lr9;->r:Lvd1;

    .line 77
    .line 78
    iput-object p2, p0, Lr9;->t:Lmz;

    .line 79
    .line 80
    iput-object v0, p0, Lr9;->s:Lkn;

    .line 81
    .line 82
    return-void
.end method

.method public static a()Lr9;
    .locals 5

    .line 1
    sget-object v0, Lr9;->A:Lr9;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lr9;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lr9;->A:Lr9;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lr9;

    .line 13
    .line 14
    sget-object v2, Lvd1;->B:Lvd1;

    .line 15
    .line 16
    new-instance v3, Lmz;

    .line 17
    .line 18
    const/16 v4, 0xb

    .line 19
    .line 20
    invoke-direct {v3, v4}, Lmz;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v1, v2, v3}, Lr9;-><init>(Lvd1;Lmz;)V

    .line 24
    .line 25
    .line 26
    sput-object v1, Lr9;->A:Lr9;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit v0

    .line 32
    goto :goto_2

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v1

    .line 35
    :cond_1
    :goto_2
    sget-object v0, Lr9;->A:Lr9;

    .line 36
    .line 37
    return-object v0
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lr9;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lr9;->n:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    iget-object p0, p0, Lr9;->n:Ljava/util/HashMap;

    .line 13
    .line 14
    const-wide/16 v2, 0x1

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    add-long/2addr v4, v2

    .line 33
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :goto_0
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p0
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lr9;->p:Ljava/util/HashSet;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lr9;->p:Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lr40;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    :try_start_1
    sget-object v1, Lq40;->b:Lg5;

    .line 25
    .line 26
    invoke-static {}, Lu30;->c()Lu30;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-class v2, Lq40;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lq40;
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception v1

    .line 40
    :try_start_2
    sget-object v2, Lr40;->a:Lg5;

    .line 41
    .line 42
    const-string v3, "FirebaseApp is not initialized. Firebase Performance will not be collecting any performance metrics until initialized. %s"

    .line 43
    .line 44
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v2, v3, v1}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    throw p0
.end method

.method public final d(Landroid/app/Activity;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lr9;->m:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ln80;

    .line 22
    .line 23
    iget-object v0, p0, Ln80;->b:Lbv1;

    .line 24
    .line 25
    iget-object v2, p0, Ln80;->c:Ljava/util/HashMap;

    .line 26
    .line 27
    sget-object v3, Ln80;->e:Lg5;

    .line 28
    .line 29
    iget-boolean v4, p0, Ln80;->d:Z

    .line 30
    .line 31
    if-nez v4, :cond_1

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    new-instance p0, Lgs0;

    .line 37
    .line 38
    invoke-direct {p0}, Lgs0;-><init>()V

    .line 39
    .line 40
    .line 41
    goto :goto_3

    .line 42
    :cond_1
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p0}, Ln80;->a()Lgs0;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    :try_start_0
    iget-object v4, p0, Ln80;->a:Landroid/app/Activity;

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Lbv1;->q(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catch_0
    move-exception v2

    .line 65
    goto :goto_0

    .line 66
    :catch_1
    move-exception v2

    .line 67
    :goto_0
    instance-of v4, v2, Ljava/lang/NullPointerException;

    .line 68
    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 72
    .line 73
    const/16 v5, 0x1c

    .line 74
    .line 75
    if-gt v4, v5, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    throw v2

    .line 79
    :cond_4
    :goto_1
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v4, "View not hardware accelerated. Unable to collect FrameMetrics. %s"

    .line 88
    .line 89
    invoke-virtual {v3, v4, v2}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Lgs0;

    .line 93
    .line 94
    invoke-direct {v2}, Lgs0;-><init>()V

    .line 95
    .line 96
    .line 97
    :goto_2
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v0, Ll80;

    .line 100
    .line 101
    const/16 v3, 0x9

    .line 102
    .line 103
    new-array v3, v3, [Landroid/util/SparseIntArray;

    .line 104
    .line 105
    iput-object v3, v0, Ll80;->b:Ljava/lang/Object;

    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    iput-boolean v0, p0, Ln80;->d:Z

    .line 109
    .line 110
    move-object p0, v2

    .line 111
    :goto_3
    invoke-virtual {p0}, Lgs0;->b()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_5

    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    sget-object p1, Lr9;->z:Lg5;

    .line 130
    .line 131
    const-string v0, "Failed to record frame data for %s."

    .line 132
    .line 133
    invoke-virtual {p1, v0, p0}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_5
    invoke-virtual {p0}, Lgs0;->a()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lm80;

    .line 142
    .line 143
    invoke-static {v1, p0}, Li31;->a(Lcom/google/firebase/perf/metrics/Trace;Lm80;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/google/firebase/perf/metrics/Trace;->stop()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final e(Ljava/lang/String;Loc1;Loc1;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lr9;->s:Lkn;

    .line 2
    .line 3
    invoke-virtual {v0}, Lkn;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lld1;->H()Lid1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Lid1;->n(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-wide v1, p2, Loc1;->j:J

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p3}, Loc1;->c(Loc1;)J

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    invoke-virtual {v0, p1, p2}, Lid1;->m(J)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/google/firebase/perf/session/SessionManager;->perfSession()Lct0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lct0;->a()Lbt0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0}, Lea0;->i()V

    .line 42
    .line 43
    .line 44
    iget-object p2, v0, Lea0;->k:Lia0;

    .line 45
    .line 46
    check-cast p2, Lld1;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Lld1;->t(Lbt0;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lr9;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    .line 53
    const/4 p2, 0x0

    .line 54
    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget-object p2, p0, Lr9;->n:Ljava/util/HashMap;

    .line 59
    .line 60
    monitor-enter p2

    .line 61
    :try_start_0
    iget-object p3, p0, Lr9;->n:Ljava/util/HashMap;

    .line 62
    .line 63
    invoke-virtual {v0}, Lea0;->i()V

    .line 64
    .line 65
    .line 66
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 67
    .line 68
    check-cast v1, Lld1;

    .line 69
    .line 70
    invoke-virtual {v1}, Lld1;->F()Lml0;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, p3}, Lml0;->putAll(Ljava/util/Map;)V

    .line 75
    .line 76
    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    const-string p3, "_tsns"

    .line 80
    .line 81
    int-to-long v1, p1

    .line 82
    invoke-virtual {v0, p3, v1, v2}, Lid1;->k(Ljava/lang/String;J)V

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
    :cond_1
    :goto_0
    iget-object p1, p0, Lr9;->n:Ljava/util/HashMap;

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 91
    .line 92
    .line 93
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    iget-object p0, p0, Lr9;->r:Lvd1;

    .line 95
    .line 96
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lld1;

    .line 101
    .line 102
    sget-object p2, Lx9;->n:Lx9;

    .line 103
    .line 104
    invoke-virtual {p0, p1, p2}, Lvd1;->c(Lld1;Lx9;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :goto_1
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    throw p0
.end method

.method public final f(Landroid/app/Activity;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lr9;->s:Lkn;

    .line 2
    .line 3
    invoke-virtual {v0}, Lkn;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ln80;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ln80;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 15
    .line 16
    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    instance-of v1, p1, Le6;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    new-instance v1, Lf80;

    .line 24
    .line 25
    iget-object v2, p0, Lr9;->t:Lmz;

    .line 26
    .line 27
    iget-object v3, p0, Lr9;->r:Lvd1;

    .line 28
    .line 29
    invoke-direct {v1, v2, v3, p0, v0}, Lf80;-><init>(Lmz;Lvd1;Lr9;Ln80;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lr9;->l:Ljava/util/WeakHashMap;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    check-cast p1, Le6;

    .line 38
    .line 39
    invoke-virtual {p1}, Le6;->l()Lz70;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lz70;->l:Ls7;

    .line 44
    .line 45
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 48
    .line 49
    new-instance p1, Lo70;

    .line 50
    .line 51
    invoke-direct {p1, v1}, Lo70;-><init>(Lf80;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final g(Lx9;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lr9;->w:Lx9;

    .line 2
    .line 3
    iget-object p1, p0, Lr9;->o:Ljava/util/HashSet;

    .line 4
    .line 5
    monitor-enter p1

    .line 6
    :try_start_0
    iget-object v0, p0, Lr9;->o:Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lq9;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lr9;->w:Lx9;

    .line 33
    .line 34
    invoke-interface {v1, v2}, Lq9;->onUpdateAppState(Lx9;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    monitor-exit p1

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lr9;->f(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lr9;->l:Ljava/util/WeakHashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Le6;

    .line 16
    .line 17
    invoke-virtual {v0}, Le6;->l()Lz70;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Lr9;->l:Ljava/util/WeakHashMap;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lf80;

    .line 28
    .line 29
    iget-object p1, v0, Lz70;->l:Ls7;

    .line 30
    .line 31
    iget-object v0, p1, Ls7;->k:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 34
    .line 35
    monitor-enter v0

    .line 36
    :try_start_0
    iget-object v1, p1, Ls7;->k:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x0

    .line 45
    :goto_0
    if-ge v2, v1, :cond_1

    .line 46
    .line 47
    iget-object v3, p1, Ls7;->k:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 50
    .line 51
    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lo70;

    .line 56
    .line 57
    iget-object v3, v3, Lo70;->a:Lf80;

    .line 58
    .line 59
    if-ne v3, p0, :cond_0

    .line 60
    .line 61
    iget-object p0, p1, Ls7;->k:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    goto :goto_2

    .line 71
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    :goto_1
    monitor-exit v0

    .line 75
    return-void

    .line 76
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0

    .line 78
    :cond_2
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final declared-synchronized onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/WeakHashMap;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Loc1;

    .line 11
    .line 12
    invoke-direct {v0}, Loc1;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lr9;->u:Loc1;

    .line 16
    .line 17
    iget-object v0, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 18
    .line 19
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    iget-boolean p1, p0, Lr9;->y:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lx9;->l:Lx9;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lr9;->g(Lx9;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lr9;->c()V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lr9;->y:Z

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    const-string p1, "_bs"

    .line 43
    .line 44
    iget-object v0, p0, Lr9;->v:Loc1;

    .line 45
    .line 46
    iget-object v1, p0, Lr9;->u:Loc1;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0, v1}, Lr9;->e(Ljava/lang/String;Loc1;Loc1;)V

    .line 49
    .line 50
    .line 51
    sget-object p1, Lx9;->l:Lx9;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lr9;->g(Lx9;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v0, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 58
    .line 59
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    :goto_0
    monitor-exit p0

    .line 65
    return-void

    .line 66
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    throw p1
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final declared-synchronized onActivityStarted(Landroid/app/Activity;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lr9;->s:Lkn;

    .line 3
    .line 4
    invoke-virtual {v0}, Lkn;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lr9;->f(Landroid/app/Activity;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-object v0, p0, Lr9;->k:Ljava/util/WeakHashMap;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ln80;

    .line 31
    .line 32
    invoke-virtual {v0}, Ln80;->b()V

    .line 33
    .line 34
    .line 35
    new-instance v0, Lcom/google/firebase/perf/metrics/Trace;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "_st_"

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lr9;->r:Lvd1;

    .line 52
    .line 53
    iget-object v3, p0, Lr9;->t:Lmz;

    .line 54
    .line 55
    invoke-direct {v0, v1, v2, v3, p0}, Lcom/google/firebase/perf/metrics/Trace;-><init>(Ljava/lang/String;Lvd1;Lmz;Lr9;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/google/firebase/perf/metrics/Trace;->start()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lr9;->m:Ljava/util/WeakHashMap;

    .line 62
    .line 63
    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    :cond_1
    monitor-exit p0

    .line 67
    return-void

    .line 68
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    throw p1
.end method

.method public final declared-synchronized onActivityStopped(Landroid/app/Activity;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lr9;->d(Landroid/app/Activity;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lr9;->j:Ljava/util/WeakHashMap;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/util/WeakHashMap;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    new-instance p1, Loc1;

    .line 27
    .line 28
    invoke-direct {p1}, Loc1;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lr9;->v:Loc1;

    .line 32
    .line 33
    const-string v0, "_fs"

    .line 34
    .line 35
    iget-object v1, p0, Lr9;->u:Loc1;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, p1}, Lr9;->e(Ljava/lang/String;Loc1;Loc1;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Lx9;->m:Lx9;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lr9;->g(Lx9;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw p1
.end method
