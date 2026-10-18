.class public final Lvx;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public c:Ljava/io/Serializable;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lai;Lm4;[Lu20;Z)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lvx;->d:Ljava/lang/Object;

    .line 41
    iput-object p2, p0, Lvx;->b:Ljava/lang/Object;

    iput-object p3, p0, Lvx;->c:Ljava/io/Serializable;

    iput-boolean p4, p0, Lvx;->a:Z

    return-void
.end method

.method public constructor <init>(Lay;Lxx;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvx;->d:Ljava/lang/Object;

    iput-object p2, p0, Lvx;->b:Ljava/lang/Object;

    .line 43
    iget-boolean p2, p2, Lxx;->e:Z

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x2

    .line 45
    new-array p1, p1, [Z

    :goto_0
    iput-object p1, p0, Lvx;->c:Ljava/io/Serializable;

    return-void
.end method

.method public constructor <init>(Lnm;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lvx;->d:Ljava/lang/Object;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lvx;->c:Ljava/io/Serializable;

    .line 13
    .line 14
    iput-boolean p2, p0, Lvx;->a:Z

    .line 15
    .line 16
    new-instance p1, Lgh0;

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    const/16 p2, 0x2000

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p2, 0x400

    .line 24
    .line 25
    :goto_0
    invoke-direct {p1, p2}, Lgh0;-><init>(I)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-direct {p2, p1, v0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;-><init>(Ljava/lang/Object;Z)V

    .line 32
    .line 33
    .line 34
    iput-object p2, p0, Lvx;->b:Ljava/lang/Object;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Lvz1;Ljava/lang/String;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvx;->d:Ljava/lang/Object;

    .line 38
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    iput-object p2, p0, Lvx;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lay;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lvx;->a:Z

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lxx;

    .line 13
    .line 14
    iget-object v1, v1, Lxx;->g:Lvx;

    .line 15
    .line 16
    invoke-static {v1, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, p0, v1}, Lay;->g(Lvx;Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Lvx;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :cond_1
    :try_start_1
    const-string p0, "Check failed."

    .line 35
    .line 36
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :goto_1
    monitor-exit v0

    .line 43
    throw p0
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lay;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lvx;->a:Z

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lxx;

    .line 13
    .line 14
    iget-object v1, v1, Lxx;->g:Lvx;

    .line 15
    .line 16
    invoke-static {v1, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p0, v2}, Lay;->g(Lvx;Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iput-boolean v2, p0, Lvx;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :cond_1
    :try_start_1
    const-string p0, "Check failed."

    .line 34
    .line 35
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    :goto_1
    monitor-exit v0

    .line 42
    throw p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lvx;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lxx;

    .line 4
    .line 5
    iget-object v1, v0, Lxx;->g:Lvx;

    .line 6
    .line 7
    invoke-static {v1, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lvx;->d:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Lay;

    .line 16
    .line 17
    iget-boolean v2, v1, Lay;->t:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {v1, p0, v0}, Lay;->g(Lvx;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    iput-boolean p0, v0, Lxx;->f:Z

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public d(I)La81;
    .locals 6

    .line 1
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lay;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lvx;->a:Z

    .line 7
    .line 8
    if-nez v1, :cond_2

    .line 9
    .line 10
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lxx;

    .line 13
    .line 14
    iget-object v1, v1, Lxx;->g:Lvx;

    .line 15
    .line 16
    invoke-static {v1, p0}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance p0, Lpg;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object p0

    .line 29
    :cond_0
    :try_start_1
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Lxx;

    .line 32
    .line 33
    iget-boolean v1, v1, Lxx;->e:Z

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lvx;->c:Ljava/io/Serializable;

    .line 39
    .line 40
    check-cast v1, [Z

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    aput-boolean v2, v1, p1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    :goto_0
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v1, Lxx;

    .line 53
    .line 54
    iget-object v1, v1, Lxx;->d:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    :try_start_3
    sget-object v3, Lnr0;->a:Ljava/util/logging/Logger;

    .line 67
    .line 68
    new-instance v3, Ljava/io/FileOutputStream;

    .line 69
    .line 70
    invoke-direct {v3, p1, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 71
    .line 72
    .line 73
    new-instance v4, Lma;

    .line 74
    .line 75
    new-instance v5, Lnc1;

    .line 76
    .line 77
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-direct {v4, v3, v2, v5}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catch_0
    :try_start_4
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 89
    .line 90
    .line 91
    sget-object v3, Lnr0;->a:Ljava/util/logging/Logger;

    .line 92
    .line 93
    new-instance v3, Ljava/io/FileOutputStream;

    .line 94
    .line 95
    invoke-direct {v3, p1, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 96
    .line 97
    .line 98
    new-instance v4, Lma;

    .line 99
    .line 100
    new-instance p1, Lnc1;

    .line 101
    .line 102
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-direct {v4, v3, v2, p1}, Lma;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 106
    .line 107
    .line 108
    :goto_1
    :try_start_5
    new-instance p1, Lt20;

    .line 109
    .line 110
    new-instance v1, Lpq;

    .line 111
    .line 112
    invoke-direct {v1, v0, v2, p0}, Lpq;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p1, v4, v1}, Lt20;-><init>(Lma;Lr80;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 116
    .line 117
    .line 118
    monitor-exit v0

    .line 119
    return-object p1

    .line 120
    :catch_1
    :try_start_6
    new-instance p0, Lpg;

    .line 121
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 123
    .line 124
    .line 125
    monitor-exit v0

    .line 126
    return-object p0

    .line 127
    :cond_2
    :try_start_7
    const-string p0, "Check failed."

    .line 128
    .line 129
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 135
    :goto_2
    monitor-exit v0

    .line 136
    throw p0
.end method

.method public e()Ljava/lang/String;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lvx;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lvx;->a:Z

    .line 7
    .line 8
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lvz1;

    .line 11
    .line 12
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lvx;->c:Ljava/io/Serializable;

    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lvx;->c:Ljava/io/Serializable;

    .line 28
    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public f(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lvx;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvz1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lvx;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lvx;->c:Ljava/io/Serializable;

    .line 24
    .line 25
    return-void
.end method
