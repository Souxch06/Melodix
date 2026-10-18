.class public abstract Lhd2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicReference;

.field public static final b:Lnv1;

.field public static final c:Ljava/util/WeakHashMap;

.field public static final d:Lyu;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const/4 v0, 0x5

    .line 2
    const-string v1, "androidx.fragment.app.FragmentViewLifecycleOwner.handleLifecycleEvent"

    .line 3
    .line 4
    const-string v2, "com.google.android.libraries.logging.logger.transmitters.clearcut"

    .line 5
    .line 6
    const-string v3, "com.google.android.libraries.performance.primes.transmitter.clearcut"

    .line 7
    .line 8
    const-string v4, "com.google.android.libraries.performance.primes.metrics.crash.CrashMetricServiceImpl"

    .line 9
    .line 10
    const-string v5, "com.google.android.libraries.performance.primes.metrics.crash.applicationexit.ApplicationExitMetricServiceImpl"

    .line 11
    .line 12
    filled-new-array {v1, v2, v3, v4, v5}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lbe0;->o(I[Ljava/lang/Object;)Lbe0;

    .line 17
    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 20
    .line 21
    sget-object v1, Lsz0;->s:Lsz0;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lhd2;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 27
    .line 28
    new-instance v0, Lnv1;

    .line 29
    .line 30
    const/16 v1, 0x1b

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lnv1;-><init>(I)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lhd2;->b:Lnv1;

    .line 36
    .line 37
    new-instance v0, Ljava/util/WeakHashMap;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lhd2;->c:Ljava/util/WeakHashMap;

    .line 43
    .line 44
    new-instance v0, Lyu;

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-direct {v0, v1}, Lyu;-><init>(I)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lhd2;->d:Lyu;

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayDeque;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayDeque;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static a()Led2;
    .locals 9

    .line 1
    invoke-static {}, Lhd2;->c()Ltd2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Ltd2;->b:Led2;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    sget-object v2, Lnd2;->p:Lnd2;

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object v1

    .line 15
    :cond_1
    :goto_0
    sget-object v1, Lmd2;->o:Lab0;

    .line 16
    .line 17
    sget-object v1, Lid2;->c:Lid2;

    .line 18
    .line 19
    invoke-virtual {v1}, Lid2;->a()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    const-wide/32 v4, -0xf001

    .line 24
    .line 25
    .line 26
    and-long/2addr v2, v4

    .line 27
    invoke-virtual {v1}, Lid2;->a()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    const/4 v6, 0x2

    .line 32
    ushr-long/2addr v4, v6

    .line 33
    iget-object v1, v1, Lid2;->a:Ljava/util/UUID;

    .line 34
    .line 35
    new-instance v6, Ljava/util/UUID;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/UUID;->getMostSignificantBits()J

    .line 38
    .line 39
    .line 40
    move-result-wide v7

    .line 41
    xor-long/2addr v2, v7

    .line 42
    invoke-virtual {v1}, Ljava/util/UUID;->getLeastSignificantBits()J

    .line 43
    .line 44
    .line 45
    move-result-wide v7

    .line 46
    xor-long/2addr v4, v7

    .line 47
    invoke-direct {v6, v2, v3, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    .line 48
    .line 49
    .line 50
    invoke-static {v6}, Led2;->a(Ljava/util/UUID;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget-object v2, Lhd2;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lbe0;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-nez v3, :cond_2

    .line 67
    .line 68
    new-instance v3, Lld2;

    .line 69
    .line 70
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-interface {v2, v3}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    new-instance v2, Lmd2;

    .line 77
    .line 78
    sget-object v3, Lmd2;->o:Lab0;

    .line 79
    .line 80
    const-string v3, "<missing root>"

    .line 81
    .line 82
    invoke-direct {v2, v3, v6, v1, v0}, Led2;-><init>(Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ltd2;)V

    .line 83
    .line 84
    .line 85
    return-object v2
.end method

.method public static b(Ltd2;Led2;)Led2;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltd2;->b:Led2;

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    if-nez v0, :cond_2

    .line 10
    .line 11
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v2, 0x1d

    .line 14
    .line 15
    if-lt v1, v2, :cond_1

    .line 16
    .line 17
    invoke-static {}, Le1;->q()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object v1, Lgc2;->a:Lfc2;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    sget-object v1, Lhd2;->b:Lnv1;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const-string v1, "tiktok_systrace"

    .line 33
    .line 34
    const-string v2, "false"

    .line 35
    .line 36
    :try_start_0
    sget-object v3, Lhc2;->a:Ljava/lang/reflect/Method;

    .line 37
    .line 38
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    move-object v2, v1

    .line 50
    :catch_0
    const-string v1, "true"

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :goto_0
    iput-boolean v1, p0, Ltd2;->a:Z

    .line 57
    .line 58
    :cond_2
    iget-boolean v1, p0, Ltd2;->a:Z

    .line 59
    .line 60
    if-eqz v1, :cond_6

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    if-eqz p1, :cond_4

    .line 65
    .line 66
    iget-object v1, v0, Led2;->j:Led2;

    .line 67
    .line 68
    if-ne v1, p1, :cond_3

    .line 69
    .line 70
    invoke-static {v0}, Lea1;->p(Led2;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    iget-object v1, p1, Led2;->j:Led2;

    .line 81
    .line 82
    if-ne v0, v1, :cond_4

    .line 83
    .line 84
    invoke-static {p1}, Lea1;->p(Led2;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_4

    .line 89
    .line 90
    invoke-static {p1}, Lea1;->q(Led2;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-static {v0}, Lea1;->o(Led2;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    if-eqz p1, :cond_6

    .line 98
    .line 99
    invoke-static {p1}, Lea1;->n(Led2;)V

    .line 100
    .line 101
    .line 102
    :cond_6
    :goto_1
    if-eq v0, p1, :cond_7

    .line 103
    .line 104
    iput-object p1, p0, Ltd2;->b:Led2;

    .line 105
    .line 106
    return-object v0

    .line 107
    :cond_7
    :goto_2
    return-object p1
.end method

.method public static c()Ltd2;
    .locals 1

    .line 1
    sget-object v0, Lhd2;->d:Lyu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ltd2;

    .line 8
    .line 9
    return-object v0
.end method
