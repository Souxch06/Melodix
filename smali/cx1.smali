.class public final Lcx1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lcx1;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lcx1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final a(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method private final b(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public c(Lmw1;Landroid/os/Bundle;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lc52;

    .line 4
    .line 5
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Ly02;

    .line 9
    .line 10
    :try_start_0
    iget-object v0, v1, Ly02;->o:Lzy1;

    .line 11
    .line 12
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 16
    .line 17
    const-string v2, "onActivityCreated"

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lso;->b(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lmw1;->l:Landroid/content/Intent;

    .line 23
    .line 24
    if-eqz v0, :cond_6

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/net/Uri;->isHierarchical()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    move-object v5, v2

    .line 40
    goto :goto_2

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    goto/16 :goto_9

    .line 44
    .line 45
    :catch_0
    move-exception v0

    .line 46
    move-object p0, v0

    .line 47
    goto :goto_8

    .line 48
    :cond_1
    :goto_1
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/4 v3, 0x0

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    const-string v4, "com.android.vending.referral_url"

    .line 56
    .line 57
    invoke-virtual {v2, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-nez v4, :cond_2

    .line 66
    .line 67
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    move-object v5, v3

    .line 73
    :goto_2
    if-eqz v5, :cond_6

    .line 74
    .line 75
    invoke-virtual {v5}, Landroid/net/Uri;->isHierarchical()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_3

    .line 80
    .line 81
    goto :goto_7

    .line 82
    :cond_3
    iget-object v2, v1, Ly02;->r:Lcb2;

    .line 83
    .line 84
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Lcb2;->n0(Landroid/content/Intent;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    const-string v0, "gs"

    .line 94
    .line 95
    :goto_3
    move-object v6, v0

    .line 96
    goto :goto_4

    .line 97
    :cond_4
    const-string v0, "auto"

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :goto_4
    const-string v0, "referrer"

    .line 101
    .line 102
    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    if-nez p2, :cond_5

    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    :goto_5
    move v4, v0

    .line 110
    goto :goto_6

    .line 111
    :cond_5
    const/4 v0, 0x0

    .line 112
    goto :goto_5

    .line 113
    :goto_6
    iget-object v0, v1, Ly02;->p:Ls02;

    .line 114
    .line 115
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 116
    .line 117
    .line 118
    new-instance v2, Lj42;

    .line 119
    .line 120
    move-object v3, p0

    .line 121
    invoke-direct/range {v2 .. v7}, Lj42;-><init>(Lcx1;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ls02;->u(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    .line 126
    .line 127
    :cond_6
    :goto_7
    iget-object p0, v1, Ly02;->u:Lz52;

    .line 128
    .line 129
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p1, p2}, Lz52;->s(Lmw1;Landroid/os/Bundle;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :goto_8
    :try_start_1
    iget-object v0, v1, Ly02;->o:Lzy1;

    .line 137
    .line 138
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 142
    .line 143
    const-string v2, "Throwable caught in onActivityCreated"

    .line 144
    .line 145
    invoke-virtual {v0, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    .line 147
    .line 148
    goto :goto_7

    .line 149
    :goto_9
    iget-object v0, v1, Ly02;->u:Lz52;

    .line 150
    .line 151
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, p1, p2}, Lz52;->s(Lmw1;Landroid/os/Bundle;)V

    .line 155
    .line 156
    .line 157
    throw p0
.end method

.method public d(Lmw1;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lc52;

    .line 4
    .line 5
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ly02;

    .line 8
    .line 9
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 10
    .line 11
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lz52;->u:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget-object v1, p0, Lz52;->p:Lmw1;

    .line 18
    .line 19
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-object v1, p0, Lz52;->p:Lmw1;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ly02;

    .line 35
    .line 36
    iget-object v0, v0, Ly02;->m:Lmt1;

    .line 37
    .line 38
    invoke-virtual {v0}, Lmt1;->A()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object p0, p0, Lz52;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 46
    .line 47
    iget p1, p1, Lmw1;->j:I

    .line 48
    .line 49
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p0
.end method

.method public e(Lmw1;)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lc52;

    .line 4
    .line 5
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ly02;

    .line 8
    .line 9
    iget-object v0, p0, Ly02;->u:Lz52;

    .line 10
    .line 11
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lz52;->u:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v1

    .line 17
    const/4 v2, 0x0

    .line 18
    :try_start_0
    iput-boolean v2, v0, Lz52;->t:Z

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    iput-boolean v2, v0, Lz52;->q:Z

    .line 22
    .line 23
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Ly02;

    .line 27
    .line 28
    iget-object v2, v1, Ly02;->t:Lmz;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    iget-object v4, v1, Ly02;->m:Lmt1;

    .line 38
    .line 39
    invoke-virtual {v4}, Lmt1;->A()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    const/4 v5, 0x0

    .line 44
    if-nez v4, :cond_0

    .line 45
    .line 46
    iput-object v5, v0, Lz52;->l:Lm52;

    .line 47
    .line 48
    iget-object p1, v1, Ly02;->p:Ls02;

    .line 49
    .line 50
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ls52;

    .line 54
    .line 55
    invoke-direct {v1, v0, v2, v3}, Ls52;-><init>(Lz52;J)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {v0, p1}, Lz52;->v(Lmw1;)Lm52;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v4, v0, Lz52;->l:Lm52;

    .line 67
    .line 68
    iput-object v4, v0, Lz52;->m:Lm52;

    .line 69
    .line 70
    iput-object v5, v0, Lz52;->l:Lm52;

    .line 71
    .line 72
    iget-object v1, v1, Ly02;->p:Ls02;

    .line 73
    .line 74
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 75
    .line 76
    .line 77
    new-instance v4, Lu52;

    .line 78
    .line 79
    invoke-direct {v4, v0, p1, v2, v3}, Lu52;-><init>(Lz52;Lm52;J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v4}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object p0, p0, Ly02;->q:Lh92;

    .line 86
    .line 87
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p1, Ly02;

    .line 93
    .line 94
    iget-object v0, p1, Ly02;->t:Lmz;

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    .line 98
    .line 99
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 100
    .line 101
    .line 102
    move-result-wide v0

    .line 103
    iget-object p1, p1, Ly02;->p:Ls02;

    .line 104
    .line 105
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 106
    .line 107
    .line 108
    new-instance v2, Lu82;

    .line 109
    .line 110
    invoke-direct {v2, p0, v0, v1}, Lu82;-><init>(Lh92;J)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :catchall_0
    move-exception p0

    .line 118
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    throw p0
.end method

.method public f(Lmw1;)V
    .locals 5

    .line 1
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lc52;

    .line 4
    .line 5
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ly02;

    .line 8
    .line 9
    iget-object v0, p0, Ly02;->q:Lh92;

    .line 10
    .line 11
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Ly02;

    .line 17
    .line 18
    iget-object v2, v1, Ly02;->t:Lmz;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    iget-object v1, v1, Ly02;->p:Ls02;

    .line 28
    .line 29
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 30
    .line 31
    .line 32
    new-instance v4, Lt82;

    .line 33
    .line 34
    invoke-direct {v4, v0, v2, v3}, Lt82;-><init>(Lh92;J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v4}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 41
    .line 42
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lz52;->u:Ljava/lang/Object;

    .line 46
    .line 47
    monitor-enter v0

    .line 48
    const/4 v1, 0x1

    .line 49
    :try_start_0
    iput-boolean v1, p0, Lz52;->t:Z

    .line 50
    .line 51
    iget-object v1, p0, Lz52;->p:Lmw1;

    .line 52
    .line 53
    invoke-static {p1, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/4 v2, 0x0

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    :try_start_1
    iput-object p1, p0, Lz52;->p:Lmw1;

    .line 63
    .line 64
    iput-boolean v2, p0, Lz52;->q:Z

    .line 65
    .line 66
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 67
    :try_start_2
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v1, Ly02;

    .line 70
    .line 71
    iget-object v3, v1, Ly02;->m:Lmt1;

    .line 72
    .line 73
    invoke-virtual {v3}, Lmt1;->A()Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_1

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    iput-object v3, p0, Lz52;->r:Lm52;

    .line 81
    .line 82
    iget-object v1, v1, Ly02;->p:Ls02;

    .line 83
    .line 84
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 85
    .line 86
    .line 87
    new-instance v3, Lx52;

    .line 88
    .line 89
    invoke-direct {v3, p0}, Lx52;-><init>(Lz52;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v3}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :catchall_0
    move-exception p0

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Ly02;

    .line 102
    .line 103
    iget-object v1, v0, Ly02;->m:Lmt1;

    .line 104
    .line 105
    invoke-virtual {v1}, Lmt1;->A()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_2

    .line 110
    .line 111
    iget-object p1, p0, Lz52;->r:Lm52;

    .line 112
    .line 113
    iput-object p1, p0, Lz52;->l:Lm52;

    .line 114
    .line 115
    iget-object p1, v0, Ly02;->p:Ls02;

    .line 116
    .line 117
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 118
    .line 119
    .line 120
    new-instance v0, Lq52;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Lq52;-><init>(Lz52;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_2
    invoke-virtual {p0, p1}, Lz52;->v(Lmw1;)Lm52;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object p1, p1, Lmw1;->k:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p0, p1, v0, v2}, Lz52;->t(Ljava/lang/String;Lm52;Z)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast p0, Ly02;

    .line 141
    .line 142
    iget-object p0, p0, Ly02;->w:Lfw1;

    .line 143
    .line 144
    invoke-static {p0}, Ly02;->i(Lgx1;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast p1, Ly02;

    .line 150
    .line 151
    iget-object v0, p1, Ly02;->t:Lmz;

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    .line 155
    .line 156
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 157
    .line 158
    .line 159
    move-result-wide v0

    .line 160
    iget-object p1, p1, Ly02;->p:Ls02;

    .line 161
    .line 162
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 163
    .line 164
    .line 165
    new-instance v2, Lhv1;

    .line 166
    .line 167
    invoke-direct {v2, p0, v0, v1}, Lhv1;-><init>(Lfw1;J)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, v2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :catchall_1
    move-exception p0

    .line 175
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 176
    :try_start_4
    throw p0

    .line 177
    :goto_1
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 178
    throw p0
.end method

.method public g(Lmw1;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lc52;

    .line 4
    .line 5
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ly02;

    .line 8
    .line 9
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 10
    .line 11
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ly02;

    .line 17
    .line 18
    iget-object v0, v0, Ly02;->m:Lmt1;

    .line 19
    .line 20
    invoke-virtual {v0}, Lmt1;->A()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lz52;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 30
    .line 31
    iget p1, p1, Lmw1;->j:I

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lm52;

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    new-instance p1, Landroid/os/Bundle;

    .line 46
    .line 47
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v0, "id"

    .line 51
    .line 52
    iget-wide v1, p0, Lm52;->c:J

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    const-string v0, "name"

    .line 58
    .line 59
    iget-object v1, p0, Lm52;->a:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "referrer_name"

    .line 65
    .line 66
    iget-object p0, p0, Lm52;->b:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const-string p0, "com.google.app_measurement.screen_service"

    .line 72
    .line 73
    invoke-virtual {p2, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1, p2}, Lcx1;->c(Lmw1;Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    new-instance v0, Lqw1;

    .line 15
    .line 16
    invoke-direct {v0, p0, p2, p1}, Lqw1;-><init>(Lcx1;Landroid/os/Bundle;Landroid/app/Activity;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ldx1;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcx1;->d(Lmw1;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    new-instance v0, Lbx1;

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    invoke-direct {v0, p0, p1, v1}, Lbx1;-><init>(Lcx1;Landroid/app/Activity;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ldx1;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcx1;->e(Lmw1;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    new-instance v0, Lbx1;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-direct {v0, p0, p1, v1}, Lbx1;-><init>(Lcx1;Landroid/app/Activity;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ldx1;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcx1;->f(Lmw1;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    new-instance v0, Lbx1;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {v0, p0, p1, v1}, Lbx1;-><init>(Lcx1;Landroid/app/Activity;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ldx1;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1, p2}, Lcx1;->g(Lmw1;Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    new-instance v0, Lqv1;

    .line 15
    .line 16
    invoke-direct {v0}, Lqv1;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lqw1;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, v0}, Lqw1;-><init>(Lcx1;Landroid/app/Activity;Lqv1;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ldx1;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ldx1;->c(Lzw1;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 p0, 0x32

    .line 32
    .line 33
    invoke-virtual {v0, p0, p1}, Lqv1;->b(J)Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void

    .line 43
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    new-instance v0, Lbx1;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {v0, p0, p1, v1}, Lbx1;-><init>(Lcx1;Landroid/app/Activity;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ldx1;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget v0, p0, Lcx1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    new-instance v0, Lbx1;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-direct {v0, p0, p1, v1}, Lbx1;-><init>(Lcx1;Landroid/app/Activity;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcx1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ldx1;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ldx1;->c(Lzw1;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
