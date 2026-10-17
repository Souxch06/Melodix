.class public final Lk22;
.super Lvu1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcy1;


# instance fields
.field public final b:Lsa2;

.field public c:Ljava/lang/Boolean;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lsa2;)V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.measurement.internal.IMeasurementService"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lvu1;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lk22;->d:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final A(Lwa2;Lbc2;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lk22;->F(Lbc2;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lv12;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lv12;-><init>(Lk22;Lwa2;Lbc2;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final B(Lbc2;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 5
    .line 6
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, La12;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, La12;-><init>(Lsa2;Lbc2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    const-wide/16 v2, 0x7530

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    goto :goto_0

    .line 32
    :catch_1
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :catch_2
    move-exception v0

    .line 35
    :goto_0
    invoke-virtual {p0}, Lsa2;->b()Lzy1;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 40
    .line 41
    iget-object p1, p1, Lbc2;->j:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v1, "Failed to get app instance id. appId"

    .line 48
    .line 49
    invoke-virtual {p0, v1, p1, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public final C(Ljava/lang/String;Ljava/lang/String;ZLbc2;)Ljava/util/List;
    .locals 7

    .line 1
    invoke-virtual {p0, p4}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object v2, p4, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p4, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    invoke-virtual {p4}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    new-instance v0, Lk12;

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v1, p0

    .line 19
    move-object v3, p1

    .line 20
    move-object v4, p2

    .line 21
    invoke-direct/range {v0 .. v5}, Lk12;-><init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v6, v0}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/util/List;

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Lza2;

    .line 58
    .line 59
    if-nez p3, :cond_1

    .line 60
    .line 61
    iget-object v0, p2, Lza2;->c:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Lcb2;->P(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :catch_0
    move-exception v0

    .line 71
    :goto_1
    move-object p0, v0

    .line 72
    goto :goto_3

    .line 73
    :catch_1
    move-exception v0

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    :goto_2
    new-instance v0, Lwa2;

    .line 76
    .line 77
    invoke-direct {v0, p2}, Lwa2;-><init>(Lza2;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    return-object p1

    .line 85
    :goto_3
    invoke-virtual {p4}, Lsa2;->b()Lzy1;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 90
    .line 91
    invoke-static {v2}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const-string p3, "Failed to query user properties. appId"

    .line 96
    .line 97
    invoke-virtual {p1, p3, p2, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 101
    .line 102
    return-object p0
.end method

.method public final D(Lbc2;Ljq1;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lg22;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Lg22;-><init>(Lk22;Lbc2;Ljq1;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final F(Lbc2;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lk22;->G(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 14
    .line 15
    invoke-virtual {p0}, Lsa2;->k0()Lcb2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Lbc2;->k:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcb2;->r(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final G(Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const-string v0, "com.google.android.gms"

    .line 2
    .line 3
    const-string v1, "Unknown calling package name \'"

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v3, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    if-nez v2, :cond_a

    .line 12
    .line 13
    if-eqz p2, :cond_7

    .line 14
    .line 15
    :try_start_0
    iget-object p2, p0, Lk22;->c:Ljava/lang/Boolean;

    .line 16
    .line 17
    if-nez p2, :cond_6

    .line 18
    .line 19
    iget-object p2, p0, Lk22;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const/4 v2, 0x1

    .line 26
    if-nez p2, :cond_5

    .line 27
    .line 28
    iget-object p2, v3, Lsa2;->u:Ly02;

    .line 29
    .line 30
    iget-object p2, p2, Ly02;->j:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-static {v4, p2, v0}, Lkn1;->o(ILandroid/content/Context;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const/4 v5, 0x0

    .line 41
    if-nez v4, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 45
    .line 46
    .line 47
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    const/16 v6, 0x40

    .line 49
    .line 50
    :try_start_1
    invoke-virtual {v4, v0, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    :try_start_2
    invoke-static {p2}, Lcb0;->a(Landroid/content/Context;)Lcb0;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {v0, v5}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-static {v0, v2}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object p2, p2, Lcb0;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast p2, Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {p2}, Lbb0;->a(Landroid/content/Context;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :catch_0
    :cond_3
    :goto_0
    iget-object p2, v3, Lsa2;->u:Ly02;

    .line 86
    .line 87
    iget-object p2, p2, Ly02;->j:Landroid/content/Context;

    .line 88
    .line 89
    invoke-static {p2}, Lcb0;->a(Landroid/content/Context;)Lcb0;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p2, v0}, Lcb0;->b(I)Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_4

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    move v2, v5

    .line 105
    goto :goto_1

    .line 106
    :catch_1
    move-exception p0

    .line 107
    goto :goto_3

    .line 108
    :cond_5
    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iput-object p2, p0, Lk22;->c:Ljava/lang/Boolean;

    .line 113
    .line 114
    :cond_6
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_7

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_7
    iget-object p2, p0, Lk22;->d:Ljava/lang/String;

    .line 122
    .line 123
    if-nez p2, :cond_8

    .line 124
    .line 125
    iget-object p2, v3, Lsa2;->u:Ly02;

    .line 126
    .line 127
    iget-object p2, p2, Ly02;->j:Landroid/content/Context;

    .line 128
    .line 129
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    sget v2, Lbb0;->e:I

    .line 134
    .line 135
    invoke-static {v0, p2, p1}, Lkn1;->o(ILandroid/content/Context;Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-eqz p2, :cond_8

    .line 140
    .line 141
    iput-object p1, p0, Lk22;->d:Ljava/lang/String;

    .line 142
    .line 143
    :cond_8
    iget-object p0, p0, Lk22;->d:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-eqz p0, :cond_9

    .line 150
    .line 151
    :goto_2
    return-void

    .line 152
    :cond_9
    new-instance p0, Ljava/lang/SecurityException;

    .line 153
    .line 154
    new-instance p2, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v0, "\'."

    .line 163
    .line 164
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    invoke-direct {p0, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    throw p0
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1

    .line 175
    :goto_3
    invoke-virtual {v3}, Lsa2;->b()Lzy1;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    iget-object p2, p2, Lzy1;->o:Lso;

    .line 180
    .line 181
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    const-string v0, "Measurement Service called with invalid calling package. appId"

    .line 186
    .line 187
    invoke-virtual {p2, p1, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw p0

    .line 191
    :cond_a
    invoke-virtual {v3}, Lsa2;->b()Lzy1;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 196
    .line 197
    const-string p1, "Measurement Service called without app package"

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    new-instance p0, Ljava/lang/SecurityException;

    .line 203
    .line 204
    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    throw p0
.end method

.method public final H(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ls02;->r()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final a(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lk22;->b:Lsa2;

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x1

    .line 7
    packed-switch p1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    :pswitch_0
    return v3

    .line 11
    :pswitch_1
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 12
    .line 13
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lbc2;

    .line 18
    .line 19
    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 20
    .line 21
    invoke-static {p2, v1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/os/Bundle;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string v2, "com.google.android.gms.measurement.internal.ITriggerUrisCallback"

    .line 35
    .line 36
    invoke-interface {v3, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    instance-of v6, v5, Lfy1;

    .line 41
    .line 42
    if-eqz v6, :cond_1

    .line 43
    .line 44
    move-object v2, v5

    .line 45
    check-cast v2, Lfy1;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance v5, Ldy1;

    .line 49
    .line 50
    invoke-direct {v5, v3, v2, v0}, Lfl1;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    move-object v2, v5

    .line 54
    :goto_0
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1, v1, v2}, Lk22;->y(Lbc2;Landroid/os/Bundle;Lfy1;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 61
    .line 62
    .line 63
    return v4

    .line 64
    :pswitch_2
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 65
    .line 66
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lbc2;

    .line 71
    .line 72
    sget-object v0, Ljq1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 73
    .line 74
    invoke-static {p2, v0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ljq1;

    .line 79
    .line 80
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1, v0}, Lk22;->D(Lbc2;Ljq1;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 87
    .line 88
    .line 89
    return v4

    .line 90
    :pswitch_3
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 91
    .line 92
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lbc2;

    .line 97
    .line 98
    sget-object v1, Lv92;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 99
    .line 100
    invoke-static {p2, v1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Lv92;

    .line 105
    .line 106
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    if-nez v3, :cond_2

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_2
    const-string v2, "com.google.android.gms.measurement.internal.IUploadBatchesCallback"

    .line 114
    .line 115
    invoke-interface {v3, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    instance-of v6, v5, Liy1;

    .line 120
    .line 121
    if-eqz v6, :cond_3

    .line 122
    .line 123
    move-object v2, v5

    .line 124
    check-cast v2, Liy1;

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    new-instance v5, Lgy1;

    .line 128
    .line 129
    invoke-direct {v5, v3, v2, v0}, Lfl1;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 130
    .line 131
    .line 132
    move-object v2, v5

    .line 133
    :goto_1
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, p1, v1, v2}, Lk22;->m(Lbc2;Lv92;Liy1;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 140
    .line 141
    .line 142
    return v4

    .line 143
    :pswitch_4
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 144
    .line 145
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    check-cast p1, Lbc2;

    .line 150
    .line 151
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lk22;->s(Lbc2;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 158
    .line 159
    .line 160
    return v4

    .line 161
    :pswitch_5
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 162
    .line 163
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    check-cast p1, Lbc2;

    .line 168
    .line 169
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, p1}, Lk22;->z(Lbc2;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 176
    .line 177
    .line 178
    return v4

    .line 179
    :pswitch_6
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 180
    .line 181
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Lbc2;

    .line 186
    .line 187
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, p1}, Lk22;->p(Lbc2;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 194
    .line 195
    .line 196
    return v4

    .line 197
    :pswitch_7
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 198
    .line 199
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    check-cast p1, Lbc2;

    .line 204
    .line 205
    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 206
    .line 207
    invoke-static {p2, v0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, Landroid/os/Bundle;

    .line 212
    .line 213
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 217
    .line 218
    .line 219
    iget-object p2, p1, Lbc2;->j:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {p2}, Lbh;->h(Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1}, Lsa2;->e0()Lmt1;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    sget-object v6, Lxx1;->T0:Lwx1;

    .line 229
    .line 230
    invoke-virtual {v5, v2, v6}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    const-string v5, "Failed to get trigger URIs. appId"

    .line 235
    .line 236
    if-eqz v2, :cond_4

    .line 237
    .line 238
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    new-instance v6, Lx12;

    .line 243
    .line 244
    invoke-direct {v6, p0, p1, v0, v3}, Lx12;-><init>(Lk22;Lbc2;Landroid/os/Bundle;I)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v2, v6}, Ls02;->t(Ljava/util/concurrent/Callable;)Lp02;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    :try_start_0
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 252
    .line 253
    const-wide/16 v2, 0x2710

    .line 254
    .line 255
    invoke-virtual {p0, v2, v3, p1}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    check-cast p0, Ljava/util/List;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .line 261
    goto :goto_6

    .line 262
    :catch_0
    move-exception v0

    .line 263
    :goto_2
    move-object p0, v0

    .line 264
    goto :goto_3

    .line 265
    :catch_1
    move-exception v0

    .line 266
    goto :goto_2

    .line 267
    :catch_2
    move-exception v0

    .line 268
    goto :goto_2

    .line 269
    :goto_3
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 274
    .line 275
    invoke-static {p2}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    invoke-virtual {p1, v5, p2, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 283
    .line 284
    goto :goto_6

    .line 285
    :cond_4
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    new-instance v3, Lx12;

    .line 290
    .line 291
    invoke-direct {v3, p0, p1, v0, v4}, Lx12;-><init>(Lk22;Lbc2;Landroid/os/Bundle;I)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v2, v3}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    :try_start_1
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    check-cast p0, Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_3

    .line 303
    .line 304
    goto :goto_6

    .line 305
    :catch_3
    move-exception v0

    .line 306
    :goto_4
    move-object p0, v0

    .line 307
    goto :goto_5

    .line 308
    :catch_4
    move-exception v0

    .line 309
    goto :goto_4

    .line 310
    :goto_5
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 315
    .line 316
    invoke-static {p2}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    invoke-virtual {p1, v5, p2, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 324
    .line 325
    :goto_6
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 329
    .line 330
    .line 331
    goto/16 :goto_d

    .line 332
    .line 333
    :pswitch_8
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 334
    .line 335
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    check-cast p1, Lbc2;

    .line 340
    .line 341
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {p0, p1}, Lk22;->e(Lbc2;)Lrt1;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 349
    .line 350
    .line 351
    if-nez p0, :cond_5

    .line 352
    .line 353
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 354
    .line 355
    .line 356
    return v4

    .line 357
    :cond_5
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {p0, p3, v4}, Lrt1;->writeToParcel(Landroid/os/Parcel;I)V

    .line 361
    .line 362
    .line 363
    return v4

    .line 364
    :pswitch_9
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 365
    .line 366
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    check-cast p1, Lbc2;

    .line 371
    .line 372
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p0, p1}, Lk22;->v(Lbc2;)V

    .line 376
    .line 377
    .line 378
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 379
    .line 380
    .line 381
    return v4

    .line 382
    :pswitch_a
    sget-object p1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 383
    .line 384
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    check-cast p1, Landroid/os/Bundle;

    .line 389
    .line 390
    sget-object v0, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 391
    .line 392
    invoke-static {p2, v0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    check-cast v0, Lbc2;

    .line 397
    .line 398
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {p0, p1, v0}, Lk22;->f(Landroid/os/Bundle;Lbc2;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 405
    .line 406
    .line 407
    return v4

    .line 408
    :pswitch_b
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 409
    .line 410
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    check-cast p1, Lbc2;

    .line 415
    .line 416
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, p1}, Lk22;->u(Lbc2;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 423
    .line 424
    .line 425
    return v4

    .line 426
    :pswitch_c
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {p0, p1, v0, v1}, Lk22;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 442
    .line 443
    .line 444
    move-result-object p0

    .line 445
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 446
    .line 447
    .line 448
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 449
    .line 450
    .line 451
    return v4

    .line 452
    :pswitch_d
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    sget-object v1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 461
    .line 462
    invoke-static {p2, v1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    check-cast v1, Lbc2;

    .line 467
    .line 468
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p0, p1, v0, v1}, Lk22;->q(Ljava/lang/String;Ljava/lang/String;Lbc2;)Ljava/util/List;

    .line 472
    .line 473
    .line 474
    move-result-object p0

    .line 475
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 476
    .line 477
    .line 478
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 479
    .line 480
    .line 481
    return v4

    .line 482
    :pswitch_e
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    sget-object v2, Lwu1;->a:Ljava/lang/ClassLoader;

    .line 495
    .line 496
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 497
    .line 498
    .line 499
    move-result v2

    .line 500
    if-eqz v2, :cond_6

    .line 501
    .line 502
    move v3, v4

    .line 503
    :cond_6
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {p0, p1, v0, v1, v3}, Lk22;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    .line 507
    .line 508
    .line 509
    move-result-object p0

    .line 510
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 511
    .line 512
    .line 513
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 514
    .line 515
    .line 516
    return v4

    .line 517
    :pswitch_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object p1

    .line 521
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    sget-object v1, Lwu1;->a:Ljava/lang/ClassLoader;

    .line 526
    .line 527
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 528
    .line 529
    .line 530
    move-result v1

    .line 531
    if-eqz v1, :cond_7

    .line 532
    .line 533
    move v3, v4

    .line 534
    :cond_7
    sget-object v1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 535
    .line 536
    invoke-static {p2, v1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 537
    .line 538
    .line 539
    move-result-object v1

    .line 540
    check-cast v1, Lbc2;

    .line 541
    .line 542
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 543
    .line 544
    .line 545
    invoke-virtual {p0, p1, v0, v3, v1}, Lk22;->C(Ljava/lang/String;Ljava/lang/String;ZLbc2;)Ljava/util/List;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 550
    .line 551
    .line 552
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 553
    .line 554
    .line 555
    return v4

    .line 556
    :pswitch_10
    sget-object p1, Lsr1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 557
    .line 558
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 559
    .line 560
    .line 561
    move-result-object p1

    .line 562
    check-cast p1, Lsr1;

    .line 563
    .line 564
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 565
    .line 566
    .line 567
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 568
    .line 569
    .line 570
    iget-object p2, p1, Lsr1;->l:Lwa2;

    .line 571
    .line 572
    invoke-static {p2}, Lbh;->h(Ljava/lang/Object;)V

    .line 573
    .line 574
    .line 575
    iget-object p2, p1, Lsr1;->j:Ljava/lang/String;

    .line 576
    .line 577
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    iget-object p2, p1, Lsr1;->j:Ljava/lang/String;

    .line 581
    .line 582
    invoke-virtual {p0, p2, v4}, Lk22;->G(Ljava/lang/String;Z)V

    .line 583
    .line 584
    .line 585
    new-instance p2, Lsr1;

    .line 586
    .line 587
    invoke-direct {p2, p1}, Lsr1;-><init>(Lsr1;)V

    .line 588
    .line 589
    .line 590
    new-instance p1, Li12;

    .line 591
    .line 592
    invoke-direct {p1, p0, p2}, Li12;-><init>(Lk22;Lsr1;)V

    .line 593
    .line 594
    .line 595
    invoke-virtual {p0, p1}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 596
    .line 597
    .line 598
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 599
    .line 600
    .line 601
    return v4

    .line 602
    :pswitch_11
    sget-object p1, Lsr1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 603
    .line 604
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    check-cast p1, Lsr1;

    .line 609
    .line 610
    sget-object v0, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 611
    .line 612
    invoke-static {p2, v0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 613
    .line 614
    .line 615
    move-result-object v0

    .line 616
    check-cast v0, Lbc2;

    .line 617
    .line 618
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 619
    .line 620
    .line 621
    invoke-virtual {p0, p1, v0}, Lk22;->i(Lsr1;Lbc2;)V

    .line 622
    .line 623
    .line 624
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 625
    .line 626
    .line 627
    return v4

    .line 628
    :pswitch_12
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 629
    .line 630
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 631
    .line 632
    .line 633
    move-result-object p1

    .line 634
    check-cast p1, Lbc2;

    .line 635
    .line 636
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 637
    .line 638
    .line 639
    invoke-virtual {p0, p1}, Lk22;->B(Lbc2;)Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object p0

    .line 643
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 644
    .line 645
    .line 646
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 647
    .line 648
    .line 649
    return v4

    .line 650
    :pswitch_13
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    .line 651
    .line 652
    .line 653
    move-result-wide v6

    .line 654
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v8

    .line 658
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v9

    .line 662
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 663
    .line 664
    .line 665
    move-result-object v10

    .line 666
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 667
    .line 668
    .line 669
    move-object v5, p0

    .line 670
    invoke-virtual/range {v5 .. v10}, Lk22;->n(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    .line 672
    .line 673
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 674
    .line 675
    .line 676
    return v4

    .line 677
    :pswitch_14
    move-object v5, p0

    .line 678
    sget-object p0, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 679
    .line 680
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 681
    .line 682
    .line 683
    move-result-object p0

    .line 684
    check-cast p0, Ltu1;

    .line 685
    .line 686
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 687
    .line 688
    .line 689
    move-result-object p1

    .line 690
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {v5, p1, p0}, Lk22;->j(Ljava/lang/String;Ltu1;)[B

    .line 694
    .line 695
    .line 696
    move-result-object p0

    .line 697
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 698
    .line 699
    .line 700
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 701
    .line 702
    .line 703
    return v4

    .line 704
    :pswitch_15
    move-object v5, p0

    .line 705
    sget-object p0, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 706
    .line 707
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 708
    .line 709
    .line 710
    move-result-object p0

    .line 711
    check-cast p0, Lbc2;

    .line 712
    .line 713
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 714
    .line 715
    .line 716
    move-result p1

    .line 717
    if-eqz p1, :cond_8

    .line 718
    .line 719
    move p1, v4

    .line 720
    goto :goto_7

    .line 721
    :cond_8
    move p1, v3

    .line 722
    :goto_7
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 723
    .line 724
    .line 725
    invoke-virtual {v5, p0}, Lk22;->F(Lbc2;)V

    .line 726
    .line 727
    .line 728
    iget-object p0, p0, Lbc2;->j:Ljava/lang/String;

    .line 729
    .line 730
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 731
    .line 732
    .line 733
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 734
    .line 735
    .line 736
    move-result-object p2

    .line 737
    new-instance v0, La12;

    .line 738
    .line 739
    invoke-direct {v0, v5, p0, v3}, La12;-><init>(Lk22;Ljava/lang/Object;I)V

    .line 740
    .line 741
    .line 742
    invoke-virtual {p2, v0}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 743
    .line 744
    .line 745
    move-result-object p2

    .line 746
    :try_start_2
    invoke-virtual {p2}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 747
    .line 748
    .line 749
    move-result-object p2

    .line 750
    check-cast p2, Ljava/util/List;

    .line 751
    .line 752
    new-instance v0, Ljava/util/ArrayList;

    .line 753
    .line 754
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 755
    .line 756
    .line 757
    move-result v3

    .line 758
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 759
    .line 760
    .line 761
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 762
    .line 763
    .line 764
    move-result-object p2

    .line 765
    :cond_9
    :goto_8
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 766
    .line 767
    .line 768
    move-result v3

    .line 769
    if-eqz v3, :cond_b

    .line 770
    .line 771
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 772
    .line 773
    .line 774
    move-result-object v3

    .line 775
    check-cast v3, Lza2;

    .line 776
    .line 777
    if-nez p1, :cond_a

    .line 778
    .line 779
    iget-object v5, v3, Lza2;->c:Ljava/lang/String;

    .line 780
    .line 781
    invoke-static {v5}, Lcb2;->P(Ljava/lang/String;)Z

    .line 782
    .line 783
    .line 784
    move-result v5

    .line 785
    if-nez v5, :cond_9

    .line 786
    .line 787
    goto :goto_a

    .line 788
    :catch_5
    move-exception v0

    .line 789
    :goto_9
    move-object p1, v0

    .line 790
    goto :goto_b

    .line 791
    :catch_6
    move-exception v0

    .line 792
    goto :goto_9

    .line 793
    :cond_a
    :goto_a
    new-instance v5, Lwa2;

    .line 794
    .line 795
    invoke-direct {v5, v3}, Lwa2;-><init>(Lza2;)V

    .line 796
    .line 797
    .line 798
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_5

    .line 799
    .line 800
    .line 801
    goto :goto_8

    .line 802
    :cond_b
    move-object v2, v0

    .line 803
    goto :goto_c

    .line 804
    :goto_b
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 805
    .line 806
    .line 807
    move-result-object p2

    .line 808
    iget-object p2, p2, Lzy1;->o:Lso;

    .line 809
    .line 810
    invoke-static {p0}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 811
    .line 812
    .line 813
    move-result-object p0

    .line 814
    const-string v0, "Failed to get user properties. appId"

    .line 815
    .line 816
    invoke-virtual {p2, v0, p0, p1}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 817
    .line 818
    .line 819
    :goto_c
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 820
    .line 821
    .line 822
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 823
    .line 824
    .line 825
    :goto_d
    return v4

    .line 826
    :pswitch_16
    move-object v5, p0

    .line 827
    sget-object p0, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 828
    .line 829
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 830
    .line 831
    .line 832
    move-result-object p0

    .line 833
    check-cast p0, Lbc2;

    .line 834
    .line 835
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 836
    .line 837
    .line 838
    invoke-virtual {v5, p0}, Lk22;->x(Lbc2;)V

    .line 839
    .line 840
    .line 841
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 842
    .line 843
    .line 844
    return v4

    .line 845
    :pswitch_17
    move-object v5, p0

    .line 846
    sget-object p0, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 847
    .line 848
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 849
    .line 850
    .line 851
    move-result-object p0

    .line 852
    check-cast p0, Ltu1;

    .line 853
    .line 854
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 855
    .line 856
    .line 857
    move-result-object p1

    .line 858
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 859
    .line 860
    .line 861
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 862
    .line 863
    .line 864
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 865
    .line 866
    .line 867
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 868
    .line 869
    .line 870
    invoke-virtual {v5, p1, v4}, Lk22;->G(Ljava/lang/String;Z)V

    .line 871
    .line 872
    .line 873
    new-instance p2, Ls12;

    .line 874
    .line 875
    invoke-direct {p2, v5, p0, p1}, Ls12;-><init>(Lk22;Ltu1;Ljava/lang/String;)V

    .line 876
    .line 877
    .line 878
    invoke-virtual {v5, p2}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 879
    .line 880
    .line 881
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 882
    .line 883
    .line 884
    return v4

    .line 885
    :pswitch_18
    move-object v5, p0

    .line 886
    sget-object p0, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 887
    .line 888
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 889
    .line 890
    .line 891
    move-result-object p0

    .line 892
    check-cast p0, Lbc2;

    .line 893
    .line 894
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 895
    .line 896
    .line 897
    invoke-virtual {v5, p0}, Lk22;->k(Lbc2;)V

    .line 898
    .line 899
    .line 900
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 901
    .line 902
    .line 903
    return v4

    .line 904
    :pswitch_19
    move-object v5, p0

    .line 905
    sget-object p0, Lwa2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 906
    .line 907
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 908
    .line 909
    .line 910
    move-result-object p0

    .line 911
    check-cast p0, Lwa2;

    .line 912
    .line 913
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 914
    .line 915
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 916
    .line 917
    .line 918
    move-result-object p1

    .line 919
    check-cast p1, Lbc2;

    .line 920
    .line 921
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 922
    .line 923
    .line 924
    invoke-virtual {v5, p0, p1}, Lk22;->A(Lwa2;Lbc2;)V

    .line 925
    .line 926
    .line 927
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 928
    .line 929
    .line 930
    return v4

    .line 931
    :pswitch_1a
    move-object v5, p0

    .line 932
    sget-object p0, Ltu1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 933
    .line 934
    invoke-static {p2, p0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 935
    .line 936
    .line 937
    move-result-object p0

    .line 938
    check-cast p0, Ltu1;

    .line 939
    .line 940
    sget-object p1, Lbc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 941
    .line 942
    invoke-static {p2, p1}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 943
    .line 944
    .line 945
    move-result-object p1

    .line 946
    check-cast p1, Lbc2;

    .line 947
    .line 948
    invoke-static {p2}, Lwu1;->d(Landroid/os/Parcel;)V

    .line 949
    .line 950
    .line 951
    invoke-virtual {v5, p0, p1}, Lk22;->t(Ltu1;Lbc2;)V

    .line 952
    .line 953
    .line 954
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 955
    .line 956
    .line 957
    return v4

    .line 958
    nop

    .line 959
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_0
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final b(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lk22;->b:Lsa2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ls02;->r()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Ls02;->w(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final e(Lbc2;)Lrt1;
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v3, La12;

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-direct {v3, p0, p1, v4}, La12;-><init>(Lk22;Ljava/lang/Object;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ls02;->t(Ljava/util/concurrent/Callable;)Lp02;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :try_start_0
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    const-wide/16 v2, 0x2710

    .line 28
    .line 29
    invoke-virtual {p0, v2, v3, p1}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lrt1;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    goto :goto_0

    .line 38
    :catch_1
    move-exception p0

    .line 39
    goto :goto_0

    .line 40
    :catch_2
    move-exception p0

    .line 41
    :goto_0
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 46
    .line 47
    invoke-static {v0}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "Failed to get consent. appId"

    .line 52
    .line 53
    invoke-virtual {p1, v1, v0, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Lrt1;

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-direct {p0, p1}, Lrt1;-><init>(Landroid/os/Bundle;)V

    .line 60
    .line 61
    .line 62
    return-object p0
.end method

.method public final f(Landroid/os/Bundle;Lbc2;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Li22;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, v0, p2}, Li22;-><init>(Lk22;Landroid/os/Bundle;Ljava/lang/String;Lbc2;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lk22;->G(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lk22;->b:Lsa2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Lk12;

    .line 12
    .line 13
    const/4 v7, 0x1

    .line 14
    move-object v3, p0

    .line 15
    move-object v4, p1

    .line 16
    move-object v5, p2

    .line 17
    move-object v6, p3

    .line 18
    invoke-direct/range {v2 .. v7}, Lk12;-><init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/util/List;

    .line 30
    .line 31
    new-instance p1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Lza2;

    .line 55
    .line 56
    if-nez p4, :cond_1

    .line 57
    .line 58
    iget-object p3, p2, Lza2;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p3}, Lcb2;->P(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-nez p3, :cond_0

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :catch_0
    move-exception v0

    .line 68
    :goto_1
    move-object p0, v0

    .line 69
    goto :goto_3

    .line 70
    :catch_1
    move-exception v0

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    :goto_2
    new-instance p3, Lwa2;

    .line 73
    .line 74
    invoke-direct {p3, p2}, Lwa2;-><init>(Lza2;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    return-object p1

    .line 82
    :goto_3
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 87
    .line 88
    invoke-static {v4}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    const-string p3, "Failed to get user properties as. appId"

    .line 93
    .line 94
    invoke-virtual {p1, p3, p2, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 98
    .line 99
    return-object p0
.end method

.method public final i(Lsr1;Lbc2;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lsr1;->l:Lwa2;

    .line 5
    .line 6
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lk22;->F(Lbc2;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lsr1;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lsr1;-><init>(Lsr1;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p2, Lbc2;->j:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, v0, Lsr1;->j:Ljava/lang/String;

    .line 20
    .line 21
    new-instance p1, Lg12;

    .line 22
    .line 23
    invoke-direct {p1, p0, v0, p2}, Lg12;-><init>(Lk22;Lsr1;Lbc2;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final j(Ljava/lang/String;Ltu1;)[B
    .locals 11

    .line 1
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lbh;->h(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lk22;->G(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lk22;->b:Lsa2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lzy1;->v:Lso;

    .line 18
    .line 19
    iget-object v2, v0, Lsa2;->u:Ly02;

    .line 20
    .line 21
    iget-object v3, v2, Ly02;->s:Lry1;

    .line 22
    .line 23
    iget-object v4, p2, Ltu1;->j:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v5, "Log and bundle. event"

    .line 30
    .line 31
    invoke-virtual {v1, v3, v5}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 42
    .line 43
    .line 44
    move-result-wide v5

    .line 45
    const-wide/32 v7, 0xf4240

    .line 46
    .line 47
    .line 48
    div-long/2addr v5, v7

    .line 49
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v3, Lg02;

    .line 54
    .line 55
    invoke-direct {v3, p0, p2, p1}, Lg02;-><init>(Lk22;Ltu1;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v3}, Ls02;->t(Ljava/util/concurrent/Callable;)Lp02;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, [B

    .line 67
    .line 68
    if-nez p0, :cond_0

    .line 69
    .line 70
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 75
    .line 76
    const-string p2, "Log and bundle returned null. appId"

    .line 77
    .line 78
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p0, v1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    new-array p0, p0, [B

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catch_0
    move-exception p0

    .line 90
    goto :goto_1

    .line 91
    :catch_1
    move-exception p0

    .line 92
    goto :goto_1

    .line 93
    :cond_0
    :goto_0
    invoke-virtual {v0}, Lsa2;->f()Lmz;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 101
    .line 102
    .line 103
    move-result-wide v9

    .line 104
    div-long/2addr v9, v7

    .line 105
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    iget-object p2, p2, Lzy1;->v:Lso;

    .line 110
    .line 111
    const-string v1, "Log and bundle processed. event, size, time_ms"

    .line 112
    .line 113
    iget-object v3, v2, Ly02;->s:Lry1;

    .line 114
    .line 115
    invoke-virtual {v3, v4}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    array-length v7, p0

    .line 120
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    sub-long/2addr v9, v5

    .line 125
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-virtual {p2, v1, v3, v7, v5}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    return-object p0

    .line 133
    :goto_1
    invoke-virtual {v0}, Lsa2;->b()Lzy1;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    iget-object p2, p2, Lzy1;->o:Lso;

    .line 138
    .line 139
    invoke-static {p1}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iget-object v0, v2, Ly02;->s:Lry1;

    .line 144
    .line 145
    invoke-virtual {v0, v4}, Lry1;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    const-string v1, "Failed to log and bundle. appId, event, error"

    .line 150
    .line 151
    invoke-virtual {p2, v1, p1, v0, p0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    const/4 p0, 0x0

    .line 155
    return-object p0
.end method

.method public final k(Lbc2;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lc12;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lc12;-><init>(Lk22;Lbc2;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m(Lbc2;Lv92;Liy1;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lc22;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2, p3}, Lc22;-><init>(Lk22;Ljava/lang/String;Lv92;Liy1;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final n(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Le12;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v5, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v2, p4

    .line 7
    move-object v3, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Le12;-><init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lk22;->G(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lk22;->b:Lsa2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lsa2;->c()Ls02;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Lk12;

    .line 12
    .line 13
    const/4 v7, 0x3

    .line 14
    move-object v3, p0

    .line 15
    move-object v4, p1

    .line 16
    move-object v5, p2

    .line 17
    move-object v6, p3

    .line 18
    invoke-direct/range {v2 .. v7}, Lk12;-><init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    :goto_0
    move-object p0, v0

    .line 34
    goto :goto_1

    .line 35
    :catch_1
    move-exception v0

    .line 36
    goto :goto_0

    .line 37
    :goto_1
    invoke-virtual {v1}, Lsa2;->b()Lzy1;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 42
    .line 43
    const-string p2, "Failed to get conditional user properties as"

    .line 44
    .line 45
    invoke-virtual {p1, p0, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 49
    .line 50
    return-object p0
.end method

.method public final p(Lbc2;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lbc2;->B:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lj22;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lj22;-><init>(Lk22;Lbc2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lk22;->b(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;Lbc2;)Ljava/util/List;
    .locals 7

    .line 1
    invoke-virtual {p0, p3}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object v2, p3, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p3, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    invoke-virtual {p3}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    new-instance v0, Lk12;

    .line 16
    .line 17
    const/4 v5, 0x2

    .line 18
    move-object v1, p0

    .line 19
    move-object v3, p1

    .line 20
    move-object v4, p2

    .line 21
    invoke-direct/range {v0 .. v5}, Lk12;-><init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v6, v0}, Ls02;->s(Ljava/util/concurrent/Callable;)Lp02;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    return-object p0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    :goto_0
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :catch_1
    move-exception v0

    .line 39
    goto :goto_0

    .line 40
    :goto_1
    invoke-virtual {p3}, Lsa2;->b()Lzy1;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p1, p1, Lzy1;->o:Lso;

    .line 45
    .line 46
    const-string p2, "Failed to get conditional user properties"

    .line 47
    .line 48
    invoke-virtual {p1, p0, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 52
    .line 53
    return-object p0
.end method

.method public final s(Lbc2;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ld12;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ld12;-><init>(Lk22;Lbc2;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final t(Ltu1;Lbc2;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lk22;->F(Lbc2;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lr12;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lr12;-><init>(Lk22;Ltu1;Lbc2;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final u(Lbc2;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Lk22;->G(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lp12;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lp12;-><init>(Lk22;Lbc2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final v(Lbc2;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lbc2;->B:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lq12;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lq12;-><init>(Lk22;Lbc2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lk22;->b(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final x(Lbc2;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lo12;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lo12;-><init>(Lk22;Lbc2;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lk22;->H(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final y(Lbc2;Landroid/os/Bundle;Lfy1;)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Lk22;->F(Lbc2;)V

    .line 2
    .line 3
    .line 4
    iget-object v5, p1, Lbc2;->j:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v5}, Lbh;->h(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lk22;->b:Lsa2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    new-instance v0, La22;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v4, p3

    .line 21
    invoke-direct/range {v0 .. v5}, La22;-><init>(Lk22;Lbc2;Landroid/os/Bundle;Lfy1;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v6, v0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final z(Lbc2;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lbc2;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lbh;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lbc2;->B:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lz12;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lz12;-><init>(Lk22;Lbc2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lk22;->b(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
