.class public final Lta2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final h:Lny0;

.field public static final i:Lu92;


# instance fields
.field public volatile a:Lai;

.field public final b:Le52;

.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Lbe0;

.field public final f:Lmd1;

.field public final g:Ll42;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lny0;

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lny0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lta2;->h:Lny0;

    .line 9
    .line 10
    new-instance v0, Lu92;

    .line 11
    .line 12
    sget-object v1, Ljr1;->c:Ljr1;

    .line 13
    .line 14
    sget v2, Lbe0;->l:I

    .line 15
    .line 16
    sget-object v2, Lsz0;->s:Lsz0;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-direct {v0, v1, v3, v2}, Lu92;-><init>(Ln90;ZLbe0;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lta2;->i:Lu92;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Le52;Lu92;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lta2;->b:Le52;

    .line 5
    .line 6
    iget-object v0, p1, Le52;->b:Landroid/content/Context;

    .line 7
    .line 8
    iget-object v1, p2, Lu92;->d:Ljava/lang/String;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p2, Lu92;->a:Ln90;

    .line 13
    .line 14
    invoke-interface {v1, v0}, Ln90;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move-object v1, v0

    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p2, Lu92;->d:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    iput-object v1, p0, Lta2;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-boolean v0, p2, Lu92;->b:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lta2;->d:Z

    .line 28
    .line 29
    iget-object p2, p2, Lu92;->c:Lbe0;

    .line 30
    .line 31
    iput-object p2, p0, Lta2;->e:Lbe0;

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    iput-object p2, p0, Lta2;->a:Lai;

    .line 35
    .line 36
    new-instance p2, Lmd1;

    .line 37
    .line 38
    const/16 v0, 0x11

    .line 39
    .line 40
    invoke-direct {p2, v0}, Lmd1;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Lta2;->f:Lmd1;

    .line 44
    .line 45
    new-instance p2, Ll42;

    .line 46
    .line 47
    invoke-direct {p2, p1, v1}, Ll42;-><init>(Le52;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput-object p2, p0, Lta2;->g:Ll42;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final a()Lai;
    .locals 6

    .line 1
    iget-object v0, p0, Lta2;->a:Lai;

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Lta2;->a:Lai;

    .line 7
    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskWrites()Landroid/os/StrictMode$ThreadPolicy;

    .line 11
    .line 12
    .line 13
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    :try_start_1
    iget-object v1, p0, Lta2;->g:Ll42;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll42;->c()Lai;

    .line 17
    .line 18
    .line 19
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 20
    :try_start_2
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, v1, Lai;->e:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ltw0;

    .line 26
    .line 27
    iget v0, v0, Ltw0;->c:I

    .line 28
    .line 29
    add-int/lit8 v0, v0, -0x2

    .line 30
    .line 31
    const/16 v2, 0xf

    .line 32
    .line 33
    if-eq v0, v2, :cond_1

    .line 34
    .line 35
    const/16 v2, 0x10

    .line 36
    .line 37
    if-eq v0, v2, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lta2;->b:Le52;

    .line 40
    .line 41
    iget-object v2, v0, Le52;->g:Lec2;

    .line 42
    .line 43
    invoke-virtual {v2}, Lec2;->a()V

    .line 44
    .line 45
    .line 46
    iget-boolean v2, p0, Lta2;->d:Z

    .line 47
    .line 48
    if-nez v2, :cond_0

    .line 49
    .line 50
    iget-object v2, p0, Lta2;->g:Ll42;

    .line 51
    .line 52
    invoke-virtual {v2}, Ll42;->f()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_0

    .line 57
    .line 58
    iget-object v2, v1, Lai;->b:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v2, Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_0

    .line 67
    .line 68
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v2, Lx92;

    .line 73
    .line 74
    invoke-direct {v2, p0}, Lx92;-><init>(Lta2;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Lho0;->execute(Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lyb2;->y()Lyb2;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, v1, Lai;->e:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v1, Ltw0;

    .line 87
    .line 88
    new-instance v2, Lai;

    .line 89
    .line 90
    invoke-direct {v2, v0, v1}, Lai;-><init>(Lyb2;Ltw0;)V

    .line 91
    .line 92
    .line 93
    move-object v0, v2

    .line 94
    goto :goto_0

    .line 95
    :catchall_0
    move-exception v0

    .line 96
    goto :goto_2

    .line 97
    :cond_0
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance v3, Lia2;

    .line 102
    .line 103
    invoke-direct {v3, p0}, Lia2;-><init>(Lta2;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v3}, Lho0;->execute(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    iget-object v2, v0, Le52;->a:Ll42;

    .line 110
    .line 111
    iget-object v3, v1, Lai;->c:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v3, Lxo1;

    .line 114
    .line 115
    iget-object v4, p0, Lta2;->e:Lbe0;

    .line 116
    .line 117
    iget-object v5, p0, Lta2;->c:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v2, v3, v4, v5}, Ll42;->e(Lxo1;Ljava/util/Set;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lta2;->g:Ll42;

    .line 123
    .line 124
    invoke-virtual {v2}, Ll42;->f()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v2, Lz92;

    .line 135
    .line 136
    invoke-direct {v2, p0}, Lz92;-><init>(Lta2;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v2}, Lho0;->execute(Ljava/lang/Runnable;)V

    .line 140
    .line 141
    .line 142
    :cond_1
    move-object v0, v1

    .line 143
    :goto_0
    iget-boolean v1, p0, Lta2;->d:Z

    .line 144
    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object v1, v0, Lai;->e:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v1, Ltw0;

    .line 150
    .line 151
    iget v1, v1, Ltw0;->c:I

    .line 152
    .line 153
    const/16 v2, 0x11

    .line 154
    .line 155
    if-ne v1, v2, :cond_2

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    iput-object v0, p0, Lta2;->a:Lai;

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :catchall_1
    move-exception v1

    .line 162
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 163
    .line 164
    .line 165
    throw v1

    .line 166
    :cond_3
    :goto_1
    monitor-exit p0

    .line 167
    return-object v0

    .line 168
    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    throw v0

    .line 170
    :cond_4
    return-object v0
.end method

.method public final b()V
    .locals 6

    .line 1
    iget-object v0, p0, Lta2;->g:Ll42;

    .line 2
    .line 3
    iget-object v1, v0, Ll42;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Le52;

    .line 6
    .line 7
    iget-object v2, v1, Le52;->d:Lsa1;

    .line 8
    .line 9
    invoke-interface {v2}, Lsa1;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lv62;

    .line 14
    .line 15
    iget-object v3, v0, Ll42;->m:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v3, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iget-object v2, v2, Lv62;->a:Lu32;

    .line 26
    .line 27
    invoke-static {}, Lo80;->b()Lo80;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    new-instance v5, Ldb2;

    .line 32
    .line 33
    invoke-direct {v5, v3}, Ldb2;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object v5, v4, Lo80;->b:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-virtual {v4}, Lo80;->a()Lo80;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-virtual {v2, v4, v3}, Lua0;->b(ILo80;)Ljd2;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v3, Lkv1;

    .line 48
    .line 49
    const/16 v4, 0x1b

    .line 50
    .line 51
    invoke-direct {v3, v4}, Lkv1;-><init>(I)V

    .line 52
    .line 53
    .line 54
    sget-object v4, Ltx;->j:Ltx;

    .line 55
    .line 56
    invoke-virtual {v2, v4, v3}, Ljd2;->e(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v2}, Lv62;->b(Ljd2;)Lj;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget-object v3, Ljr1;->d:Ljr1;

    .line 65
    .line 66
    invoke-virtual {v1}, Le52;->a()Lho0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget v4, Lv0;->t:I

    .line 71
    .line 72
    new-instance v4, Lu0;

    .line 73
    .line 74
    invoke-direct {v4, v2, v3}, Lv0;-><init>(Lqj0;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v4}, Lrs0;->o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v2, v4, v1}, Lc0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Lba2;

    .line 85
    .line 86
    const/4 v2, 0x1

    .line 87
    invoke-direct {v1, v2, v0}, Lba2;-><init>(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lta2;->b:Le52;

    .line 91
    .line 92
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v4, v1, v2}, Lv0;->q(Lqj0;Lka;Ljava/util/concurrent/Executor;)Lt0;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Lga2;

    .line 101
    .line 102
    invoke-direct {v2, p0, v4}, Lga2;-><init>(Lta2;Lu0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Le52;->a()Lho0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v1, v2, p0}, Lc0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
