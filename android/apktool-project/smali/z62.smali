.class public final Lz62;
.super Lnp1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final zzj:Lz62;

.field private static volatile zzk:Lqq1;


# instance fields
.field private zzb:I

.field private zze:Ljava/lang/String;

.field private zzf:Lxo1;

.field private zzg:Ljava/lang/String;

.field private zzh:J

.field private zzi:Lfq1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lz62;

    .line 2
    .line 3
    invoke-direct {v0}, Lz62;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lz62;->zzj:Lz62;

    .line 7
    .line 8
    const-class v1, Lz62;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lnp1;->m(Ljava/lang/Class;Lnp1;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lnp1;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lfq1;->k:Lfq1;

    .line 5
    .line 6
    iput-object v0, p0, Lz62;->zzi:Lfq1;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lz62;->zze:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v1, Lxo1;->k:Lwo1;

    .line 13
    .line 14
    iput-object v1, p0, Lz62;->zzf:Lxo1;

    .line 15
    .line 16
    iput-object v0, p0, Lz62;->zzg:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static x(Lap1;Lgp1;)Lz62;
    .locals 3

    .line 1
    sget-object v0, Lz62;->zzj:Lz62;

    .line 2
    .line 3
    invoke-virtual {v0}, Lnp1;->g()Lnp1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    sget-object v1, Lsq1;->c:Lsq1;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Lsq1;->a(Ljava/lang/Class;)Lvq1;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lap1;->c:Lwk;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v2, Lwk;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Lwk;-><init>(Lap1;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-interface {v1, v0, v2, p1}, Lvq1;->d(Ljava/lang/Object;Lwk;Lgp1;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v1, v0}, Lvq1;->i(Ljava/lang/Object;)V
    :try_end_0
    .catch Laq1; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lzq1; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Lnp1;->p(Lnp1;)V

    .line 34
    .line 35
    .line 36
    check-cast v0, Lz62;

    .line 37
    .line 38
    return-object v0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    instance-of p1, p1, Laq1;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Laq1;

    .line 53
    .line 54
    throw p0

    .line 55
    :cond_1
    throw p0

    .line 56
    :catch_1
    move-exception p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    instance-of p1, p1, Laq1;

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Laq1;

    .line 70
    .line 71
    throw p0

    .line 72
    :cond_2
    new-instance p1, Laq1;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    throw p1

    .line 82
    :catch_2
    move-exception p0

    .line 83
    invoke-virtual {p0}, Lzq1;->a()Laq1;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    throw p0

    .line 88
    :catch_3
    move-exception p0

    .line 89
    iget-boolean p1, p0, Laq1;->j:Z

    .line 90
    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    new-instance p1, Laq1;

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    throw p1

    .line 103
    :cond_3
    throw p0
.end method

.method public static y()Lz62;
    .locals 1

    .line 1
    sget-object v0, Lz62;->zzj:Lz62;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final q(I)Ljava/lang/Object;
    .locals 7

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_7

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p1, p0, :cond_6

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_5

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    if-eq p1, p0, :cond_4

    .line 13
    .line 14
    const/4 p0, 0x5

    .line 15
    if-eq p1, p0, :cond_3

    .line 16
    .line 17
    const/4 p0, 0x6

    .line 18
    if-ne p1, p0, :cond_2

    .line 19
    .line 20
    sget-object p0, Lz62;->zzk:Lqq1;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    const-class p1, Lz62;

    .line 25
    .line 26
    monitor-enter p1

    .line 27
    :try_start_0
    sget-object p0, Lz62;->zzk:Lqq1;

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    new-instance p0, Lmp1;

    .line 32
    .line 33
    sget-object v0, Lz62;->zzj:Lz62;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Lmp1;-><init>(Lnp1;)V

    .line 36
    .line 37
    .line 38
    sput-object p0, Lz62;->zzk:Lqq1;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit p1

    .line 45
    return-object p0

    .line 46
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0

    .line 48
    :cond_1
    return-object p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    throw p0

    .line 51
    :cond_3
    sget-object p0, Lz62;->zzj:Lz62;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    new-instance p0, Lpx1;

    .line 55
    .line 56
    sget-object p1, Lz62;->zzj:Lz62;

    .line 57
    .line 58
    invoke-direct {p0, p1}, Llp1;-><init>(Lnp1;)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_5
    new-instance p0, Lz62;

    .line 63
    .line 64
    invoke-direct {p0}, Lz62;-><init>()V

    .line 65
    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_6
    const-string v0, "zzb"

    .line 69
    .line 70
    const-string v1, "zze"

    .line 71
    .line 72
    const-string v2, "zzf"

    .line 73
    .line 74
    const-string v3, "zzg"

    .line 75
    .line 76
    const-string v4, "zzh"

    .line 77
    .line 78
    const-string v5, "zzi"

    .line 79
    .line 80
    sget-object v6, Ly62;->a:Leq1;

    .line 81
    .line 82
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget-object p1, Lz62;->zzj:Lz62;

    .line 87
    .line 88
    const-string v0, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0001\u0000\u0000\u0001\u1008\u0000\u0002\u100a\u0001\u0003\u1008\u0002\u0004\u1002\u0003\u00052"

    .line 89
    .line 90
    new-instance v1, Luq1;

    .line 91
    .line 92
    invoke-direct {v1, p1, v0, p0}, Luq1;-><init>(Lqo1;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-object v1

    .line 96
    :cond_7
    const/4 p0, 0x1

    .line 97
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public final r()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lz62;->zze:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s()Lxo1;
    .locals 0

    .line 1
    iget-object p0, p0, Lz62;->zzf:Lxo1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lz62;->zzg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final u()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lz62;->zzh:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final v()I
    .locals 0

    .line 1
    iget-object p0, p0, Lz62;->zzi:Lfq1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final w()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lz62;->zzi:Lfq1;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
