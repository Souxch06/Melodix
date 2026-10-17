.class public Lcom/google/firebase/perf/session/gauges/GaugeManager;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final APPROX_NUMBER_OF_DATA_POINTS_PER_GAUGE_METRIC:J = 0x14L

.field private static final INVALID_GAUGE_COLLECTION_FREQUENCY:J = -0x1L

.field private static final TIME_TO_WAIT_BEFORE_FLUSHING_GAUGES_QUEUE_MS:J = 0x14L

.field private static final instance:Lcom/google/firebase/perf/session/gauges/GaugeManager;

.field private static final logger:Lg5;


# instance fields
.field private applicationProcessState:Lx9;

.field private final configResolver:Lkn;

.field private final cpuGaugeCollector:Llh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Llh0;"
        }
    .end annotation
.end field

.field private gaugeManagerDataCollectionJob:Ljava/util/concurrent/ScheduledFuture;

.field private final gaugeManagerExecutor:Llh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Llh0;"
        }
    .end annotation
.end field

.field private gaugeMetadataManager:Ly90;

.field private final memoryGaugeCollector:Llh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Llh0;"
        }
    .end annotation
.end field

.field private sessionId:Ljava/lang/String;

.field private final transportManager:Lvd1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lg5;->c()Lg5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->logger:Lg5;

    .line 6
    .line 7
    new-instance v0, Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->instance:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 13
    .line 14
    return-void
.end method

