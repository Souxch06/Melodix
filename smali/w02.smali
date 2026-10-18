.class public final Lw02;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lz22;

.field public final synthetic k:Ly02;


# direct methods
.method public constructor <init>(Ly02;Lz22;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lw02;->j:Lz22;

    .line 5
    .line 6
    iput-object p1, p0, Lw02;->k:Ly02;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 31

    move-object/from16 v0, p0

    .line 1
    iget-object v2, v0, Lw02;->k:Ly02;

    iget-object v8, v2, Ly02;->p:Ls02;

    iget-object v9, v2, Ly02;->o:Lzy1;

    iget-object v10, v2, Ly02;->n:Lvz1;

    iget-object v11, v2, Ly02;->r:Lcb2;

    .line 2
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 3
    invoke-virtual {v8}, Ls02;->l()V

    iget-object v12, v2, Ly02;->m:Lmt1;

    .line 4
    iget-object v1, v12, Let;->j:Ljava/lang/Object;

    check-cast v1, Ly02;

    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    new-instance v1, Lou1;

    .line 7
    invoke-direct {v1, v2}, Let;-><init>(Ly02;)V

    iget-object v3, v1, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 8
    iget v4, v3, Ly02;->J:I

    const/4 v13, 0x1

    add-int/2addr v4, v13

    .line 9
    iput v4, v3, Ly02;->J:I

    .line 10
    invoke-virtual {v1}, Lm22;->o()V

    iput-object v1, v2, Ly02;->B:Lou1;

    iget-object v0, v0, Lw02;->j:Lz22;

    iget-object v1, v0, Lz22;->d:Llw1;

    if-nez v1, :cond_0

    const-wide/16 v5, 0x0

    goto :goto_0

    .line 11
    :cond_0
    iget-wide v3, v1, Llw1;->j:J

    move-wide v5, v3

    .line 12
    :goto_0
    const-string v3, ""

    if-eqz v1, :cond_2

    iget-object v1, v1, Llw1;->m:Landroid/os/Bundle;

    if-nez v1, :cond_1

    goto :goto_1

    .line 13
    :cond_1
    const-string v4, "runtime_google_app_id"

    .line 14
    invoke-virtual {v1, v4, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v7, v1

    goto :goto_2

    :cond_2
    :goto_1
    move-object v7, v3

    .line 15
    :goto_2
    new-instance v1, Lky1;

    const-wide/16 v16, 0x0

    iget-wide v14, v0, Lz22;->c:J

    move-object v0, v3

    move-wide v3, v14

    .line 16
    invoke-direct/range {v1 .. v7}, Lky1;-><init>(Ly02;JJLjava/lang/String;)V

    .line 17
    invoke-virtual {v1}, Lay1;->n()V

    iput-object v1, v2, Ly02;->C:Lky1;

    .line 18
    new-instance v3, Lpy1;

    invoke-direct {v3, v2}, Lpy1;-><init>(Ly02;)V

    .line 19
    invoke-virtual {v3}, Lay1;->n()V

    iput-object v3, v2, Ly02;->z:Lpy1;

    new-instance v3, Li82;

    .line 20
    invoke-direct {v3, v2}, Li82;-><init>(Ly02;)V

    .line 21
    invoke-virtual {v3}, Lay1;->n()V

    iput-object v3, v2, Ly02;->A:Li82;

    .line 22
    iget-boolean v3, v11, Lm22;->k:Z

    iget-object v4, v11, Let;->j:Ljava/lang/Object;

    check-cast v4, Ly02;

    .line 23
    const-string v5, "Can\'t initialize twice"

    if-nez v3, :cond_4b

    .line 24
    invoke-virtual {v11}, Let;->l()V

    new-instance v3, Ljava/security/SecureRandom;

    .line 25
    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    .line 26
    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    cmp-long v14, v6, v16

    if-nez v14, :cond_3

    .line 27
    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    cmp-long v3, v6, v16

    if-nez v3, :cond_3

    iget-object v3, v11, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 28
    iget-object v3, v3, Ly02;->o:Lzy1;

    .line 29
    invoke-static {v3}, Ly02;->l(Lm22;)V

    .line 30
    iget-object v3, v3, Lzy1;->r:Lso;

    .line 31
    const-string v14, "Utils falling back to Random for random id"

    invoke-virtual {v3, v14}, Lso;->b(Ljava/lang/String;)V

    :cond_3
    iget-object v3, v11, Lcb2;->m:Ljava/util/concurrent/atomic/AtomicLong;

    .line 32
    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 33
    iget-object v3, v4, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 35
    iput-boolean v13, v11, Lm22;->k:Z

    .line 36
    iget-boolean v3, v10, Lm22;->k:Z

    if-nez v3, :cond_4a

    .line 37
    iget-object v3, v10, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 38
    iget-object v3, v3, Ly02;->j:Landroid/content/Context;

    .line 39
    const-string v6, "com.google.android.gms.measurement.prefs"

    const/4 v7, 0x0

    .line 40
    invoke-virtual {v3, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, v10, Lvz1;->l:Landroid/content/SharedPreferences;

    .line 41
    const-string v6, "has_been_opened"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v10, Lvz1;->A:Z

    if-nez v3, :cond_4

    iget-object v3, v10, Lvz1;->l:Landroid/content/SharedPreferences;

    .line 42
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 43
    invoke-interface {v3, v6, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 44
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_4
    new-instance v3, Ldk;

    .line 45
    sget-object v6, Lxx1;->d:Lwx1;

    const/4 v14, 0x0

    .line 46
    invoke-virtual {v6, v14}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 47
    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    move-object v6, v8

    move-wide/from16 v7, v16

    invoke-static {v7, v8, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    .line 48
    invoke-direct {v3, v10, v14, v15}, Ldk;-><init>(Lvz1;J)V

    iput-object v3, v10, Lvz1;->n:Ldk;

    .line 49
    iget-object v3, v10, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 50
    iget-object v3, v3, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 51
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 52
    iput-boolean v13, v10, Lm22;->k:Z

    .line 53
    iget-object v3, v2, Ly02;->C:Lky1;

    .line 54
    iget-boolean v7, v3, Lay1;->k:Z

    if-nez v7, :cond_49

    .line 55
    iget-object v7, v3, Let;->j:Ljava/lang/Object;

    check-cast v7, Ly02;

    .line 56
    iget-object v8, v7, Ly02;->o:Lzy1;

    iget-object v14, v7, Ly02;->o:Lzy1;

    .line 57
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 58
    iget-object v8, v8, Lzy1;->w:Lso;

    move-object/from16 v18, v14

    .line 59
    iget-wide v13, v3, Lky1;->s:J

    .line 60
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    move-object v14, v5

    move-object/from16 v19, v6

    iget-wide v5, v3, Lky1;->r:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const-string v6, "sdkVersion bundled with app, dynamiteVersion"

    invoke-virtual {v8, v6, v13, v5}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    iget-object v5, v7, Ly02;->j:Landroid/content/Context;

    .line 62
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 63
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const-string v20, "Unknown"

    const-string v21, "unknown"

    if-nez v8, :cond_5

    .line 64
    invoke-static/range {v18 .. v18}, Ly02;->l(Lm22;)V

    move-object/from16 v13, v18

    .line 65
    iget-object v15, v13, Lzy1;->o:Lso;

    move-object/from16 v23, v1

    .line 66
    invoke-static {v6}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v1

    move-object/from16 v24, v14

    const-string v14, "PackageManager is null, app identity information might be inaccurate. appId"

    .line 67
    invoke-virtual {v15, v1, v14}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_3
    move-object/from16 v25, v8

    move-object/from16 v1, v20

    move-object v15, v1

    :goto_4
    move-object/from16 v8, v21

    const/high16 v14, -0x80000000

    goto/16 :goto_b

    :cond_5
    move-object/from16 v23, v1

    move-object/from16 v24, v14

    move-object/from16 v13, v18

    .line 68
    :try_start_0
    invoke-virtual {v8, v6}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    .line 69
    :catch_0
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 70
    iget-object v1, v13, Lzy1;->o:Lso;

    .line 71
    invoke-static {v6}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v14

    const-string v15, "Error retrieving app installer package name. appId"

    .line 72
    invoke-virtual {v1, v14, v15}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v1, v21

    :goto_5
    if-nez v1, :cond_6

    .line 73
    const-string v1, "manual_install"

    goto :goto_6

    .line 74
    :cond_6
    const-string v14, "com.android.vending"

    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    move-object v1, v0

    .line 75
    :cond_7
    :goto_6
    :try_start_1
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v8, v14, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v14

    if-eqz v14, :cond_9

    .line 76
    iget-object v15, v14, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 77
    invoke-virtual {v8, v15}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v15

    .line 78
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v21

    if-nez v21, :cond_8

    .line 79
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_7
    move-object/from16 v21, v1

    goto :goto_8

    :catch_1
    move-object/from16 v21, v1

    goto :goto_9

    :cond_8
    move-object/from16 v15, v20

    goto :goto_7

    .line 80
    :goto_8
    :try_start_2
    iget-object v1, v14, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_3

    .line 81
    :try_start_3
    iget v14, v14, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    move-object/from16 v25, v8

    move-object/from16 v8, v21

    goto :goto_b

    :catch_2
    move-object/from16 v20, v1

    goto :goto_a

    :cond_9
    move-object/from16 v21, v1

    goto :goto_3

    :goto_9
    move-object/from16 v15, v20

    .line 82
    :catch_3
    :goto_a
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 83
    iget-object v1, v13, Lzy1;->o:Lso;

    .line 84
    invoke-static {v6}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v14

    move-object/from16 v25, v8

    const-string v8, "Error retrieving package info. appId, appName"

    .line 85
    invoke-virtual {v1, v8, v14, v15}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v1, v20

    goto :goto_4

    .line 86
    :goto_b
    iput-object v6, v3, Lky1;->l:Ljava/lang/String;

    iput-object v8, v3, Lky1;->o:Ljava/lang/String;

    iput-object v1, v3, Lky1;->m:Ljava/lang/String;

    iput v14, v3, Lky1;->n:I

    iput-object v15, v3, Lky1;->p:Ljava/lang/String;

    const-wide/16 v14, 0x0

    iput-wide v14, v3, Lky1;->q:J

    .line 87
    invoke-virtual {v7}, Ly02;->g()I

    move-result v1

    if-eqz v1, :cond_10

    const/4 v15, 0x1

    if-eq v1, v15, :cond_f

    const/4 v8, 0x3

    if-eq v1, v8, :cond_e

    const/4 v8, 0x4

    if-eq v1, v8, :cond_d

    const/4 v8, 0x6

    if-eq v1, v8, :cond_c

    const/4 v8, 0x7

    if-eq v1, v8, :cond_b

    const/16 v8, 0x8

    if-eq v1, v8, :cond_a

    .line 88
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 89
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 90
    const-string v14, "App measurement disabled"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    .line 91
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 92
    iget-object v8, v13, Lzy1;->p:Lso;

    .line 93
    const-string v14, "Invalid scion state in identity"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 94
    :cond_a
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 95
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 96
    const-string v14, "App measurement disabled due to denied storage consent"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 97
    :cond_b
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 98
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 99
    const-string v14, "App measurement disabled via the global data collection setting"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 100
    :cond_c
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 101
    iget-object v8, v13, Lzy1;->t:Lso;

    .line 102
    const-string v14, "App measurement deactivated via resources. This method is being deprecated. Please refer to https://firebase.google.com/support/guides/disable-analytics"

    .line 103
    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 104
    :cond_d
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 105
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 106
    const-string v14, "App measurement disabled via the manifest"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 107
    :cond_e
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 108
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 109
    const-string v14, "App measurement disabled by setAnalyticsCollectionEnabled(false)"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 110
    :cond_f
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 111
    iget-object v8, v13, Lzy1;->u:Lso;

    .line 112
    const-string v14, "App measurement deactivated via the manifest"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    goto :goto_c

    .line 113
    :cond_10
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 114
    iget-object v8, v13, Lzy1;->w:Lso;

    .line 115
    const-string v14, "App measurement collection enabled"

    invoke-virtual {v8, v14}, Lso;->b(Ljava/lang/String;)V

    .line 116
    :goto_c
    iput-object v0, v3, Lky1;->x:Ljava/lang/String;

    .line 117
    :try_start_4
    iget-object v8, v3, Lky1;->v:Ljava/lang/String;

    .line 118
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_11

    goto :goto_d

    .line 119
    :cond_11
    iget-object v8, v7, Ly02;->y:Ljava/lang/String;

    .line 120
    invoke-static {v5, v8}, Lst;->A(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 121
    :goto_d
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_12

    goto :goto_e

    :cond_12
    move-object v0, v8

    :goto_e
    iput-object v0, v3, Lky1;->x:Ljava/lang/String;

    if-nez v1, :cond_13

    .line 122
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 123
    iget-object v0, v13, Lzy1;->w:Lso;

    .line 124
    const-string v1, "App measurement enabled for app package, google app id"

    iget-object v8, v3, Lky1;->l:Ljava/lang/String;

    iget-object v14, v3, Lky1;->x:Ljava/lang/String;

    .line 125
    invoke-virtual {v0, v1, v8, v14}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_4

    :cond_13
    :goto_f
    const/4 v1, 0x0

    goto :goto_10

    :catch_4
    move-exception v0

    .line 126
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 127
    iget-object v1, v13, Lzy1;->o:Lso;

    .line 128
    invoke-static {v6}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v6

    const-string v8, "Fetching Google App Id failed with exception. appId"

    .line 129
    invoke-virtual {v1, v8, v6, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_f

    .line 130
    :goto_10
    iput-object v1, v3, Lky1;->t:Ljava/util/List;

    .line 131
    iget-object v0, v7, Ly02;->m:Lmt1;

    .line 132
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    check-cast v1, Ly02;

    .line 133
    const-string v6, "analytics.safelisted_events"

    invoke-static {v6}, Lbh;->e(Ljava/lang/String;)V

    .line 134
    invoke-virtual {v0}, Lmt1;->x()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_14

    .line 135
    iget-object v0, v1, Ly02;->o:Lzy1;

    .line 136
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 137
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 138
    const-string v6, "Failed to load metadata: Metadata bundle is null"

    invoke-virtual {v0, v6}, Lso;->b(Ljava/lang/String;)V

    :goto_11
    const/4 v0, 0x0

    goto :goto_12

    .line 139
    :cond_14
    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_15

    goto :goto_11

    .line 140
    :cond_15
    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_12
    if-eqz v0, :cond_16

    .line 141
    :try_start_5
    iget-object v6, v1, Ly02;->j:Landroid/content/Context;

    .line 142
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_17

    :cond_16
    :goto_13
    const/4 v0, 0x0

    goto :goto_14

    .line 143
    :cond_17
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0
    :try_end_5
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_14

    :catch_5
    move-exception v0

    .line 144
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 145
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 146
    iget-object v1, v1, Lzy1;->o:Lso;

    .line 147
    const-string v6, "Failed to load string array from metadata: resource not found"

    invoke-virtual {v1, v0, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_13

    :goto_14
    if-nez v0, :cond_18

    goto :goto_15

    .line 148
    :cond_18
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 149
    invoke-static {v13}, Ly02;->l(Lm22;)V

    .line 150
    iget-object v0, v13, Lzy1;->t:Lso;

    .line 151
    const-string v1, "Safelisted event list is empty. Ignoring"

    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    goto :goto_16

    .line 152
    :cond_19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 153
    iget-object v8, v7, Ly02;->r:Lcb2;

    invoke-static {v8}, Ly02;->j(Let;)V

    .line 154
    const-string v13, "safelisted event"

    .line 155
    invoke-virtual {v8, v13, v6}, Lcb2;->p0(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1a

    goto :goto_16

    .line 156
    :cond_1b
    :goto_15
    iput-object v0, v3, Lky1;->t:Ljava/util/List;

    :goto_16
    if-eqz v25, :cond_1c

    .line 157
    invoke-static {v5}, Lqe0;->j(Landroid/content/Context;)Z

    move-result v0

    iput v0, v3, Lky1;->w:I

    goto :goto_17

    :cond_1c
    const/4 v1, 0x0

    iput v1, v3, Lky1;->w:I

    .line 158
    :goto_17
    iget-object v0, v3, Let;->j:Ljava/lang/Object;

    check-cast v0, Ly02;

    .line 159
    iget-object v0, v0, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 160
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    const/4 v15, 0x1

    .line 161
    iput-boolean v15, v3, Lay1;->k:Z

    .line 162
    new-instance v0, Lj52;

    .line 163
    invoke-direct {v0, v2}, Let;-><init>(Ly02;)V

    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Ly02;

    .line 164
    iget v5, v3, Ly02;->J:I

    add-int/2addr v5, v15

    .line 165
    iput v5, v3, Ly02;->J:I

    .line 166
    invoke-virtual {v0}, Lay1;->n()V

    iput-object v0, v2, Ly02;->D:Lj52;

    .line 167
    iget-boolean v5, v0, Lay1;->k:Z

    if-nez v5, :cond_48

    .line 168
    check-cast v1, Ly02;

    .line 169
    iget-object v1, v1, Ly02;->j:Landroid/content/Context;

    .line 170
    const-string v5, "jobscheduler"

    .line 171
    invoke-virtual {v1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/job/JobScheduler;

    iput-object v1, v0, Lj52;->l:Landroid/app/job/JobScheduler;

    .line 172
    iget-object v1, v3, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 173
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    const/4 v15, 0x1

    .line 174
    iput-boolean v15, v0, Lay1;->k:Z

    .line 175
    invoke-static {v9}, Ly02;->l(Lm22;)V

    iget-object v0, v9, Lzy1;->v:Lso;

    iget-object v1, v9, Lzy1;->u:Lso;

    iget-object v3, v9, Lzy1;->w:Lso;

    iget-object v5, v9, Lzy1;->o:Lso;

    .line 176
    invoke-virtual {v12}, Lmt1;->r()V

    const-wide/32 v6, 0x274e8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v7, "App measurement initialized, version"

    invoke-virtual {v1, v6, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 178
    const-string v6, "To enable debug logging run: adb shell setprop log.tag.FA VERBOSE"

    invoke-virtual {v1, v6}, Lso;->b(Ljava/lang/String;)V

    .line 179
    invoke-virtual/range {v23 .. v23}, Lky1;->r()Ljava/lang/String;

    move-result-object v6

    .line 180
    iget-object v7, v12, Lmt1;->l:Ljava/lang/String;

    .line 181
    invoke-virtual {v11, v6, v7}, Lcb2;->Q(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 182
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 183
    const-string v6, "Faster debug mode event logging enabled. To disable, run:\n  adb shell setprop debug.firebase.analytics.app .none."

    .line 184
    invoke-virtual {v1, v6}, Lso;->b(Ljava/lang/String;)V

    goto :goto_18

    .line 185
    :cond_1d
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 186
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "To enable faster debug mode event logging run:\n  adb shell setprop debug.firebase.analytics.app "

    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 187
    invoke-virtual {v1, v6}, Lso;->b(Ljava/lang/String;)V

    .line 188
    :goto_18
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 189
    const-string v6, "Debug-level message logging enabled"

    invoke-virtual {v0, v6}, Lso;->b(Ljava/lang/String;)V

    iget v6, v2, Ly02;->J:I

    iget-object v7, v2, Ly02;->L:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 190
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v8

    if-eq v6, v8, :cond_1e

    .line 191
    invoke-static {v9}, Ly02;->l(Lm22;)V

    .line 192
    iget v6, v2, Ly02;->J:I

    .line 193
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v8, "Not all components initialized"

    invoke-virtual {v5, v8, v6, v7}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1e
    const/4 v15, 0x1

    iput-boolean v15, v2, Ly02;->E:Z

    .line 194
    iget-wide v6, v2, Ly02;->M:J

    iget-object v8, v2, Ly02;->v:Lc52;

    invoke-static/range {v19 .. v19}, Ly02;->l(Lm22;)V

    .line 195
    invoke-virtual/range {v19 .. v19}, Ls02;->l()V

    .line 196
    iget-object v13, v2, Ly02;->D:Lj52;

    invoke-static {v13}, Ly02;->i(Lgx1;)V

    iget-object v13, v2, Ly02;->D:Lj52;

    .line 197
    invoke-virtual {v13}, Lj52;->q()I

    move-result v13

    .line 198
    invoke-static {}, Lqs1;->a()V

    .line 199
    sget-object v14, Lxx1;->P0:Lwx1;

    const/4 v15, 0x0

    .line 200
    invoke-virtual {v12, v15, v14}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v14

    const/4 v15, 0x2

    if-ne v13, v15, :cond_1f

    const/4 v13, 0x1

    goto :goto_19

    :cond_1f
    const/4 v13, 0x0

    :goto_19
    const-wide/16 v19, 0x1

    if-eqz v14, :cond_20

    .line 201
    invoke-virtual {v11}, Let;->l()V

    .line 202
    invoke-virtual {v11}, Lcb2;->I()J

    move-result-wide v21

    cmp-long v14, v21, v19

    if-nez v14, :cond_20

    goto :goto_1a

    :cond_20
    if-eqz v13, :cond_23

    const/4 v13, 0x1

    .line 203
    :goto_1a
    invoke-virtual {v11}, Let;->l()V

    new-instance v14, Landroid/content/IntentFilter;

    .line 204
    invoke-direct {v14}, Landroid/content/IntentFilter;-><init>()V

    const-string v15, "com.google.android.gms.measurement.TRIGGERS_AVAILABLE"

    .line 205
    invoke-virtual {v14, v15}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v15, "com.google.android.gms.measurement.BATCHES_AVAILABLE"

    .line 206
    invoke-virtual {v14, v15}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v15, Lc7;

    .line 207
    invoke-direct {v15, v4}, Lc7;-><init>(Ly02;)V

    move/from16 v27, v13

    iget-object v13, v4, Ly02;->j:Landroid/content/Context;

    move-object/from16 v21, v13

    .line 208
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    move-object/from16 v23, v14

    const/16 v14, 0x21

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x2

    if-lt v13, v14, :cond_21

    move-object/from16 v22, v15

    .line 209
    invoke-static/range {v21 .. v26}, Lfq;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    :goto_1b
    move-object/from16 v22, v1

    move-object/from16 v21, v9

    goto :goto_1c

    :cond_21
    move-object/from16 v22, v15

    const/16 v14, 0x1a

    if-lt v13, v14, :cond_22

    .line 210
    invoke-static/range {v21 .. v26}, Ldq;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    goto :goto_1b

    :cond_22
    move-object/from16 v15, v21

    move-object/from16 v14, v22

    move-object/from16 v13, v23

    move-object/from16 v22, v1

    move-object/from16 v21, v9

    move-object/from16 v9, v24

    move-object/from16 v1, v25

    .line 211
    invoke-virtual {v15, v14, v13, v9, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 212
    :goto_1c
    iget-object v1, v4, Ly02;->o:Lzy1;

    .line 213
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 214
    iget-object v1, v1, Lzy1;->v:Lso;

    .line 215
    const-string v9, "Registered app receiver"

    invoke-virtual {v1, v9}, Lso;->b(Ljava/lang/String;)V

    if-eqz v27, :cond_24

    .line 216
    iget-object v1, v2, Ly02;->D:Lj52;

    invoke-static {v1}, Ly02;->i(Lgx1;)V

    iget-object v1, v2, Ly02;->D:Lj52;

    .line 217
    sget-object v9, Lxx1;->C:Lwx1;

    const/4 v15, 0x0

    .line 218
    invoke-virtual {v9, v15}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 219
    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    invoke-virtual {v1, v13, v14}, Lj52;->p(J)V

    goto :goto_1d

    :cond_23
    move-object/from16 v22, v1

    move-object/from16 v21, v9

    .line 220
    :cond_24
    :goto_1d
    iget-object v1, v10, Lvz1;->p:Lvx;

    .line 221
    invoke-virtual {v10}, Lvz1;->s()Lu22;

    move-result-object v9

    .line 222
    iget v13, v9, Lu22;->b:I

    .line 223
    const-string v14, "google_analytics_default_allow_ad_storage"

    const/4 v15, 0x0

    .line 224
    invoke-virtual {v12, v14, v15}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    move-result-object v14

    move-object/from16 v23, v9

    const-string v9, "google_analytics_default_allow_analytics_storage"

    .line 225
    invoke-virtual {v12, v9, v15}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    move-result-object v9

    .line 226
    sget-object v15, Lt22;->l:Lt22;

    move-object/from16 v25, v4

    const-class v4, Lt22;

    move-object/from16 v26, v1

    sget-object v1, Lq22;->k:Lq22;

    if-ne v14, v1, :cond_25

    if-eq v9, v1, :cond_26

    :cond_25
    move-object/from16 v28, v2

    goto :goto_1e

    :cond_26
    move-object/from16 v28, v2

    move-object/from16 v29, v5

    move-object/from16 v30, v11

    goto :goto_1f

    .line 227
    :goto_1e
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v2

    move-object/from16 v29, v5

    const-string v5, "consent_source"

    move-object/from16 v30, v11

    const/16 v11, 0x64

    invoke-interface {v2, v5, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/16 v5, -0xa

    .line 228
    invoke-static {v5, v2}, Lu22;->l(II)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 229
    new-instance v2, Ljava/util/EnumMap;

    invoke-direct {v2, v4}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 230
    sget-object v11, Lt22;->k:Lt22;

    invoke-virtual {v2, v11, v14}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    invoke-virtual {v2, v15, v9}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lu22;

    .line 232
    invoke-direct {v9, v2, v5}, Lu22;-><init>(Ljava/util/EnumMap;I)V

    const/16 v2, 0x1e

    goto :goto_22

    .line 233
    :cond_27
    :goto_1f
    invoke-virtual/range {v28 .. v28}, Ly02;->p()Lky1;

    move-result-object v2

    invoke-virtual {v2}, Lky1;->s()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2a

    const/16 v2, 0x1e

    if-eqz v13, :cond_29

    if-eq v13, v2, :cond_29

    const/16 v5, 0xa

    if-eq v13, v5, :cond_29

    const/16 v5, 0x28

    if-ne v13, v5, :cond_28

    goto :goto_21

    :cond_28
    :goto_20
    const/4 v9, 0x0

    goto :goto_22

    .line 234
    :cond_29
    :goto_21
    invoke-static {v8}, Ly02;->k(Lay1;)V

    new-instance v5, Lu22;

    const/16 v9, -0xa

    .line 235
    invoke-direct {v5, v9}, Lu22;-><init>(I)V

    const/4 v9, 0x0

    .line 236
    invoke-virtual {v8, v5, v9}, Lc52;->H(Lu22;Z)V

    goto :goto_20

    :cond_2a
    const/16 v2, 0x1e

    goto :goto_20

    :goto_22
    if-eqz v9, :cond_2b

    .line 237
    invoke-static {v8}, Ly02;->k(Lay1;)V

    const/4 v5, 0x1

    .line 238
    invoke-virtual {v8, v9, v5}, Lc52;->H(Lu22;Z)V

    :goto_23
    move v5, v2

    const/4 v2, 0x2

    goto :goto_24

    :cond_2b
    move-object/from16 v9, v23

    goto :goto_23

    .line 239
    :goto_24
    invoke-static {v8}, Ly02;->k(Lay1;)V

    iget-object v11, v8, Let;->j:Ljava/lang/Object;

    check-cast v11, Ly02;

    .line 240
    invoke-virtual {v8, v9}, Lc52;->L(Lu22;)V

    .line 241
    invoke-virtual {v10}, Let;->l()V

    .line 242
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v13, "dma_consent_settings"

    const/4 v14, 0x0

    invoke-interface {v9, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 243
    invoke-static {v9}, Lnu1;->b(Ljava/lang/String;)Lnu1;

    move-result-object v9

    .line 244
    iget v9, v9, Lnu1;->a:I

    .line 245
    const-string v13, "google_analytics_default_allow_ad_personalization_signals"

    const/4 v14, 0x1

    .line 246
    invoke-virtual {v12, v13, v14}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    move-result-object v13

    if-eq v13, v1, :cond_2c

    .line 247
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 248
    const-string v2, "Default ad personalization consent from Manifest"

    .line 249
    invoke-virtual {v3, v13, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2c
    const-string v2, "google_analytics_default_allow_ad_user_data"

    .line 250
    invoke-virtual {v12, v2, v14}, Lmt1;->B(Ljava/lang/String;Z)Lq22;

    move-result-object v2

    if-eq v2, v1, :cond_2d

    const/16 v1, -0xa

    invoke-static {v1, v9}, Lu22;->l(II)Z

    move-result v13

    if-eqz v13, :cond_2d

    .line 251
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 252
    new-instance v5, Ljava/util/EnumMap;

    invoke-direct {v5, v4}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 253
    sget-object v4, Lt22;->m:Lt22;

    invoke-virtual {v5, v4, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lnu1;

    const/4 v4, 0x0

    .line 254
    invoke-direct {v2, v5, v1, v4, v4}, Lnu1;-><init>(Ljava/util/EnumMap;ILjava/lang/Boolean;Ljava/lang/String;)V

    .line 255
    invoke-virtual {v8, v2, v14}, Lc52;->G(Lnu1;Z)V

    goto :goto_25

    .line 256
    :cond_2d
    invoke-virtual/range {v28 .. v28}, Ly02;->p()Lky1;

    move-result-object v1

    invoke-virtual {v1}, Lky1;->s()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2f

    if-eqz v9, :cond_2e

    if-ne v9, v5, :cond_2f

    .line 257
    :cond_2e
    invoke-static {v8}, Ly02;->k(Lay1;)V

    new-instance v1, Lnu1;

    const/4 v4, 0x0

    const/16 v5, -0xa

    .line 258
    invoke-direct {v1, v4, v5, v4, v4}, Lnu1;-><init>(Ljava/lang/Boolean;ILjava/lang/Boolean;Ljava/lang/String;)V

    const/4 v5, 0x1

    .line 259
    invoke-virtual {v8, v1, v5}, Lc52;->G(Lnu1;Z)V

    .line 260
    :cond_2f
    :goto_25
    const-string v1, "google_analytics_tcf_data_enabled"

    .line 261
    invoke-virtual {v12, v1}, Lmt1;->y(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_30

    .line 262
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 263
    :cond_30
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 264
    const-string v1, "TCF client enabled."

    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 265
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 266
    invoke-virtual {v8}, Lgx1;->l()V

    .line 267
    iget-object v0, v11, Ly02;->o:Lzy1;

    .line 268
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 269
    iget-object v0, v0, Lzy1;->v:Lso;

    .line 270
    const-string v1, "Register tcfPrefChangeListener."

    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    iget-object v0, v8, Lc52;->C:Lv42;

    if-nez v0, :cond_31

    new-instance v0, Lc32;

    const/4 v2, 0x2

    .line 271
    invoke-direct {v0, v8, v11, v2}, Lc32;-><init>(Lc52;Lo22;I)V

    iput-object v0, v8, Lc52;->D:Lc32;

    new-instance v0, Lv42;

    invoke-direct {v0, v8}, Lv42;-><init>(Lc52;)V

    iput-object v0, v8, Lc52;->C:Lv42;

    .line 272
    :cond_31
    iget-object v0, v11, Ly02;->n:Lvz1;

    invoke-static {v0}, Ly02;->j(Let;)V

    .line 273
    invoke-virtual {v0}, Lvz1;->q()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, v8, Lc52;->C:Lv42;

    .line 274
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 275
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 276
    invoke-virtual {v8}, Lc52;->r()V

    .line 277
    :cond_32
    iget-object v0, v10, Lvz1;->o:Lrz1;

    invoke-virtual {v0}, Lrz1;->a()J

    move-result-wide v1

    const-wide/16 v16, 0x0

    cmp-long v1, v1, v16

    if-nez v1, :cond_33

    .line 278
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 279
    const-string v1, "Persisting first open"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, v2, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    invoke-virtual {v0, v6, v7}, Lrz1;->b(J)V

    .line 281
    :cond_33
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 282
    iget-object v1, v8, Lc52;->z:Lvd2;

    .line 283
    invoke-virtual {v1}, Lvd2;->c()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 284
    invoke-virtual {v1}, Lvd2;->b()Z

    move-result v2

    if-eqz v2, :cond_34

    iget-object v1, v1, Lvd2;->a:Ljava/lang/Object;

    check-cast v1, Ly02;

    .line 285
    iget-object v1, v1, Ly02;->n:Lvz1;

    .line 286
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 287
    iget-object v1, v1, Lvz1;->F:Lvx;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lvx;->f(Ljava/lang/String;)V

    .line 288
    :cond_34
    invoke-virtual/range {v28 .. v28}, Ly02;->h()Z

    move-result v1

    if-nez v1, :cond_3a

    .line 289
    invoke-virtual/range {v28 .. v28}, Ly02;->e()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 290
    const-string v0, "android.permission.INTERNET"

    move-object/from16 v1, v30

    .line 291
    invoke-virtual {v1, v0}, Lcb2;->O(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    .line 292
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 293
    const-string v0, "App is missing INTERNET permission"

    move-object/from16 v2, v29

    invoke-virtual {v2, v0}, Lso;->b(Ljava/lang/String;)V

    goto :goto_26

    :cond_35
    move-object/from16 v2, v29

    .line 294
    :goto_26
    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    .line 295
    invoke-virtual {v1, v0}, Lcb2;->O(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_36

    .line 296
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 297
    const-string v0, "App is missing ACCESS_NETWORK_STATE permission"

    invoke-virtual {v2, v0}, Lso;->b(Ljava/lang/String;)V

    :cond_36
    move-object/from16 v4, v28

    iget-object v0, v4, Ly02;->j:Landroid/content/Context;

    .line 298
    invoke-static {v0}, Lal1;->a(Landroid/content/Context;)Lb00;

    move-result-object v5

    invoke-virtual {v5}, Lb00;->c()Z

    move-result v5

    if-nez v5, :cond_38

    .line 299
    invoke-virtual {v12}, Lmt1;->o()Z

    move-result v5

    if-nez v5, :cond_38

    .line 300
    invoke-static {v0}, Lcb2;->g0(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_37

    .line 301
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 302
    const-string v5, "AppMeasurementReceiver not registered/enabled"

    invoke-virtual {v2, v5}, Lso;->b(Ljava/lang/String;)V

    .line 303
    :cond_37
    invoke-static {v0}, Lcb2;->G(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 304
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 305
    const-string v0, "AppMeasurementService not registered/enabled"

    invoke-virtual {v2, v0}, Lso;->b(Ljava/lang/String;)V

    .line 306
    :cond_38
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 307
    const-string v0, "Uploading is not possible. App measurement disabled"

    invoke-virtual {v2, v0}, Lso;->b(Ljava/lang/String;)V

    :goto_27
    move-object/from16 v2, v21

    goto/16 :goto_2d

    :cond_39
    move-object/from16 v4, v28

    move-object/from16 v1, v30

    goto :goto_27

    :cond_3a
    move-object/from16 v4, v28

    move-object/from16 v1, v30

    .line 308
    invoke-virtual {v4}, Ly02;->p()Lky1;

    move-result-object v2

    invoke-virtual {v2}, Lky1;->s()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3e

    .line 309
    invoke-virtual {v4}, Ly02;->p()Lky1;

    move-result-object v2

    invoke-virtual {v2}, Lky1;->s()Ljava/lang/String;

    move-result-object v2

    .line 310
    invoke-virtual {v10}, Let;->l()V

    .line 311
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v9, "gmp_app_id"

    const/4 v14, 0x0

    invoke-interface {v5, v9, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 312
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    .line 313
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v13, :cond_3d

    if-nez v14, :cond_3d

    .line 314
    invoke-static {v2}, Lbh;->h(Ljava/lang/Object;)V

    .line 315
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3d

    .line 316
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    .line 317
    const-string v2, "Rechecking which service to use due to a GMP App Id change"

    move-object/from16 v5, v22

    invoke-virtual {v5, v2}, Lso;->b(Ljava/lang/String;)V

    .line 318
    invoke-virtual {v10}, Let;->l()V

    .line 319
    invoke-virtual {v10}, Let;->l()V

    .line 320
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v5, "measurement_enabled"

    invoke-interface {v2, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 321
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v14, 0x1

    invoke-interface {v2, v5, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_28

    :cond_3b
    const/4 v2, 0x0

    .line 322
    :goto_28
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    .line 323
    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 324
    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz v2, :cond_3c

    .line 325
    invoke-virtual {v10}, Let;->l()V

    .line 326
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    .line 327
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v13, v5, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 328
    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 329
    :cond_3c
    invoke-virtual {v4}, Ly02;->m()Lpy1;

    move-result-object v2

    invoke-virtual {v2}, Lpy1;->p()V

    iget-object v2, v4, Ly02;->A:Li82;

    .line 330
    invoke-virtual {v2}, Li82;->t()V

    iget-object v2, v4, Ly02;->A:Li82;

    .line 331
    invoke-virtual {v2}, Li82;->r()V

    .line 332
    invoke-virtual {v0, v6, v7}, Lrz1;->b(J)V

    move-object/from16 v0, v26

    const/4 v14, 0x0

    .line 333
    invoke-virtual {v0, v14}, Lvx;->f(Ljava/lang/String;)V

    goto :goto_29

    :cond_3d
    move-object/from16 v0, v26

    .line 334
    :goto_29
    invoke-virtual {v4}, Ly02;->p()Lky1;

    move-result-object v2

    invoke-virtual {v2}, Lky1;->s()Ljava/lang/String;

    move-result-object v2

    .line 335
    invoke-virtual {v10}, Let;->l()V

    .line 336
    invoke-virtual {v10}, Lvz1;->p()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 337
    invoke-interface {v5, v9, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 338
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_2a

    :cond_3e
    move-object/from16 v0, v26

    .line 339
    :goto_2a
    invoke-virtual {v10}, Lvz1;->s()Lu22;

    move-result-object v2

    .line 340
    invoke-virtual {v2, v15}, Lu22;->i(Lt22;)Z

    move-result v2

    if-nez v2, :cond_3f

    const/4 v14, 0x0

    .line 341
    invoke-virtual {v0, v14}, Lvx;->f(Ljava/lang/String;)V

    .line 342
    :cond_3f
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 343
    invoke-virtual {v0}, Lvx;->e()Ljava/lang/String;

    move-result-object v0

    .line 344
    iget-object v2, v8, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    move-object/from16 v2, v25

    .line 345
    :try_start_6
    iget-object v0, v2, Ly02;->j:Landroid/content/Context;

    .line 346
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-string v2, "com.google.firebase.remoteconfig.FirebaseRemoteConfig"

    .line 347
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_6} :catch_6

    :cond_40
    move-object/from16 v2, v21

    goto :goto_2b

    .line 348
    :catch_6
    iget-object v0, v10, Lvz1;->E:Lvx;

    invoke-virtual {v0}, Lvx;->e()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_40

    .line 349
    invoke-static/range {v21 .. v21}, Ly02;->l(Lm22;)V

    move-object/from16 v2, v21

    .line 350
    iget-object v5, v2, Lzy1;->r:Lso;

    .line 351
    const-string v6, "Remote config removed with active feature rollouts"

    invoke-virtual {v5, v6}, Lso;->b(Ljava/lang/String;)V

    const/4 v14, 0x0

    .line 352
    invoke-virtual {v0, v14}, Lvx;->f(Ljava/lang/String;)V

    .line 353
    :goto_2b
    invoke-virtual {v4}, Ly02;->p()Lky1;

    move-result-object v0

    invoke-virtual {v0}, Lky1;->s()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 354
    invoke-virtual {v4}, Ly02;->e()Z

    move-result v0

    .line 355
    iget-object v5, v10, Lvz1;->l:Landroid/content/SharedPreferences;

    if-nez v5, :cond_41

    const/4 v15, 0x0

    goto :goto_2c

    :cond_41
    const-string v6, "deferred_analytics_collection"

    invoke-interface {v5, v6}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v15

    :goto_2c
    if-nez v15, :cond_42

    .line 356
    invoke-virtual {v12}, Lmt1;->z()Z

    move-result v5

    if-nez v5, :cond_42

    xor-int/lit8 v5, v0, 0x1

    .line 357
    invoke-virtual {v10, v5}, Lvz1;->t(Z)V

    :cond_42
    if-eqz v0, :cond_43

    .line 358
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 359
    invoke-virtual {v8}, Lc52;->x()V

    :cond_43
    iget-object v0, v4, Ly02;->q:Lh92;

    .line 360
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 361
    iget-object v0, v0, Lh92;->n:Lny0;

    invoke-virtual {v0}, Lny0;->v()V

    .line 362
    invoke-virtual {v4}, Ly02;->n()Li82;

    move-result-object v0

    new-instance v5, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v5}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    invoke-virtual {v0, v5}, Li82;->p(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 363
    invoke-virtual {v4}, Ly02;->n()Li82;

    move-result-object v0

    .line 364
    iget-object v5, v10, Lvz1;->H:Ler0;

    invoke-virtual {v5}, Ler0;->t()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v0, v5}, Li82;->q(Landroid/os/Bundle;)V

    .line 365
    :cond_44
    :goto_2d
    invoke-static {}, Lqs1;->a()V

    sget-object v0, Lxx1;->P0:Lwx1;

    const/4 v14, 0x0

    .line 366
    invoke-virtual {v12, v14, v0}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 367
    invoke-virtual {v1}, Let;->l()V

    .line 368
    invoke-virtual {v1}, Lcb2;->I()J

    move-result-wide v0

    cmp-long v0, v0, v19

    if-nez v0, :cond_47

    .line 369
    sget-object v0, Lxx1;->w0:Lwx1;

    .line 370
    invoke-virtual {v0, v14}, Lwx1;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 371
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    const/16 v6, 0x1388

    .line 372
    invoke-virtual {v5, v6}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    const-wide/16 v6, 0x3e8

    mul-long/2addr v0, v6

    int-to-long v5, v5

    iget-object v4, v4, Ly02;->t:Lmz;

    add-long/2addr v0, v5

    .line 373
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x1f4

    .line 375
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    cmp-long v4, v0, v4

    if-lez v4, :cond_45

    .line 376
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 377
    const-string v2, "Waiting to fetch trigger URIs until some time after boot. Delay in millis"

    .line 378
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 379
    invoke-virtual {v3, v4, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 380
    :cond_45
    invoke-static {v8}, Ly02;->k(Lay1;)V

    .line 381
    invoke-virtual {v8}, Lgx1;->l()V

    iget-object v2, v8, Lc52;->u:Lc32;

    if-nez v2, :cond_46

    new-instance v2, Lc32;

    const/4 v15, 0x0

    .line 382
    invoke-direct {v2, v8, v11, v15}, Lc32;-><init>(Lc52;Lo22;I)V

    iput-object v2, v8, Lc52;->u:Lc32;

    .line 383
    :cond_46
    invoke-virtual {v2, v0, v1}, Lfu1;->b(J)V

    .line 384
    :cond_47
    iget-object v0, v10, Lvz1;->x:Loz1;

    const/4 v15, 0x1

    invoke-virtual {v0, v15}, Loz1;->b(Z)V

    return-void

    .line 385
    :cond_48
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    return-void

    :cond_49
    move-object/from16 v24, v5

    .line 386
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    return-void

    :cond_4a
    move-object/from16 v24, v5

    .line 387
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    return-void

    :cond_4b
    move-object/from16 v24, v5

    .line 388
    invoke-static/range {v24 .. v24}, Lz0;->g(Ljava/lang/String;)V

    return-void
.end method
