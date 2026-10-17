.class public Lcom/google/firebase/perf/FirebasePerfRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final EARLY_LIBRARY_NAME:Ljava/lang/String; = "fire-perf-early"

.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-perf"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Li7;)Lq40;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/perf/FirebasePerfRegistrar;->providesFirebasePerformance(Lgm;)Lq40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lsw0;Li7;)Ll40;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/firebase/perf/FirebasePerfRegistrar;->lambda$getComponents$0(Lsw0;Lgm;)Ll40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static lambda$getComponents$0(Lsw0;Lgm;)Ll40;
    .locals 14

    .line 1
    new-instance v0, Ll40;

    .line 2
    .line 3
    const-class v1, Lu30;

    .line 4
    .line 5
    invoke-interface {p1, v1}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lu30;

    .line 10
    .line 11
    const-class v2, Lkf;

    .line 12
    .line 13
    invoke-interface {p1, v2}, Lgm;->d(Ljava/lang/Class;)Llw0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Llw0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lkf;

    .line 22
    .line 23
    invoke-interface {p1, p0}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Lu30;->a()V

    .line 33
    .line 34
    .line 35
    iget-object p1, v1, Lu30;->a:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {}, Lkn;->e()Lkn;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    sget-object v3, Lkn;->d:Lg5;

    .line 45
    .line 46
    invoke-static {p1}, Lml;->s(Landroid/content/Context;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    iput-boolean v4, v3, Lg5;->a:Z

    .line 51
    .line 52
    iget-object v1, v1, Lkn;->c:Lgx;

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Lgx;->c(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lr9;->a()Lr9;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    monitor-enter v1

    .line 62
    :try_start_0
    iget-boolean v3, v1, Lr9;->x:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    const/4 v4, 0x1

    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    monitor-exit v1

    .line 68
    goto :goto_1

    .line 69
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    instance-of v5, v3, Landroid/app/Application;

    .line 74
    .line 75
    if-eqz v5, :cond_1

    .line 76
    .line 77
    check-cast v3, Landroid/app/Application;

    .line 78
    .line 79
    invoke-virtual {v3, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 80
    .line 81
    .line 82
    iput-boolean v4, v1, Lr9;->x:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catchall_0
    move-exception v0

    .line 86
    move-object p0, v0

    .line 87
    goto/16 :goto_c

    .line 88
    .line 89
    :cond_1
    :goto_0
    monitor-exit v1

    .line 90
    :goto_1
    new-instance v3, Lr40;

    .line 91
    .line 92
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v5, v1, Lr9;->p:Ljava/util/HashSet;

    .line 96
    .line 97
    monitor-enter v5

    .line 98
    :try_start_2
    iget-object v1, v1, Lr9;->p:Ljava/util/HashSet;

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 104
    if-eqz v2, :cond_9

    .line 105
    .line 106
    sget-object v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 107
    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    sget-object v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_2
    sget-object v1, Lvd1;->B:Lvd1;

    .line 114
    .line 115
    new-instance v2, Lmz;

    .line 116
    .line 117
    const/16 v3, 0xb

    .line 118
    .line 119
    invoke-direct {v2, v3}, Lmz;-><init>(I)V

    .line 120
    .line 121
    .line 122
    sget-object v3, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 123
    .line 124
    if-nez v3, :cond_4

    .line 125
    .line 126
    const-class v3, Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 127
    .line 128
    monitor-enter v3

    .line 129
    :try_start_3
    sget-object v5, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 130
    .line 131
    if-nez v5, :cond_3

    .line 132
    .line 133
    new-instance v5, Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 134
    .line 135
    invoke-static {}, Lkn;->e()Lkn;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 140
    .line 141
    sget-wide v8, Lcom/google/firebase/perf/metrics/AppStartTrace;->G:J

    .line 142
    .line 143
    const-wide/16 v10, 0xa

    .line 144
    .line 145
    add-long/2addr v10, v8

    .line 146
    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 147
    .line 148
    new-instance v13, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 149
    .line 150
    invoke-direct {v13}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 151
    .line 152
    .line 153
    const/4 v8, 0x0

    .line 154
    const/4 v9, 0x1

    .line 155
    invoke-direct/range {v7 .. v13}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 156
    .line 157
    .line 158
    invoke-direct {v5, v1, v2, v6, v7}, Lcom/google/firebase/perf/metrics/AppStartTrace;-><init>(Lvd1;Lmz;Lkn;Ljava/util/concurrent/ThreadPoolExecutor;)V

    .line 159
    .line 160
    .line 161
    sput-object v5, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :catchall_1
    move-exception v0

    .line 165
    move-object p0, v0

    .line 166
    goto :goto_3

    .line 167
    :cond_3
    :goto_2
    monitor-exit v3

    .line 168
    goto :goto_4

    .line 169
    :goto_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 170
    throw p0

    .line 171
    :cond_4
    :goto_4
    sget-object v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->I:Lcom/google/firebase/perf/metrics/AppStartTrace;

    .line 172
    .line 173
    :goto_5
    monitor-enter v1

    .line 174
    :try_start_4
    iget-boolean v2, v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->j:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 175
    .line 176
    if-eqz v2, :cond_5

    .line 177
    .line 178
    monitor-exit v1

    .line 179
    goto :goto_9

    .line 180
    :cond_5
    :try_start_5
    sget-object v2, Lmv0;->r:Lmv0;

    .line 181
    .line 182
    iget-object v2, v2, Lmv0;->o:Landroidx/lifecycle/a;

    .line 183
    .line 184
    invoke-virtual {v2, v1}, Landroidx/lifecycle/a;->a(Lbi0;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    instance-of v2, p1, Landroid/app/Application;

    .line 192
    .line 193
    if-eqz v2, :cond_8

    .line 194
    .line 195
    move-object v2, p1

    .line 196
    check-cast v2, Landroid/app/Application;

    .line 197
    .line 198
    invoke-virtual {v2, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 199
    .line 200
    .line 201
    iget-boolean v2, v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 202
    .line 203
    if-nez v2, :cond_7

    .line 204
    .line 205
    move-object v2, p1

    .line 206
    check-cast v2, Landroid/app/Application;

    .line 207
    .line 208
    invoke-static {v2}, Lcom/google/firebase/perf/metrics/AppStartTrace;->e(Landroid/app/Application;)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-eqz v2, :cond_6

    .line 213
    .line 214
    goto :goto_6

    .line 215
    :cond_6
    const/4 v2, 0x0

    .line 216
    goto :goto_7

    .line 217
    :cond_7
    :goto_6
    move v2, v4

    .line 218
    :goto_7
    iput-boolean v2, v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->E:Z

    .line 219
    .line 220
    iput-boolean v4, v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->j:Z

    .line 221
    .line 222
    check-cast p1, Landroid/app/Application;

    .line 223
    .line 224
    iput-object p1, v1, Lcom/google/firebase/perf/metrics/AppStartTrace;->n:Landroid/app/Application;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 225
    .line 226
    goto :goto_8

    .line 227
    :catchall_2
    move-exception v0

    .line 228
    move-object p0, v0

    .line 229
    goto :goto_a

    .line 230
    :cond_8
    :goto_8
    monitor-exit v1

    .line 231
    :goto_9
    new-instance p1, Lp9;

    .line 232
    .line 233
    invoke-direct {p1, v1}, Lp9;-><init>(Lcom/google/firebase/perf/metrics/AppStartTrace;)V

    .line 234
    .line 235
    .line 236
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 237
    .line 238
    .line 239
    goto :goto_b

    .line 240
    :goto_a
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 241
    throw p0

    .line 242
    :cond_9
    :goto_b
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-virtual {p0}, Lcom/google/firebase/perf/session/SessionManager;->initializeGaugeCollection()V

    .line 247
    .line 248
    .line 249
    return-object v0

    .line 250
    :catchall_3
    move-exception v0

    .line 251
    move-object p0, v0

    .line 252
    :try_start_7
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 253
    throw p0

    .line 254
    :goto_c
    :try_start_8
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 255
    throw p0
.end method

.method private static providesFirebasePerformance(Lgm;)Lq40;
    .locals 10

    .line 1
    const-class v0, Ll40;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ler0;

    .line 7
    .line 8
    const-class v0, Lu30;

    .line 9
    .line 10
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    move-object v2, v0

    .line 15
    check-cast v2, Lu30;

    .line 16
    .line 17
    const-class v0, Lh40;

    .line 18
    .line 19
    invoke-interface {p0, v0}, Lgm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v3, v0

    .line 24
    check-cast v3, Lh40;

    .line 25
    .line 26
    const-class v0, Lyz0;

    .line 27
    .line 28
    invoke-interface {p0, v0}, Lgm;->d(Ljava/lang/Class;)Llw0;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const-class v0, Lqd1;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Lgm;->d(Ljava/lang/Class;)Llw0;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    const/4 v6, 0x6

    .line 39
    invoke-direct/range {v1 .. v6}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ls40;

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-direct {v3, v1, p0}, Ls40;-><init>(Ler0;I)V

    .line 46
    .line 47
    .line 48
    new-instance v4, Ls40;

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-direct {v4, v1, v0}, Ls40;-><init>(Ler0;I)V

    .line 52
    .line 53
    .line 54
    new-instance v5, Lt40;

    .line 55
    .line 56
    invoke-direct {v5, v1, p0}, Lt40;-><init>(Ler0;I)V

    .line 57
    .line 58
    .line 59
    new-instance v6, Lt40;

    .line 60
    .line 61
    invoke-direct {v6, v1, v0}, Lt40;-><init>(Ler0;I)V

    .line 62
    .line 63
    .line 64
    new-instance v7, Lok0;

    .line 65
    .line 66
    invoke-direct {v7, v1}, Lok0;-><init>(Ler0;)V

    .line 67
    .line 68
    .line 69
    new-instance v8, Ltb0;

    .line 70
    .line 71
    invoke-direct {v8, v1}, Ltb0;-><init>(Ler0;)V

    .line 72
    .line 73
    .line 74
    new-instance v9, Lt11;

    .line 75
    .line 76
    invoke-direct {v9, v1}, Lt11;-><init>(Ler0;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Lnm;

    .line 80
    .line 81
    invoke-direct/range {v2 .. v9}, Lnm;-><init>(Ls40;Ls40;Lt40;Lt40;Lok0;Ltb0;Lt11;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Lky;

    .line 85
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    .line 88
    .line 89
    sget-object v0, Lky;->l:Ljava/lang/Object;

    .line 90
    .line 91
    iput-object v0, p0, Lky;->k:Ljava/lang/Object;

    .line 92
    .line 93
    iput-object v2, p0, Lky;->j:Lnm;

    .line 94
    .line 95
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lq40;

    .line 100
    .line 101
    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwl;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lsw0;

    .line 2
    .line 3
    const-class v0, Lpe1;

    .line 4
    .line 5
    const-class v1, Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const-class v0, Lq40;

    .line 11
    .line 12
    invoke-static {v0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "fire-perf"

    .line 17
    .line 18
    iput-object v1, v0, Lvl;->a:Ljava/lang/String;

    .line 19
    .line 20
    const-class v2, Lu30;

    .line 21
    .line 22
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v3}, Lvl;->a(Lbx;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Lbx;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    const-class v5, Lyz0;

    .line 33
    .line 34
    invoke-direct {v3, v4, v4, v5}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lvl;->a(Lbx;)V

    .line 38
    .line 39
    .line 40
    const-class v3, Lh40;

    .line 41
    .line 42
    invoke-static {v3}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v0, v3}, Lvl;->a(Lbx;)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Lbx;

    .line 50
    .line 51
    const-class v5, Lqd1;

    .line 52
    .line 53
    invoke-direct {v3, v4, v4, v5}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v3}, Lvl;->a(Lbx;)V

    .line 57
    .line 58
    .line 59
    const-class v3, Ll40;

    .line 60
    .line 61
    invoke-static {v3}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {v0, v5}, Lvl;->a(Lbx;)V

    .line 66
    .line 67
    .line 68
    new-instance v5, Lo40;

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    invoke-direct {v5, v6}, Lo40;-><init>(I)V

    .line 72
    .line 73
    .line 74
    iput-object v5, v0, Lvl;->f:Ljm;

    .line 75
    .line 76
    invoke-virtual {v0}, Lvl;->b()Lwl;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v3}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string v5, "fire-perf-early"

    .line 85
    .line 86
    iput-object v5, v3, Lvl;->a:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v3, v2}, Lvl;->a(Lbx;)V

    .line 93
    .line 94
    .line 95
    new-instance v2, Lbx;

    .line 96
    .line 97
    const-class v5, Lkf;

    .line 98
    .line 99
    invoke-direct {v2, v6, v4, v5}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, v2}, Lvl;->a(Lbx;)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Lbx;

    .line 106
    .line 107
    invoke-direct {v2, p0, v4, v6}, Lbx;-><init>(Lsw0;II)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3, v2}, Lvl;->a(Lbx;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3}, Lvl;->c()V

    .line 114
    .line 115
    .line 116
    new-instance v2, Liv;

    .line 117
    .line 118
    invoke-direct {v2, p0, v4}, Liv;-><init>(Lsw0;I)V

    .line 119
    .line 120
    .line 121
    iput-object v2, v3, Lvl;->f:Ljm;

    .line 122
    .line 123
    invoke-virtual {v3}, Lvl;->b()Lwl;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string v2, "22.0.5"

    .line 128
    .line 129
    invoke-static {v1, v2}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    filled-new-array {v0, p0, v1}, [Lwl;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method