.method private constructor <init>()V
    .locals 7

    .line 1
    new-instance v1, Llh0;

    .line 2
    .line 3
    new-instance v0, Llm;

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    invoke-direct {v0, v2}, Llm;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {v1, v0}, Llh0;-><init>(Llw0;)V

    .line 10
    .line 11
    .line 12
    sget-object v2, Lvd1;->B:Lvd1;

    .line 13
    .line 14
    invoke-static {}, Lkn;->e()Lkn;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    new-instance v5, Llh0;

    .line 19
    .line 20
    new-instance v0, Llm;

    .line 21
    .line 22
    const/4 v4, 0x6

    .line 23
    invoke-direct {v0, v4}, Llm;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v5, v0}, Llh0;-><init>(Llw0;)V

    .line 27
    .line 28
    .line 29
    new-instance v6, Llh0;

    .line 30
    .line 31
    new-instance v0, Llm;

    .line 32
    .line 33
    const/4 v4, 0x7

    .line 34
    invoke-direct {v0, v4}, Llm;-><init>(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {v6, v0}, Llh0;-><init>(Llw0;)V

    .line 38
    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    move-object v0, p0

    .line 42
    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/perf/session/gauges/GaugeManager;-><init>(Llh0;Lvd1;Lkn;Ly90;Llh0;Llh0;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Llh0;Lvd1;Lkn;Ly90;Llh0;Llh0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Llh0;",
            "Lvd1;",
            "Lkn;",
            "Ly90;",
            "Llh0;",
            "Llh0;",
            ")V"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerDataCollectionJob:Ljava/util/concurrent/ScheduledFuture;

    .line 48
    iput-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->sessionId:Ljava/lang/String;

    .line 49
    sget-object v0, Lx9;->k:Lx9;

    iput-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->applicationProcessState:Lx9;

    .line 50
    iput-object p1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerExecutor:Llh0;

    .line 51
    iput-object p2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->transportManager:Lvd1;

    .line 52
    iput-object p3, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->configResolver:Lkn;

    .line 53
    iput-object p4, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 54
    iput-object p5, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    .line 55
    iput-object p6, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    return-void
.end method

.method public static synthetic a(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->lambda$startCollectingGauges$2(Ljava/lang/String;Lx9;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()Lnm0;
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->lambda$new$1()Lnm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic c()Lhr;
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->lambda$new$0()Lhr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static collectGaugeMetricOnce(Lhr;Lnm0;Loc1;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    :try_start_0
    iget-object v3, p0, Lhr;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    new-instance v4, Lgr;

    .line 8
    .line 9
    invoke-direct {v4, p0, p2, v0}, Lgr;-><init>(Lhr;Loc1;I)V

    .line 10
    .line 11
    .line 12
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-interface {v3, v4, v1, v2, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_3

    .line 20
    :catch_0
    move-exception v3

    .line 21
    :try_start_1
    sget-object v4, Lhr;->g:Lg5;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    :goto_0
    monitor-exit p0

    .line 30
    monitor-enter p1

    .line 31
    :try_start_2
    iget-object p0, p1, Lnm0;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 32
    .line 33
    new-instance v3, Lmm0;

    .line 34
    .line 35
    invoke-direct {v3, p1, p2, v0}, Lmm0;-><init>(Lnm0;Loc1;I)V

    .line 36
    .line 37
    .line 38
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    invoke-interface {p0, v3, v1, v2, p2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catchall_1
    move-exception p0

    .line 45
    goto :goto_2

    .line 46
    :catch_1
    move-exception p0

    .line 47
    :try_start_3
    sget-object p2, Lnm0;->f:Lg5;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 53
    .line 54
    .line 55
    :goto_1
    monitor-exit p1

    .line 56
    return-void

    .line 57
    :goto_2
    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 58
    throw p0

    .line 59
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 60
    throw p1
.end method

.method public static synthetic d(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->lambda$stopCollectingGauges$3(Ljava/lang/String;Lx9;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getCpuGaugeCollectionFrequencyMs(Lx9;)J
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    const-wide/16 v3, -0x1

    .line 9
    .line 10
    if-eq p1, v0, :cond_5

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    move-wide p0, v3

    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->configResolver:Lkn;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const-class p1, Lco;

    .line 24
    .line 25
    monitor-enter p1

    .line 26
    :try_start_0
    sget-object v0, Lco;->d:Lco;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Lco;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lco;->d:Lco;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_1
    :goto_0
    monitor-exit p1

    .line 42
    invoke-virtual {p0, v0}, Lkn;->i(Lbe2;)Lgs0;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_2

    .line 67
    .line 68
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Ljava/lang/Long;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide p0

    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 81
    .line 82
    const-string v5, "fpr_session_gauge_cpu_capture_frequency_bg_ms"

    .line 83
    .line 84
    invoke-virtual {p1, v5}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_3

    .line 93
    .line 94
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    check-cast v5, Ljava/lang/Long;

    .line 99
    .line 100
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v5

    .line 104
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    iget-object p0, p0, Lkn;->c:Lgx;

    .line 111
    .line 112
    const-string v0, "com.google.firebase.perf.SessionsCpuCaptureFrequencyBackgroundMs"

    .line 113
    .line 114
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ljava/lang/Long;

    .line 119
    .line 120
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    invoke-virtual {p0, v0, v5, v6}, Lgx;->e(Ljava/lang/String;J)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Ljava/lang/Long;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 134
    .line 135
    .line 136
    move-result-wide p0

    .line 137
    goto/16 :goto_3

    .line 138
    .line 139
    :cond_3
    invoke-virtual {p0, v0}, Lkn;->c(Lbe2;)Lgs0;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lgs0;->b()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    invoke-virtual {p0}, Lgs0;->a()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Ljava/lang/Long;

    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 156
    .line 157
    .line 158
    move-result-wide v5

    .line 159
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_4

    .line 164
    .line 165
    invoke-virtual {p0}, Lgs0;->a()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    check-cast p0, Ljava/lang/Long;

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 172
    .line 173
    .line 174
    move-result-wide p0

    .line 175
    goto/16 :goto_3

    .line 176
    .line 177
    :cond_4
    move-wide p0, v1

    .line 178
    goto/16 :goto_3

    .line 179
    .line 180
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    throw p0

    .line 182
    :cond_5
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->configResolver:Lkn;

    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    const-class p1, Leo;

    .line 188
    .line 189
    monitor-enter p1

    .line 190
    :try_start_2
    sget-object v0, Leo;->d:Leo;

    .line 191
    .line 192
    if-nez v0, :cond_6

    .line 193
    .line 194
    new-instance v0, Leo;

    .line 195
    .line 196
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 197
    .line 198
    .line 199
    sput-object v0, Leo;->d:Leo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :catchall_1
    move-exception p0

    .line 203
    goto/16 :goto_4

    .line 204
    .line 205
    :cond_6
    :goto_2
    monitor-exit p1

    .line 206
    invoke-virtual {p0, v0}, Lkn;->i(Lbe2;)Lgs0;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 211
    .line 212
    .line 213
    move-result v5

    .line 214
    if-eqz v5, :cond_7

    .line 215
    .line 216
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Ljava/lang/Long;

    .line 221
    .line 222
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 223
    .line 224
    .line 225
    move-result-wide v5

    .line 226
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    if-eqz v5, :cond_7

    .line 231
    .line 232
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    check-cast p0, Ljava/lang/Long;

    .line 237
    .line 238
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 239
    .line 240
    .line 241
    move-result-wide p0

    .line 242
    goto :goto_3

    .line 243
    :cond_7
    iget-object p1, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 244
    .line 245
    const-string v5, "fpr_session_gauge_cpu_capture_frequency_fg_ms"

    .line 246
    .line 247
    invoke-virtual {p1, v5}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    if-eqz v5, :cond_8

    .line 256
    .line 257
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    check-cast v5, Ljava/lang/Long;

    .line 262
    .line 263
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 264
    .line 265
    .line 266
    move-result-wide v5

    .line 267
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    if-eqz v5, :cond_8

    .line 272
    .line 273
    iget-object p0, p0, Lkn;->c:Lgx;

    .line 274
    .line 275
    const-string v0, "com.google.firebase.perf.SessionsCpuCaptureFrequencyForegroundMs"

    .line 276
    .line 277
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    check-cast v5, Ljava/lang/Long;

    .line 282
    .line 283
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 284
    .line 285
    .line 286
    move-result-wide v5

    .line 287
    invoke-virtual {p0, v0, v5, v6}, Lgx;->e(Ljava/lang/String;J)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    check-cast p0, Ljava/lang/Long;

    .line 295
    .line 296
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 297
    .line 298
    .line 299
    move-result-wide p0

    .line 300
    goto :goto_3

    .line 301
    :cond_8
    invoke-virtual {p0, v0}, Lkn;->c(Lbe2;)Lgs0;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_9

    .line 310
    .line 311
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ljava/lang/Long;

    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 318
    .line 319
    .line 320
    move-result-wide v5

    .line 321
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    if-eqz v0, :cond_9

    .line 326
    .line 327
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    check-cast p0, Ljava/lang/Long;

    .line 332
    .line 333
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 334
    .line 335
    .line 336
    move-result-wide p0

    .line 337
    goto :goto_3

    .line 338
    :cond_9
    iget-object p0, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/google/firebase/perf/config/RemoteConfigManager;->isLastFetchFailed()Z

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    if-eqz p0, :cond_a

    .line 345
    .line 346
    const-wide/16 p0, 0x12c

    .line 347
    .line 348
    goto :goto_3

    .line 349
    :cond_a
    const-wide/16 p0, 0x64

    .line 350
    .line 351
    :goto_3
    sget-object v0, Lhr;->g:Lg5;

    .line 352
    .line 353
    cmp-long v0, p0, v1

    .line 354
    .line 355
    if-gtz v0, :cond_b

    .line 356
    .line 357
    return-wide v3

    .line 358
    :cond_b
    return-wide p0

    .line 359
    :goto_4
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 360
    throw p0
.end method

.method private getGaugeMetadata()Lx90;
    .locals 8

    .line 1
    invoke-static {}, Lx90;->t()Lw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 6
    .line 7
    iget-object v1, v1, Ly90;->c:Landroid/app/ActivityManager$MemoryInfo;

    .line 8
    .line 9
    iget-wide v1, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 10
    .line 11
    const/4 v3, 0x5

    .line 12
    invoke-static {v3}, Lx81;->f(I)J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    mul-long/2addr v4, v1

    .line 17
    const-wide/16 v1, 0x400

    .line 18
    .line 19
    div-long/2addr v4, v1

    .line 20
    invoke-static {v4, v5}, Lml;->A(J)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-virtual {v0}, Lea0;->i()V

    .line 25
    .line 26
    .line 27
    iget-object v5, v0, Lea0;->k:Lia0;

    .line 28
    .line 29
    check-cast v5, Lx90;

    .line 30
    .line 31
    invoke-virtual {v5, v4}, Lx90;->u(I)V

    .line 32
    .line 33
    .line 34
    iget-object v4, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 35
    .line 36
    iget-object v4, v4, Ly90;->a:Ljava/lang/Runtime;

    .line 37
    .line 38
    invoke-virtual {v4}, Ljava/lang/Runtime;->maxMemory()J

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    invoke-static {v3}, Lx81;->f(I)J

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    mul-long/2addr v6, v4

    .line 47
    div-long/2addr v6, v1

    .line 48
    invoke-static {v6, v7}, Lml;->A(J)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v0}, Lea0;->i()V

    .line 53
    .line 54
    .line 55
    iget-object v4, v0, Lea0;->k:Lia0;

    .line 56
    .line 57
    check-cast v4, Lx90;

    .line 58
    .line 59
    invoke-virtual {v4, v3}, Lx90;->v(I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 63
    .line 64
    iget-object p0, p0, Ly90;->b:Landroid/app/ActivityManager;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-long v3, p0

    .line 71
    const/4 p0, 0x3

    .line 72
    invoke-static {p0}, Lx81;->f(I)J

    .line 73
    .line 74
    .line 75
    move-result-wide v5

    .line 76
    mul-long/2addr v5, v3

    .line 77
    div-long/2addr v5, v1

    .line 78
    invoke-static {v5, v6}, Lml;->A(J)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {v0}, Lea0;->i()V

    .line 83
    .line 84
    .line 85
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 86
    .line 87
    check-cast v1, Lx90;

    .line 88
    .line 89
    invoke-virtual {v1, p0}, Lx90;->w(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Lx90;

    .line 97
    .line 98
    return-object p0
.end method

.method public static declared-synchronized getInstance()Lcom/google/firebase/perf/session/gauges/GaugeManager;
    .locals 2

    .line 1
    const-class v0, Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/google/firebase/perf/session/gauges/GaugeManager;->instance:Lcom/google/firebase/perf/session/gauges/GaugeManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v1
.end method

.method private getMemoryGaugeCollectionFrequencyMs(Lx9;)J
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    const-wide/16 v3, -0x1

    .line 9
    .line 10
    if-eq p1, v0, :cond_5

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    move-wide p0, v3

    .line 16
    goto/16 :goto_3

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->configResolver:Lkn;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const-class p1, Lgo;

    .line 24
    .line 25
    monitor-enter p1

    .line 26
    :try_start_0
    sget-object v0, Lgo;->d:Lgo;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Lgo;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lgo;->d:Lgo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_1
    :goto_0
    monitor-exit p1

    .line 42
    invoke-virtual {p0, v0}, Lkn;->i(Lbe2;)Lgs0;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Ljava/lang/Long;

    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_2

    .line 67
    .line 68
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Ljava/lang/Long;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 75
    .line 76
    .line 77
    move-result-wide p0

    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 81
    .line 82
    const-string v5, "fpr_session_gauge_memory_capture_frequency_bg_ms"

    .line 83
    .line 84
    invoke-virtual {p1, v5}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_3

    .line 93
    .line 94
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    check-cast v5, Ljava/lang/Long;

    .line 99
    .line 100
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v5

    .line 104
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    iget-object p0, p0, Lkn;->c:Lgx;

    .line 111
    .line 112
    const-string v0, "com.google.firebase.perf.SessionsMemoryCaptureFrequencyBackgroundMs"

    .line 113
    .line 114
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ljava/lang/Long;

    .line 119
    .line 120
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    invoke-virtual {p0, v0, v5, v6}, Lgx;->e(Ljava/lang/String;J)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Ljava/lang/Long;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 134
    .line 135
    .line 136
    move-result-wide p0

    .line 137
    goto/16 :goto_3

    .line 138
    .line 139
    :cond_3
    invoke-virtual {p0, v0}, Lkn;->c(Lbe2;)Lgs0;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lgs0;->b()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    invoke-virtual {p0}, Lgs0;->a()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Ljava/lang/Long;

    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 156
    .line 157
    .line 158
    move-result-wide v5

    .line 159
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_4

    .line 164
    .line 165
    invoke-virtual {p0}, Lgs0;->a()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    check-cast p0, Ljava/lang/Long;

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 172
    .line 173
    .line 174
    move-result-wide p0

    .line 175
    goto/16 :goto_3

    .line 176
    .line 177
    :cond_4
    move-wide p0, v1

    .line 178
    goto/16 :goto_3

    .line 179
    .line 180
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    throw p0

    .line 182
    :cond_5
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->configResolver:Lkn;

    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    const-class p1, Lho;

    .line 188
    .line 189
    monitor-enter p1

    .line 190
    :try_start_2
    sget-object v0, Lho;->d:Lho;

    .line 191
    .line 192
    if-nez v0, :cond_6

    .line 193
    .line 194
    new-instance v0, Lho;

    .line 195
    .line 196
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 197
    .line 198
    .line 199
    sput-object v0, Lho;->d:Lho;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :catchall_1
    move-exception p0

    .line 203
    goto/16 :goto_4

    .line 204
    .line 205
    :cond_6
    :goto_2
    monitor-exit p1

    .line 206
    invoke-virtual {p0, v0}, Lkn;->i(Lbe2;)Lgs0;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 211
    .line 212
    .line 213
    move-result v5

    .line 214
    if-eqz v5, :cond_7

    .line 215
    .line 216
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Ljava/lang/Long;

    .line 221
    .line 222
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 223
    .line 224
    .line 225
    move-result-wide v5

    .line 226
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    if-eqz v5, :cond_7

    .line 231
    .line 232
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    check-cast p0, Ljava/lang/Long;

    .line 237
    .line 238
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 239
    .line 240
    .line 241
    move-result-wide p0

    .line 242
    goto :goto_3

    .line 243
    :cond_7
    iget-object p1, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 244
    .line 245
    const-string v5, "fpr_session_gauge_memory_capture_frequency_fg_ms"

    .line 246
    .line 247
    invoke-virtual {p1, v5}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getLong(Ljava/lang/String;)Lgs0;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    if-eqz v5, :cond_8

    .line 256
    .line 257
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    check-cast v5, Ljava/lang/Long;

    .line 262
    .line 263
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 264
    .line 265
    .line 266
    move-result-wide v5

    .line 267
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    if-eqz v5, :cond_8

    .line 272
    .line 273
    iget-object p0, p0, Lkn;->c:Lgx;

    .line 274
    .line 275
    const-string v0, "com.google.firebase.perf.SessionsMemoryCaptureFrequencyForegroundMs"

    .line 276
    .line 277
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    check-cast v5, Ljava/lang/Long;

    .line 282
    .line 283
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 284
    .line 285
    .line 286
    move-result-wide v5

    .line 287
    invoke-virtual {p0, v0, v5, v6}, Lgx;->e(Ljava/lang/String;J)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    check-cast p0, Ljava/lang/Long;

    .line 295
    .line 296
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 297
    .line 298
    .line 299
    move-result-wide p0

    .line 300
    goto :goto_3

    .line 301
    :cond_8
    invoke-virtual {p0, v0}, Lkn;->c(Lbe2;)Lgs0;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1}, Lgs0;->b()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_9

    .line 310
    .line 311
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ljava/lang/Long;

    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 318
    .line 319
    .line 320
    move-result-wide v5

    .line 321
    invoke-static {v5, v6}, Lkn;->m(J)Z

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    if-eqz v0, :cond_9

    .line 326
    .line 327
    invoke-virtual {p1}, Lgs0;->a()Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    check-cast p0, Ljava/lang/Long;

    .line 332
    .line 333
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 334
    .line 335
    .line 336
    move-result-wide p0

    .line 337
    goto :goto_3

    .line 338
    :cond_9
    iget-object p0, p0, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/google/firebase/perf/config/RemoteConfigManager;->isLastFetchFailed()Z

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    if-eqz p0, :cond_a

    .line 345
    .line 346
    const-wide/16 p0, 0x12c

    .line 347
    .line 348
    goto :goto_3

    .line 349
    :cond_a
    const-wide/16 p0, 0x64

    .line 350
    .line 351
    :goto_3
    sget-object v0, Lnm0;->f:Lg5;

    .line 352
    .line 353
    cmp-long v0, p0, v1

    .line 354
    .line 355
    if-gtz v0, :cond_b

    .line 356
    .line 357
    return-wide v3

    .line 358
    :cond_b
    return-wide p0

    .line 359
    :goto_4
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 360
    throw p0
.end method

.method private static synthetic lambda$new$0()Lhr;
    .locals 1

    .line 1
    new-instance v0, Lhr;

    .line 2
    .line 3
    invoke-direct {v0}, Lhr;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static synthetic lambda$new$1()Lnm0;
    .locals 1

    .line 1
    new-instance v0, Lnm0;

    .line 2
    .line 3
    invoke-direct {v0}, Lnm0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic lambda$startCollectingGauges$2(Ljava/lang/String;Lx9;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->syncFlush(Ljava/lang/String;Lx9;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$stopCollectingGauges$3(Ljava/lang/String;Lx9;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->syncFlush(Ljava/lang/String;Lx9;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private startCollectingCpuMetrics(JLoc1;)Z
    .locals 8

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->logger:Lg5;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    return v3

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    .line 15
    .line 16
    invoke-virtual {p0}, Llh0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lhr;

    .line 21
    .line 22
    iget-wide v4, p0, Lhr;->d:J

    .line 23
    .line 24
    cmp-long v2, v4, v0

    .line 25
    .line 26
    if-eqz v2, :cond_5

    .line 27
    .line 28
    const-wide/16 v6, 0x0

    .line 29
    .line 30
    cmp-long v2, v4, v6

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    cmp-long v2, p1, v6

    .line 36
    .line 37
    if-gtz v2, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    iget-object v2, p0, Lhr;->e:Ljava/util/concurrent/ScheduledFuture;

    .line 41
    .line 42
    if-eqz v2, :cond_4

    .line 43
    .line 44
    iget-wide v4, p0, Lhr;->f:J

    .line 45
    .line 46
    cmp-long v4, v4, p1

    .line 47
    .line 48
    if-eqz v4, :cond_5

    .line 49
    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 54
    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    iput-object v2, p0, Lhr;->e:Ljava/util/concurrent/ScheduledFuture;

    .line 58
    .line 59
    iput-wide v0, p0, Lhr;->f:J

    .line 60
    .line 61
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lhr;->a(JLoc1;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_4
    invoke-virtual {p0, p1, p2, p3}, Lhr;->a(JLoc1;)V

    .line 66
    .line 67
    .line 68
    :cond_5
    :goto_1
    const/4 p0, 0x1

    .line 69
    return p0
.end method

.method private startCollectingGauges(Lx9;Loc1;)J
    .locals 7

    .line 72
    invoke-direct {p0, p1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getCpuGaugeCollectionFrequencyMs(Lx9;)J

    move-result-wide v0

    .line 73
    invoke-direct {p0, v0, v1, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->startCollectingCpuMetrics(JLoc1;)Z

    move-result v2

    const-wide/16 v3, -0x1

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, v3

    .line 74
    :goto_0
    invoke-direct {p0, p1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getMemoryGaugeCollectionFrequencyMs(Lx9;)J

    move-result-wide v5

    .line 75
    invoke-direct {p0, v5, v6, p2}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->startCollectingMemoryMetrics(JLoc1;)Z

    move-result p0

    if-eqz p0, :cond_2

    cmp-long p0, v0, v3

    if-nez p0, :cond_1

    return-wide v5

    .line 76
    :cond_1
    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    return-wide p0

    :cond_2
    return-wide v0
.end method

.method private startCollectingMemoryMetrics(JLoc1;)Z
    .locals 6

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->logger:Lg5;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    return v3

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    .line 15
    .line 16
    invoke-virtual {p0}, Llh0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lnm0;

    .line 21
    .line 22
    sget-object v2, Lnm0;->f:Lg5;

    .line 23
    .line 24
    const-wide/16 v4, 0x0

    .line 25
    .line 26
    cmp-long v2, p1, v4

    .line 27
    .line 28
    if-gtz v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v2, p0, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    iget-wide v4, p0, Lnm0;->e:J

    .line 39
    .line 40
    cmp-long v4, v4, p1

    .line 41
    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 48
    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    iput-object v2, p0, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;

    .line 52
    .line 53
    iput-wide v0, p0, Lnm0;->e:J

    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lnm0;->a(JLoc1;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    invoke-virtual {p0, p1, p2, p3}, Lnm0;->a(JLoc1;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    :goto_1
    const/4 p0, 0x1

    .line 63
    return p0
.end method

.method private syncFlush(Ljava/lang/String;Lx9;)V
    .locals 3

    .line 1
    invoke-static {}, Laa0;->z()Lz90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    .line 6
    .line 7
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lhr;

    .line 12
    .line 13
    iget-object v1, v1, Lhr;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    .line 22
    .line 23
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lhr;

    .line 28
    .line 29
    iget-object v1, v1, Lhr;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljr;

    .line 36
    .line 37
    invoke-virtual {v0}, Lea0;->i()V

    .line 38
    .line 39
    .line 40
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 41
    .line 42
    check-cast v2, Laa0;

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Laa0;->s(Ljr;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    .line 49
    .line 50
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lnm0;

    .line 55
    .line 56
    iget-object v1, v1, Lnm0;->b:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    .line 65
    .line 66
    invoke-virtual {v1}, Llh0;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lnm0;

    .line 71
    .line 72
    iget-object v1, v1, Lnm0;->b:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Li5;

    .line 79
    .line 80
    invoke-virtual {v0}, Lea0;->i()V

    .line 81
    .line 82
    .line 83
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 84
    .line 85
    check-cast v2, Laa0;

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Laa0;->r(Li5;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    invoke-virtual {v0}, Lea0;->i()V

    .line 92
    .line 93
    .line 94
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 95
    .line 96
    check-cast v1, Laa0;

    .line 97
    .line 98
    invoke-virtual {v1, p1}, Laa0;->B(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->transportManager:Lvd1;

    .line 102
    .line 103
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Laa0;

    .line 108
    .line 109
    iget-object v0, p0, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 110
    .line 111
    new-instance v1, Len;

    .line 112
    .line 113
    const/4 v2, 0x3

    .line 114
    invoke-direct {v1, p0, p1, p2, v2}, Len;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method


# virtual methods
.method public collectGaugeMetricOnce(Loc1;)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    invoke-virtual {v0}, Llh0;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhr;

    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    invoke-virtual {p0}, Llh0;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnm0;

    invoke-static {v0, p0, p1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->collectGaugeMetricOnce(Lhr;Lnm0;Loc1;)V

    return-void
.end method

.method public initializeGaugeMetadataManager(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Ly90;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ly90;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 7
    .line 8
    return-void
.end method

.method public logGaugeMetadata(Ljava/lang/String;Lx9;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeMetadataManager:Ly90;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Laa0;->z()Lz90;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lea0;->i()V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 13
    .line 14
    check-cast v1, Laa0;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Laa0;->B(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->getGaugeMetadata()Lx90;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0}, Lea0;->i()V

    .line 24
    .line 25
    .line 26
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 27
    .line 28
    check-cast v1, Laa0;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Laa0;->A(Lx90;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Laa0;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->transportManager:Lvd1;

    .line 40
    .line 41
    iget-object v0, p0, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 42
    .line 43
    new-instance v1, Len;

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    invoke-direct {v1, p0, p1, p2, v2}, Len;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public startCollectingGauges(Lct0;Lx9;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->sessionId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->stopCollectingGauges()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p1, Lct0;->k:Loc1;

    .line 9
    .line 10
    invoke-direct {p0, p2, v0}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->startCollectingGauges(Lx9;Loc1;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    const-wide/16 v2, -0x1

    .line 15
    .line 16
    cmp-long v2, v0, v2

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->logger:Lg5;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p1, p1, Lct0;->j:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->sessionId:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->applicationProcessState:Lx9;

    .line 31
    .line 32
    :try_start_0
    iget-object v2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerExecutor:Llh0;

    .line 33
    .line 34
    invoke-virtual {v2}, Llh0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    move-object v3, v2

    .line 39
    check-cast v3, Ljava/util/concurrent/ScheduledExecutorService;

    .line 40
    .line 41
    new-instance v4, Lv90;

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-direct {v4, p0, p1, p2, v2}, Lv90;-><init>(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;I)V

    .line 45
    .line 46
    .line 47
    const-wide/16 p1, 0x14

    .line 48
    .line 49
    mul-long v5, v0, p1

    .line 50
    .line 51
    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 52
    .line 53
    move-wide v7, v5

    .line 54
    invoke-interface/range {v3 .. v9}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerDataCollectionJob:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    move-object p0, v0

    .line 63
    sget-object p1, Lcom/google/firebase/perf/session/gauges/GaugeManager;->logger:Lg5;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public stopCollectingGauges()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->sessionId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->applicationProcessState:Lx9;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->cpuGaugeCollector:Llh0;

    .line 9
    .line 10
    invoke-virtual {v2}, Llh0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lhr;

    .line 15
    .line 16
    iget-object v3, v2, Lhr;->e:Ljava/util/concurrent/ScheduledFuture;

    .line 17
    .line 18
    const-wide/16 v4, -0x1

    .line 19
    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-interface {v3, v7}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 26
    .line 27
    .line 28
    iput-object v6, v2, Lhr;->e:Ljava/util/concurrent/ScheduledFuture;

    .line 29
    .line 30
    iput-wide v4, v2, Lhr;->f:J

    .line 31
    .line 32
    :goto_0
    iget-object v2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->memoryGaugeCollector:Llh0;

    .line 33
    .line 34
    invoke-virtual {v2}, Llh0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lnm0;

    .line 39
    .line 40
    iget-object v3, v2, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;

    .line 41
    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    invoke-interface {v3, v7}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 46
    .line 47
    .line 48
    iput-object v6, v2, Lnm0;->d:Ljava/util/concurrent/ScheduledFuture;

    .line 49
    .line 50
    iput-wide v4, v2, Lnm0;->e:J

    .line 51
    .line 52
    :goto_1
    iget-object v2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerDataCollectionJob:Ljava/util/concurrent/ScheduledFuture;

    .line 53
    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    invoke-interface {v2, v7}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v2, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->gaugeManagerExecutor:Llh0;

    .line 60
    .line 61
    invoke-virtual {v2}, Llh0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 66
    .line 67
    new-instance v3, Lv90;

    .line 68
    .line 69
    invoke-direct {v3, p0, v0, v1, v7}, Lv90;-><init>(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;I)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v0, 0x14

    .line 73
    .line 74
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 75
    .line 76
    invoke-interface {v2, v3, v0, v1, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 77
    .line 78
    .line 79
    iput-object v6, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->sessionId:Ljava/lang/String;

    .line 80
    .line 81
    sget-object v0, Lx9;->k:Lx9;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/google/firebase/perf/session/gauges/GaugeManager;->applicationProcessState:Lx9;

    .line 84
    .line 85
    return-void
.end method
