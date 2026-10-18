.class public final Lqt;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lke2;Lpg0;Lcl1;[Lqt;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lqt;->b:Ljava/lang/Object;

    .line 148
    iput-object p2, p0, Lqt;->c:Ljava/lang/Object;

    .line 149
    iput-object p3, p0, Lqt;->d:Ljava/lang/Object;

    .line 150
    iput-object p4, p0, Lqt;->e:Ljava/lang/Object;

    .line 151
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p4, :cond_1

    .line 152
    aget-object p2, p4, p1

    if-nez p2, :cond_0

    if-eq p2, p0, :cond_1

    .line 153
    :cond_0
    aput-object p0, p4, p1

    :cond_1
    return-void
.end method

.method public constructor <init>(Lu30;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lqt;->d:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v1, Llb1;

    .line 12
    .line 13
    invoke-direct {v1}, Llb1;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lqt;->e:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-boolean v1, p0, Lqt;->a:Z

    .line 20
    .line 21
    new-instance v2, Llb1;

    .line 22
    .line 23
    invoke-direct {v2}, Llb1;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lqt;->f:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {p1}, Lu30;->a()V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, Lu30;->a:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p1, p0, Lqt;->c:Ljava/lang/Object;

    .line 34
    .line 35
    const-string p1, "com.google.firebase.crashlytics"

    .line 36
    .line 37
    invoke-virtual {v2, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lqt;->b:Ljava/lang/Object;

    .line 42
    .line 43
    const-string v1, "firebase_crashlytics_collection_enabled"

    .line 44
    .line 45
    invoke-interface {p1, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x0

    .line 50
    const/4 v5, 0x1

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    invoke-interface {p1, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object p1, v4

    .line 63
    :goto_0
    if-nez p1, :cond_3

    .line 64
    .line 65
    const-string p1, "firebase_crashlytics_collection_enabled"

    .line 66
    .line 67
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const/16 v3, 0x80

    .line 78
    .line 79
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 86
    .line 87
    if-eqz v2, :cond_1

    .line 88
    .line 89
    invoke-virtual {v2, p1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 96
    .line 97
    invoke-virtual {v1, p1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 102
    .line 103
    .line 104
    move-result-object p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    goto :goto_1

    .line 106
    :catch_0
    :cond_1
    move-object p1, v4

    .line 107
    :goto_1
    if-nez p1, :cond_2

    .line 108
    .line 109
    move-object p1, v4

    .line 110
    goto :goto_2

    .line 111
    :cond_2
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {v1, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    :cond_3
    :goto_2
    iput-object p1, p0, Lqt;->g:Ljava/lang/Object;

    .line 122
    .line 123
    monitor-enter v0

    .line 124
    :try_start_1
    invoke-virtual {p0}, Lqt;->l()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_4

    .line 129
    .line 130
    iget-object p1, p0, Lqt;->e:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p1, Llb1;

    .line 133
    .line 134
    invoke-virtual {p1, v4}, Llb1;->b(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    iput-boolean v5, p0, Lqt;->a:Z

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :catchall_0
    move-exception p0

    .line 141
    goto :goto_4

    .line 142
    :cond_4
    :goto_3
    monitor-exit v0

    .line 143
    return-void

    .line 144
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 145
    throw p0
.end method


# virtual methods
.method public a(Li41;)Lqt;
    .locals 6

    .line 1
    iget-object v0, p0, Lqt;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [Lqt;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lqt;->c:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Lpg0;

    .line 11
    .line 12
    invoke-static {v1, p1}, Lbv;->n(Lpg0;Li41;)Lcl1;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-char v3, v2, Lcl1;->j:C

    .line 17
    .line 18
    iget-object v4, p0, Lqt;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v4, Lke2;

    .line 21
    .line 22
    invoke-virtual {v4, v3}, Lke2;->c(C)V

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    iput-boolean v3, v4, Lke2;->j:Z

    .line 27
    .line 28
    iget-object v3, p0, Lqt;->f:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v5, p0, Lqt;->g:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v5, Ljava/lang/String;

    .line 37
    .line 38
    if-nez v5, :cond_0

    .line 39
    .line 40
    invoke-interface {p1}, Li41;->b()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    :cond_0
    invoke-virtual {v4}, Lke2;->b()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4, v3}, Lke2;->d(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/16 p1, 0x3a

    .line 51
    .line 52
    invoke-virtual {v4, p1}, Lke2;->c(C)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v5}, Lqt;->j(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput-object p1, p0, Lqt;->f:Ljava/lang/Object;

    .line 60
    .line 61
    iput-object p1, p0, Lqt;->g:Ljava/lang/Object;

    .line 62
    .line 63
    :cond_1
    iget-object p1, p0, Lqt;->d:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p1, Lcl1;

    .line 66
    .line 67
    if-ne p1, v2, :cond_2

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    aget-object p0, v0, p0

    .line 77
    .line 78
    if-eqz p0, :cond_3

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_3
    new-instance p0, Lqt;

    .line 82
    .line 83
    invoke-direct {p0, v4, v1, v2, v0}, Lqt;-><init>(Lke2;Lpg0;Lcl1;[Lqt;)V

    .line 84
    .line 85
    .line 86
    return-object p0
.end method

.method public b(Li41;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lqt;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lke2;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lqt;->d:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Lcl1;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x2c

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq v1, v3, :cond_7

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/16 v5, 0x3a

    .line 23
    .line 24
    const/4 v6, 0x2

    .line 25
    if-eq v1, v6, :cond_4

    .line 26
    .line 27
    const/4 v6, 0x3

    .line 28
    if-eq v1, v6, :cond_1

    .line 29
    .line 30
    iget-boolean v1, v0, Lke2;->j:Z

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lke2;->c(C)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {v0}, Lke2;->b()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lqt;->c:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Lpg0;

    .line 43
    .line 44
    invoke-static {v1, p1}, Lbh;->w(Lpg0;Li41;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1, p2}, Li41;->e(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lqt;->j(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v5}, Lke2;->c(C)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Lke2;->e()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    if-nez p2, :cond_2

    .line 62
    .line 63
    iput-boolean v3, p0, Lqt;->a:Z

    .line 64
    .line 65
    :cond_2
    if-ne p2, v3, :cond_3

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Lke2;->c(C)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Lke2;->e()V

    .line 71
    .line 72
    .line 73
    iput-boolean v4, p0, Lqt;->a:Z

    .line 74
    .line 75
    :cond_3
    return-void

    .line 76
    :cond_4
    iget-boolean p1, v0, Lke2;->j:Z

    .line 77
    .line 78
    if-nez p1, :cond_6

    .line 79
    .line 80
    rem-int/2addr p2, v6

    .line 81
    if-nez p2, :cond_5

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Lke2;->c(C)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Lke2;->b()V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    invoke-virtual {v0, v5}, Lke2;->c(C)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lke2;->e()V

    .line 94
    .line 95
    .line 96
    move v3, v4

    .line 97
    :goto_0
    iput-boolean v3, p0, Lqt;->a:Z

    .line 98
    .line 99
    return-void

    .line 100
    :cond_6
    iput-boolean v3, p0, Lqt;->a:Z

    .line 101
    .line 102
    invoke-virtual {v0}, Lke2;->b()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_7
    iget-boolean p0, v0, Lke2;->j:Z

    .line 107
    .line 108
    if-nez p0, :cond_8

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Lke2;->c(C)V

    .line 111
    .line 112
    .line 113
    :cond_8
    invoke-virtual {v0}, Lke2;->b()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public c(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lqt;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lqt;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lqt;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lke2;

    .line 16
    .line 17
    iget-object p0, p0, Lke2;->k:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Lf4;

    .line 20
    .line 21
    int-to-long v0, p1

    .line 22
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lf4;->h(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public d(J)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lqt;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lqt;->j(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lqt;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lke2;

    .line 16
    .line 17
    iget-object p0, p0, Lke2;->k:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Lf4;

    .line 20
    .line 21
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lf4;->h(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public e(Li41;IJ)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lqt;->b(Li41;I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p3, p4}, Lqt;->d(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lqt;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lke2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lke2;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lf4;

    .line 11
    .line 12
    const-string v0, "null"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lf4;->h(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g(Li41;ILdh0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lqt;->b(Li41;I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p3}, Ldh0;->d()Li41;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Li41;->h()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p3, p4}, Lqt;->i(Ldh0;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    if-nez p4, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lqt;->f()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, p3, p4}, Lqt;->i(Ldh0;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    return-void
.end method

.method public h(Li41;ILdh0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lqt;->b(Li41;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3, p4}, Lqt;->i(Ldh0;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i(Ldh0;Ljava/lang/Object;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lqt;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lpg0;

    .line 7
    .line 8
    iget-object v0, v0, Lpg0;->a:Lc9;

    .line 9
    .line 10
    iget-object v1, v0, Lc9;->m:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lgk;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_5

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-eq v1, v2, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-ne v1, v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-instance p0, Lrl;

    .line 28
    .line 29
    invoke-direct {p0}, Lrl;-><init>()V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Li41;->c()Las;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget-object v2, Lma1;->j:Lma1;

    .line 42
    .line 43
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_2

    .line 48
    .line 49
    sget-object v2, Lma1;->m:Lma1;

    .line 50
    .line 51
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_5

    .line 56
    .line 57
    :cond_2
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    invoke-interface {v1}, Li41;->getAnnotations()Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/lang/annotation/Annotation;

    .line 83
    .line 84
    instance-of v3, v2, Lqg0;

    .line 85
    .line 86
    if-eqz v3, :cond_3

    .line 87
    .line 88
    check-cast v2, Lqg0;

    .line 89
    .line 90
    invoke-interface {v2}, Lqg0;->discriminator()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    goto :goto_1

    .line 95
    :cond_4
    iget-object v0, v0, Lc9;->l:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v0, Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_5
    :goto_0
    const/4 v0, 0x0

    .line 101
    :goto_1
    if-eqz v0, :cond_6

    .line 102
    .line 103
    invoke-interface {p1}, Ldh0;->d()Li41;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-interface {v1}, Li41;->b()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iput-object v0, p0, Lqt;->f:Ljava/lang/Object;

    .line 112
    .line 113
    iput-object v1, p0, Lqt;->g:Ljava/lang/Object;

    .line 114
    .line 115
    :cond_6
    invoke-interface {p1, p0, p2}, Ldh0;->c(Lqt;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lqt;->b:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p0, Lke2;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lke2;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Li41;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lqt;->d:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, Lcl1;

    .line 7
    .line 8
    iget-object p0, p0, Lqt;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lke2;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lke2;->j:Z

    .line 17
    .line 18
    iget-char p1, p1, Lcl1;->k:C

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lke2;->c(C)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public declared-synchronized l()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lqt;->g:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Ljava/lang/Boolean;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :try_start_1
    iget-object v0, p0, Lqt;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lu30;

    .line 18
    .line 19
    invoke-virtual {v0}, Lu30;->g()Z

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    goto :goto_0

    .line 24
    :catch_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    monitor-exit p0

    .line 26
    return v0

    .line 27
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 28
    throw v0
.end method

.method public m(Li41;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
