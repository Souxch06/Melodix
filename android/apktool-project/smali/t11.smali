.class public final Lt11;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lrq;
.implements Ljm;
.implements Lqh;
.implements Lkw0;
.implements Lf91;
.implements Lok;
.implements Llq1;
.implements Lxu1;


# static fields
.field public static k:Lt11;

.field public static final synthetic l:Lt11;

.field public static final m:Lt11;

.field public static final n:Lt11;

.field public static final o:Lt11;

.field public static final p:Lt11;

.field public static final q:Lt11;

.field public static r:Lt11;

.field public static final synthetic s:Lt11;

.field public static final synthetic t:Lt11;

.field public static final synthetic u:Lt11;

.field public static final synthetic v:Lt11;

.field public static final synthetic w:Lt11;


# instance fields
.field public final synthetic j:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lt11;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lt11;->l:Lt11;

    .line 8
    .line 9
    new-instance v0, Lt11;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lt11;->m:Lt11;

    .line 16
    .line 17
    new-instance v0, Lt11;

    .line 18
    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lt11;->n:Lt11;

    .line 24
    .line 25
    new-instance v0, Lt11;

    .line 26
    .line 27
    const/4 v1, 0x5

    .line 28
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lt11;->o:Lt11;

    .line 32
    .line 33
    new-instance v0, Lt11;

    .line 34
    .line 35
    const/4 v1, 0x6

    .line 36
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lt11;->p:Lt11;

    .line 40
    .line 41
    new-instance v0, Lt11;

    .line 42
    .line 43
    const/4 v1, 0x7

    .line 44
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lt11;->q:Lt11;

    .line 48
    .line 49
    new-instance v0, Lt11;

    .line 50
    .line 51
    const/16 v1, 0x19

    .line 52
    .line 53
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lt11;->s:Lt11;

    .line 57
    .line 58
    new-instance v0, Lt11;

    .line 59
    .line 60
    const/16 v1, 0x1a

    .line 61
    .line 62
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lt11;->t:Lt11;

    .line 66
    .line 67
    new-instance v0, Lt11;

    .line 68
    .line 69
    const/16 v1, 0x1b

    .line 70
    .line 71
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 72
    .line 73
    .line 74
    sput-object v0, Lt11;->u:Lt11;

    .line 75
    .line 76
    new-instance v0, Lt11;

    .line 77
    .line 78
    const/16 v1, 0x1c

    .line 79
    .line 80
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lt11;->v:Lt11;

    .line 84
    .line 85
    new-instance v0, Lt11;

    .line 86
    .line 87
    const/16 v1, 0x1d

    .line 88
    .line 89
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 90
    .line 91
    .line 92
    sput-object v0, Lt11;->w:Lt11;

    .line 93
    .line 94
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 9
    iput p1, p0, Lt11;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ler0;)V
    .locals 0

    .line 1
    const/16 p1, 0xe

    .line 2
    .line 3
    iput p1, p0, Lt11;->j:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static d(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    move-object v2, v1

    .line 21
    check-cast v2, Liw0;

    .line 22
    .line 23
    sget-object v3, Liw0;->k:Liw0;

    .line 24
    .line 25
    if-eq v2, v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 32
    .line 33
    const/16 v1, 0xa

    .line 34
    .line 35
    invoke-static {v0, v1}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_1
    if-ge v2, v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    check-cast v3, Liw0;

    .line 56
    .line 57
    iget-object v3, v3, Liw0;->j:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    return-object p0
.end method

.method public static f(Ljava/util/List;)[B
    .locals 5

    .line 1
    new-instance v0, Leh;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lt11;->d(Ljava/util/List;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    check-cast v3, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-virtual {v0, v4}, Leh;->z(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, Leh;->F(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-wide v1, v0, Leh;->k:J

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Leh;->l(J)[B

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static j(Lm41;Lpa0;Lgq;Lp80;)Lwu;
    .locals 7

    .line 1
    sget-object v0, Lu00;->j:Lu00;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    const-string v3, "datastore_shared_counter"

    .line 6
    .line 7
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    new-instance v3, Lwu;

    .line 11
    .line 12
    new-instance v4, Lh30;

    .line 13
    .line 14
    new-instance v5, Ltu;

    .line 15
    .line 16
    const/4 v6, 0x2

    .line 17
    invoke-direct {v5, v6, p2}, Ltu;-><init>(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v4, p0, v5, p3}, Lh30;-><init>(Lm41;Lr80;Lp80;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Loj;

    .line 24
    .line 25
    invoke-direct {p0, v0, v2, v1}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v3, v4, p0, p1, p2}, Lwu;-><init>(Lh30;Ljava/util/List;Lpa0;Lzq;)V

    .line 33
    .line 34
    .line 35
    return-object v3

    .line 36
    :catch_0
    new-instance v3, Lh30;

    .line 37
    .line 38
    sget-object v4, Lf30;->l:Lf30;

    .line 39
    .line 40
    invoke-direct {v3, p0, v4, p3}, Lh30;-><init>(Lm41;Lr80;Lp80;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Loj;

    .line 44
    .line 45
    invoke-direct {p0, v0, v2, v1}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p3, Lwu;

    .line 53
    .line 54
    invoke-direct {p3, v3, p0, p1, p2}, Lwu;-><init>(Lh30;Ljava/util/List;Lpa0;Lzq;)V

    .line 55
    .line 56
    .line 57
    return-object p3
.end method

.method public static l(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "activity"

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of v2, p0, Landroid/app/ActivityManager;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    check-cast p0, Landroid/app/ActivityManager;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object p0, v3

    .line 31
    :goto_0
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    :cond_1
    sget-object p0, Lu00;->j:Lu00;

    .line 40
    .line 41
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_4

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    if-eqz v4, :cond_3

    .line 61
    .line 62
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    new-instance p0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    const/4 v5, 0x0

    .line 76
    move v6, v5

    .line 77
    :cond_5
    :goto_2
    if-ge v6, v4, :cond_6

    .line 78
    .line 79
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    add-int/lit8 v6, v6, 0x1

    .line 84
    .line 85
    move-object v8, v7

    .line 86
    check-cast v8, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 87
    .line 88
    iget v8, v8, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    .line 89
    .line 90
    if-ne v8, v0, :cond_5

    .line 91
    .line 92
    invoke-virtual {p0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    .line 97
    .line 98
    const/16 v2, 0xa

    .line 99
    .line 100
    invoke-static {p0, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    :goto_3
    if-ge v5, v2, :cond_8

    .line 112
    .line 113
    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    add-int/lit8 v5, v5, 0x1

    .line 118
    .line 119
    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 120
    .line 121
    new-instance v6, Lwd;

    .line 122
    .line 123
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 124
    .line 125
    .line 126
    iget-object v7, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v7, :cond_7

    .line 129
    .line 130
    iput-object v7, v6, Lwd;->a:Ljava/lang/String;

    .line 131
    .line 132
    iget v8, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    .line 133
    .line 134
    iput v8, v6, Lwd;->b:I

    .line 135
    .line 136
    iget-byte v8, v6, Lwd;->e:B

    .line 137
    .line 138
    or-int/lit8 v8, v8, 0x1

    .line 139
    .line 140
    int-to-byte v8, v8

    .line 141
    iget v4, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 142
    .line 143
    iput v4, v6, Lwd;->c:I

    .line 144
    .line 145
    or-int/lit8 v4, v8, 0x2

    .line 146
    .line 147
    int-to-byte v4, v4

    .line 148
    iput-byte v4, v6, Lwd;->e:B

    .line 149
    .line 150
    invoke-static {v7, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    iput-boolean v4, v6, Lwd;->d:Z

    .line 155
    .line 156
    iget-byte v4, v6, Lwd;->e:B

    .line 157
    .line 158
    or-int/lit8 v4, v4, 0x4

    .line 159
    .line 160
    int-to-byte v4, v4

    .line 161
    iput-byte v4, v6, Lwd;->e:B

    .line 162
    .line 163
    invoke-virtual {v6}, Lwd;->a()Lxd;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_7
    const-string p0, "Null processName"

    .line 172
    .line 173
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-object v3

    .line 177
    :cond_8
    return-object v0
.end method

.method public static declared-synchronized n()Lt11;
    .locals 3

    .line 1
    const-class v0, Lt11;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lt11;->k:Lt11;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lt11;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, v2}, Lt11;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v1, Lt11;->k:Lt11;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-object v1

    .line 21
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v1
.end method

.method public static p(Ljava/lang/String;)Lek;
    .locals 2

    .line 1
    new-instance v0, Lek;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lek;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lek;->d:Ljava/util/LinkedHashMap;

    .line 7
    .line 8
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static q()Z
    .locals 2

    .line 1
    const-string v0, "java.vm.name"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Dalvik"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static r(Ljava/io/File;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "firebaseSessions"

    .line 25
    .line 26
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const-string v0, "Failed to delete conflicting file: "

    .line 40
    .line 41
    invoke-static {p0, v0}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 53
    .line 54
    const/16 v1, 0x1a

    .line 55
    .line 56
    const-string v2, "Failed to create directory: "

    .line 57
    .line 58
    if-lt v0, v1, :cond_4

    .line 59
    .line 60
    :try_start_0
    invoke-static {p0}, Li1;->h(Ljava/io/File;)Ljava/nio/file/Path;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x0

    .line 65
    new-array v1, v1, [Ljava/nio/file/attribute/FileAttribute;

    .line 66
    .line 67
    invoke-static {v0, v1}, Li1;->x(Ljava/nio/file/Path;[Ljava/nio/file/attribute/FileAttribute;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :catch_0
    move-exception v0

    .line 72
    new-instance v1, Ljava/io/IOException;

    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {v1, p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    throw v1

    .line 90
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_5
    invoke-static {p0, v2}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_6
    :goto_1
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 4

    .line 1
    iget p0, p0, Lt11;->j:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object p0, Lxx1;->a:Ljava/util/List;

    .line 7
    .line 8
    sget-object p0, Llr1;->k:Llr1;

    .line 9
    .line 10
    invoke-virtual {p0}, Llr1;->a()Lmr1;

    .line 11
    .line 12
    .line 13
    sget-object p0, Lmr1;->a:Lka2;

    .line 14
    .line 15
    const/16 v0, 0x14

    .line 16
    .line 17
    const-wide/32 v1, 0x186a0

    .line 18
    .line 19
    .line 20
    const-string v3, "measurement.store.max_stored_events_per_app"

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v2, v3}, Lka2;->c(IJLjava/lang/String;)Lm92;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lm92;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/Long;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    long-to-int p0, v0

    .line 37
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :pswitch_0
    sget-object p0, Lxx1;->a:Ljava/util/List;

    .line 43
    .line 44
    sget-object p0, Llr1;->k:Llr1;

    .line 45
    .line 46
    invoke-virtual {p0}, Llr1;->a()Lmr1;

    .line 47
    .line 48
    .line 49
    sget-object p0, Lmr1;->a:Lka2;

    .line 50
    .line 51
    const/16 v0, 0x45

    .line 52
    .line 53
    const-wide/16 v1, 0x3e8

    .line 54
    .line 55
    const-string v3, "measurement.upload.max_error_events_per_day"

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1, v2, v3}, Lka2;->c(IJLjava/lang/String;)Lm92;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lm92;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ljava/lang/Long;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v0

    .line 71
    long-to-int p0, v0

    .line 72
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :pswitch_1
    sget-object p0, Lxx1;->a:Ljava/util/List;

    .line 78
    .line 79
    sget-object p0, Llr1;->k:Llr1;

    .line 80
    .line 81
    invoke-virtual {p0}, Llr1;->a()Lmr1;

    .line 82
    .line 83
    .line 84
    sget-object p0, Lmr1;->a:Lka2;

    .line 85
    .line 86
    const/16 v0, 0xe

    .line 87
    .line 88
    const-string v1, "measurement.edpb.events_cached_in_no_data_mode"

    .line 89
    .line 90
    const-string v2, "_f,_v,_cmp"

    .line 91
    .line 92
    invoke-virtual {p0, v1, v2, v0}, Lka2;->e(Ljava/lang/String;Ljava/lang/String;I)Lm92;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lm92;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Ljava/lang/String;

    .line 101
    .line 102
    return-object p0

    .line 103
    :pswitch_2
    sget-object p0, Lzr1;->k:Lzr1;

    .line 104
    .line 105
    iget-object p0, p0, Lzr1;->j:Lva1;

    .line 106
    .line 107
    iget-object p0, p0, Lva1;->j:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast p0, Las1;

    .line 110
    .line 111
    sget-object p0, Las1;->a:Ly82;

    .line 112
    .line 113
    invoke-virtual {p0}, Lm92;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Ljava/lang/Boolean;

    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    new-instance v0, Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ljava/lang/Boolean;-><init>(Z)V

    .line 126
    .line 127
    .line 128
    return-object v0

    .line 129
    :pswitch_data_0
    .packed-switch 0x1a
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b([BII)[B
    .locals 0

    .line 1
    add-int/2addr p3, p2

    .line 2
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public e([Ljava/lang/StackTraceElement;)[Ljava/lang/StackTraceElement;
    .locals 2

    .line 1
    array-length p0, p1

    .line 2
    const/16 v0, 0x400

    .line 3
    .line 4
    if-gt p0, v0, :cond_0

    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    new-array p0, v0, [Ljava/lang/StackTraceElement;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/16 v1, 0x200

    .line 11
    .line 12
    invoke-static {p1, v0, p0, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    array-length v0, p1

    .line 16
    sub-int/2addr v0, v1

    .line 17
    invoke-static {p1, v0, p0, v1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public g(Lh40;Lkq;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p2, Loe0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Loe0;

    .line 7
    .line 8
    iget v1, v0, Loe0;->p:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Loe0;->p:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Loe0;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Loe0;-><init>(Lt11;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p0, v0, Loe0;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget p2, v0, Loe0;->p:I

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    const/4 v2, 0x1

    .line 31
    const-string v3, ""

    .line 32
    .line 33
    sget-object v4, Lar;->j:Lar;

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    if-eq p2, v2, :cond_2

    .line 38
    .line 39
    if-ne p2, v1, :cond_1

    .line 40
    .line 41
    iget-object p1, v0, Loe0;->m:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p1, Ljava/lang/String;

    .line 44
    .line 45
    :try_start_0
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 46
    .line 47
    .line 48
    goto :goto_4

    .line 49
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 50
    .line 51
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return-object p0

    .line 56
    :cond_2
    iget-object p1, v0, Loe0;->m:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast p1, Lh40;

    .line 59
    .line 60
    :try_start_1
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    invoke-static {p0}, Lk42;->n(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :try_start_2
    move-object p0, p1

    .line 68
    check-cast p0, Lg40;

    .line 69
    .line 70
    invoke-virtual {p0}, Lg40;->e()Ljd2;

    .line 71
    .line 72
    .line 73
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 74
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    iput-object p0, v0, Loe0;->m:Ljava/lang/Object;

    .line 78
    .line 79
    iput v2, v0, Loe0;->p:I

    .line 80
    .line 81
    invoke-static {p1, v0}, Lml;->a(Ljd2;Loe0;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 85
    if-ne p1, v4, :cond_4

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_4
    move-object v5, p1

    .line 89
    move-object p1, p0

    .line 90
    move-object p0, v5

    .line 91
    :goto_1
    :try_start_4
    check-cast p0, Lte;

    .line 92
    .line 93
    iget-object p0, p0, Lte;->a:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 94
    .line 95
    move-object v5, p1

    .line 96
    move-object p1, p0

    .line 97
    move-object p0, v5

    .line 98
    goto :goto_2

    .line 99
    :catch_0
    move-object p1, p0

    .line 100
    :catch_1
    move-object p0, p1

    .line 101
    move-object p1, v3

    .line 102
    :goto_2
    :try_start_5
    check-cast p0, Lg40;

    .line 103
    .line 104
    invoke-virtual {p0}, Lg40;->c()Ljd2;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    iput-object p1, v0, Loe0;->m:Ljava/lang/Object;

    .line 112
    .line 113
    iput v1, v0, Loe0;->p:I

    .line 114
    .line 115
    invoke-static {p0, v0}, Lml;->a(Ljd2;Loe0;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    if-ne p0, v4, :cond_5

    .line 120
    .line 121
    :goto_3
    return-object v4

    .line 122
    :cond_5
    :goto_4
    check-cast p0, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 123
    .line 124
    if-nez p0, :cond_6

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_6
    move-object v3, p0

    .line 128
    :catch_2
    :goto_5
    new-instance p0, Lpe0;

    .line 129
    .line 130
    invoke-direct {p0, v3, p1}, Lpe0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-object p0
.end method

.method public get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lbv;->e(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public h(Li7;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget p0, p0, Lt11;->j:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;->zza(Lgm;)Lj4;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance p0, Lsw0;

    .line 12
    .line 13
    const-class v0, Lwf;

    .line 14
    .line 15
    const-class v1, Ljava/util/concurrent/Executor;

    .line 16
    .line 17
    invoke-direct {p0, v0, v1}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Li7;->g(Lsw0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    check-cast p0, Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    new-instance p1, Ls10;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ls10;-><init>(Ljava/util/concurrent/Executor;)V

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public i(Ljava/lang/Class;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public declared-synchronized k(Ljava/lang/String;)Lek;
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    sget-object v0, Lek;->d:Ljava/util/LinkedHashMap;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lek;

    .line 12
    .line 13
    if-nez v1, :cond_3

    .line 14
    .line 15
    const-string v1, "SSL_"

    .line 16
    .line 17
    const-string v2, "TLS_"

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {p1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/4 v5, 0x4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {p1, v1, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move-object v1, p1

    .line 52
    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lek;

    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    new-instance v1, Lek;

    .line 61
    .line 62
    invoke-direct {v1, p1}, Lek;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    :goto_1
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    .line 71
    :cond_3
    monitor-exit p0

    .line 72
    return-object v1

    .line 73
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    throw p1
.end method

.method public m(Landroid/content/Context;)Ljs;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-static {p1}, Lt11;->l(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :cond_0
    if-ge v2, v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    move-object v4, v3

    .line 27
    check-cast v4, Ljs;

    .line 28
    .line 29
    check-cast v4, Lxd;

    .line 30
    .line 31
    iget v4, v4, Lxd;->b:I

    .line 32
    .line 33
    if-ne v4, p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v3, 0x0

    .line 37
    :goto_0
    check-cast v3, Ljs;

    .line 38
    .line 39
    if-nez v3, :cond_5

    .line 40
    .line 41
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 42
    .line 43
    const/16 v0, 0x21

    .line 44
    .line 45
    if-le p1, v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lh1;->f()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/16 v0, 0x1c

    .line 56
    .line 57
    const-string v2, ""

    .line 58
    .line 59
    if-lt p1, v0, :cond_3

    .line 60
    .line 61
    invoke-static {}, Ld1;->q()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    :cond_3
    move-object p1, v2

    .line 68
    :cond_4
    :goto_1
    new-instance v0, Lwd;

    .line 69
    .line 70
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p1, v0, Lwd;->a:Ljava/lang/String;

    .line 74
    .line 75
    iput p0, v0, Lwd;->b:I

    .line 76
    .line 77
    iget-byte p0, v0, Lwd;->e:B

    .line 78
    .line 79
    or-int/lit8 p0, p0, 0x1

    .line 80
    .line 81
    int-to-byte p0, p0

    .line 82
    iput v1, v0, Lwd;->c:I

    .line 83
    .line 84
    or-int/lit8 p0, p0, 0x2

    .line 85
    .line 86
    int-to-byte p0, p0

    .line 87
    iput-boolean v1, v0, Lwd;->d:Z

    .line 88
    .line 89
    or-int/lit8 p0, p0, 0x4

    .line 90
    .line 91
    int-to-byte p0, p0

    .line 92
    iput-byte p0, v0, Lwd;->e:B

    .line 93
    .line 94
    invoke-virtual {v0}, Lwd;->a()Lxd;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_5
    return-object v3
.end method

.method public o(Ljava/lang/Class;)Luq1;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string p1, "This should never be called."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
