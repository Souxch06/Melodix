.class public final Lec2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final j:Ljava/lang/Object;

.field public static final k:Ljava/lang/Object;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lsa1;

.field public final c:Lsa1;

.field public final d:Lsa1;

.field public final e:Lsa1;

.field public final f:Lsa1;

.field public final g:Landroid/net/Uri;

.field public volatile h:Le82;

.field public final i:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lec2;->j:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lec2;->k:Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lsa1;Lsa1;Lsa1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lec2;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lec2;->c:Lsa1;

    .line 7
    .line 8
    iput-object p4, p0, Lec2;->b:Lsa1;

    .line 9
    .line 10
    iput-object p3, p0, Lec2;->d:Lsa1;

    .line 11
    .line 12
    sget-object p3, Lqc2;->a:Ljava/util/regex/Pattern;

    .line 13
    .line 14
    new-instance p3, Li7;

    .line 15
    .line 16
    invoke-direct {p3, p1}, Li7;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    const-string p4, "phenotype_storage_info"

    .line 20
    .line 21
    invoke-virtual {p3, p4}, Li7;->t(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "storage-info.pb"

    .line 25
    .line 26
    invoke-virtual {p3, v0}, Li7;->u(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3}, Li7;->v()Landroid/net/Uri;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    iput-object p3, p0, Lec2;->g:Landroid/net/Uri;

    .line 34
    .line 35
    new-instance p3, Li7;

    .line 36
    .line 37
    invoke-direct {p3, p1}, Li7;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p3, p4}, Li7;->t(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p1, "device-encrypted-storage-info.pb"

    .line 44
    .line 45
    invoke-virtual {p3, p1}, Li7;->u(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p1, Lqc2;->d:Ljava/util/Set;

    .line 49
    .line 50
    const-string p4, "directboot-files"

    .line 51
    .line 52
    invoke-interface {p1, p4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    filled-new-array {p1, p4}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string v1, "The only supported locations are %s: %s"

    .line 61
    .line 62
    invoke-static {v0, v1, p1}, Lrs0;->r(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iput-object p4, p3, Li7;->k:Ljava/lang/Object;

    .line 66
    .line 67
    invoke-virtual {p3}, Li7;->v()Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lec2;->i:Landroid/net/Uri;

    .line 72
    .line 73
    new-instance p1, Lmd1;

    .line 74
    .line 75
    const/16 p3, 0x12

    .line 76
    .line 77
    invoke-direct {p1, p3, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1}, Lkn1;->h(Lsa1;)Lsa1;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lec2;->e:Lsa1;

    .line 85
    .line 86
    new-instance p1, Lny0;

    .line 87
    .line 88
    const/16 p3, 0x1d

    .line 89
    .line 90
    invoke-direct {p1, p3, p2}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p1}, Lkn1;->h(Lsa1;)Lsa1;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lec2;->f:Lsa1;

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lec2;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lk42;->t(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p0}, Lec2;->c()Le82;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Le82;->v()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/32 v2, 0x5265c00

    .line 19
    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-gez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lec2;->c:Lsa1;

    .line 31
    .line 32
    invoke-interface {v0}, Lsa1;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lho0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lec2;->f:Lsa1;

    .line 42
    .line 43
    invoke-interface {v1}, Lsa1;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lqj0;

    .line 48
    .line 49
    invoke-static {v1}, Lk42;->m(Lqj0;)Lqj0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget v2, Lk60;->q:I

    .line 54
    .line 55
    instance-of v2, v1, Lk60;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    check-cast v1, Lk60;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    new-instance v2, Lx60;

    .line 63
    .line 64
    invoke-direct {v2, v1}, Lx60;-><init>(Lqj0;)V

    .line 65
    .line 66
    .line 67
    move-object v1, v2

    .line 68
    :goto_0
    new-instance v2, Lba2;

    .line 69
    .line 70
    const/4 v3, 0x2

    .line 71
    invoke-direct {v2, v3, p0}, Lba2;-><init>(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2, v0}, Lv0;->q(Lqj0;Lka;Ljava/util/concurrent/Executor;)Lt0;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    :goto_1
    sget-object p0, Lsd0;->k:Lsd0;

    .line 79
    .line 80
    return-void
.end method

.method public final b()Lwb2;
    .locals 12

    .line 1
    invoke-virtual {p0}, Lec2;->c()Le82;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Le82;->t()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Le82;->y()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lzd0;->o(Ljava/util/Collection;)Lzd0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0}, Le82;->s()Lxo1;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {p0}, Le82;->u()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Le82;->w()Lyp1;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lzd0;->o(Ljava/util/Collection;)Lzd0;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {p0}, Le82;->x()Lyp1;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lzd0;->o(Ljava/util/Collection;)Lzd0;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-virtual {p0}, Le82;->z()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Le82;->A()Lk82;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lk82;->s()J

    .line 52
    .line 53
    .line 54
    move-result-wide v8

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 56
    .line 57
    int-to-long v10, v0

    .line 58
    cmp-long v0, v8, v10

    .line 59
    .line 60
    if-nez v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Le82;->A()Lk82;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lk82;->r()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_0
    move-object v5, v0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    const-string v0, ""

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :goto_1
    invoke-virtual {p0}, Le82;->r()Z

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    invoke-virtual {p0}, Le82;->C()Z

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    invoke-virtual {p0}, Le82;->B()Z

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    invoke-virtual {p0}, Le82;->D()Lz72;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    new-instance v0, Lwb2;

    .line 92
    .line 93
    invoke-direct/range {v0 .. v11}, Lwb2;-><init>(ZLzd0;Lxo1;Ljava/lang/String;Ljava/lang/String;Lzd0;Lzd0;ZZZLz72;)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public final c()Le82;
    .locals 7

    .line 1
    iget-object v0, p0, Lec2;->h:Le82;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    sget-object v1, Lec2;->j:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lec2;->h:Le82;

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-static {}, Le82;->F()Le82;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lec2;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v2}, Lk42;->t(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    const/4 v2, 0x7

    .line 25
    invoke-virtual {v0, v2}, Lnp1;->q(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lqq1;

    .line 30
    .line 31
    sget-object v3, Lgp1;->a:Lgp1;

    .line 32
    .line 33
    sget v3, Lso1;->a:I

    .line 34
    .line 35
    sget-object v3, Lgp1;->b:Lgp1;

    .line 36
    .line 37
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    new-instance v5, Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 42
    .line 43
    invoke-direct {v5, v4}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v5}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitDiskReads()Landroid/os/StrictMode$ThreadPolicy$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v5}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-static {v5}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    :try_start_1
    iget-object v5, p0, Lec2;->d:Lsa1;

    .line 58
    .line 59
    invoke-interface {v5}, Lsa1;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Lmc2;

    .line 64
    .line 65
    iget-object v6, p0, Lec2;->g:Landroid/net/Uri;

    .line 66
    .line 67
    invoke-virtual {v5, v6}, Lmc2;->b(Landroid/net/Uri;)Lkc2;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-static {v5}, Lfe1;->K(Lkc2;)Ljava/io/InputStream;

    .line 72
    .line 73
    .line 74
    move-result-object v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    :try_start_2
    check-cast v2, Lmp1;

    .line 76
    .line 77
    invoke-virtual {v2, v5, v3}, Lmp1;->a(Ljava/io/InputStream;Lgp1;)Lnp1;

    .line 78
    .line 79
    .line 80
    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 81
    if-eqz v5, :cond_0

    .line 82
    .line 83
    :try_start_3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 84
    .line 85
    .line 86
    :cond_0
    check-cast v2, Le82;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 87
    .line 88
    :try_start_4
    invoke-static {v4}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 89
    .line 90
    .line 91
    move-object v0, v2

    .line 92
    goto :goto_2

    .line 93
    :catchall_0
    move-exception p0

    .line 94
    goto :goto_3

    .line 95
    :catchall_1
    move-exception p0

    .line 96
    goto :goto_1

    .line 97
    :catchall_2
    move-exception v2

    .line 98
    if-eqz v5, :cond_1

    .line 99
    .line 100
    :try_start_5
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catchall_3
    move-exception v3

    .line 105
    :try_start_6
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    :cond_1
    :goto_0
    throw v2
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 109
    :goto_1
    :try_start_7
    invoke-static {v4}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 110
    .line 111
    .line 112
    throw p0

    .line 113
    :catch_0
    invoke-static {v4}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 114
    .line 115
    .line 116
    :goto_2
    iput-object v0, p0, Lec2;->h:Le82;

    .line 117
    .line 118
    :cond_2
    monitor-exit v1

    .line 119
    return-object v0

    .line 120
    :goto_3
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 121
    throw p0

    .line 122
    :cond_3
    return-object v0
.end method
