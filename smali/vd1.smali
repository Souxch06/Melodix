.class public final Lvd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lq9;


# static fields
.field public static final A:Lg5;

.field public static final B:Lvd1;


# instance fields
.field public final j:Ljava/util/concurrent/ConcurrentHashMap;

.field public final k:Ljava/util/concurrent/ConcurrentLinkedQueue;

.field public final l:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public m:Lu30;

.field public n:Lq40;

.field public o:Lh40;

.field public p:Llw0;

.field public q:Lq50;

.field public final r:Ljava/util/concurrent/ThreadPoolExecutor;

.field public s:Landroid/content/Context;

.field public t:Lkn;

.field public u:Lnx0;

.field public v:Lr9;

.field public w:Lt9;

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Z


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
    sput-object v0, Lvd1;->A:Lg5;

    .line 6
    .line 7
    new-instance v0, Lvd1;

    .line 8
    .line 9
    invoke-direct {v0}, Lvd1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lvd1;->B:Lvd1;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lvd1;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lvd1;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    iput-boolean v1, p0, Lvd1;->z:Z

    .line 20
    .line 21
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 22
    .line 23
    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 24
    .line 25
    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v4, 0x1

    .line 30
    const-wide/16 v5, 0xa

    .line 31
    .line 32
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 38
    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lvd1;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 45
    .line 46
    const/16 p0, 0x32

    .line 47
    .line 48
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v1, "KEY_AVAILABLE_TRACES_FOR_CACHING"

    .line 53
    .line 54
    invoke-virtual {v0, v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string v1, "KEY_AVAILABLE_NETWORK_REQUESTS_FOR_CACHING"

    .line 58
    .line 59
    invoke-virtual {v0, v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    const-string v1, "KEY_AVAILABLE_GAUGES_FOR_CACHING"

    .line 63
    .line 64
    invoke-virtual {v0, v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static a(Lys0;)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-interface {p0}, Lys0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "ms)"

    .line 6
    .line 7
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const-string v4, "#.####"

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Lys0;->d()Lld1;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lld1;->A()J

    .line 21
    .line 22
    .line 23
    move-result-wide v5

    .line 24
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 25
    .line 26
    invoke-virtual {p0}, Lld1;->B()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ljava/text/DecimalFormat;

    .line 31
    .line 32
    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    long-to-double v4, v5

    .line 36
    div-double/2addr v4, v2

    .line 37
    invoke-virtual {v0, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "trace metric: "

    .line 44
    .line 45
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, " (duration: "

    .line 52
    .line 53
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_0
    invoke-interface {p0}, Lys0;->e()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    invoke-interface {p0}, Lys0;->f()Lop0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lop0;->K()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    invoke-virtual {p0}, Lop0;->B()J

    .line 84
    .line 85
    .line 86
    move-result-wide v5

    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const-wide/16 v5, 0x0

    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0}, Lop0;->G()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Lop0;->w()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const-string v0, "UNKNOWN"

    .line 106
    .line 107
    :goto_1
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 108
    .line 109
    invoke-virtual {p0}, Lop0;->D()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-instance v7, Ljava/text/DecimalFormat;

    .line 114
    .line 115
    invoke-direct {v7, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    long-to-double v4, v5

    .line 119
    div-double/2addr v4, v2

    .line 120
    invoke-virtual {v7, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    new-instance v3, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v4, "network request trace: "

    .line 127
    .line 128
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p0, " (responseCode: "

    .line 135
    .line 136
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string p0, ", responseTime: "

    .line 143
    .line 144
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-static {v3, v2, v1}, Loq;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0

    .line 152
    :cond_3
    invoke-interface {p0}, Lys0;->a()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_4

    .line 157
    .line 158
    invoke-interface {p0}, Lys0;->b()Laa0;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 163
    .line 164
    invoke-virtual {p0}, Laa0;->x()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    invoke-virtual {p0}, Laa0;->u()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-virtual {p0}, Laa0;->t()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    new-instance v2, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    const-string v3, "gauges (hasMetadata: "

    .line 179
    .line 180
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v0, ", cpuGaugeCount: "

    .line 187
    .line 188
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string v0, ", memoryGaugeCount: "

    .line 195
    .line 196
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string p0, ")"

    .line 203
    .line 204
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    return-object p0

    .line 212
    :cond_4
    const-string p0, "log"

    .line 213
    .line 214
    return-object p0
.end method


# virtual methods
.method public final b(Lxs0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lxs0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lvd1;->v:Lr9;

    .line 8
    .line 9
    const-string p1, "_fstec"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lr9;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Lxs0;->e()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lvd1;->v:Lr9;

    .line 22
    .line 23
    const-string p1, "_fsntc"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lr9;->b(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final c(Lld1;Lx9;)V
    .locals 2

    .line 1
    new-instance v0, Len;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, p0, p1, p2, v1}, Len;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final d(Lws0;Lx9;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    iget-object v0, v1, Lvd1;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v4, 0x1

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    iget-object v0, v1, Lvd1;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    const-string v5, "KEY_AVAILABLE_TRACES_FOR_CACHING"

    .line 19
    .line 20
    invoke-virtual {v0, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    check-cast v6, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    const-string v8, "KEY_AVAILABLE_NETWORK_REQUESTS_FOR_CACHING"

    .line 31
    .line 32
    invoke-virtual {v0, v8}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v9

    .line 36
    check-cast v9, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v10

    .line 42
    const-string v11, "KEY_AVAILABLE_GAUGES_FOR_CACHING"

    .line 43
    .line 44
    invoke-virtual {v0, v11}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v12

    .line 48
    check-cast v12, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v13

    .line 54
    invoke-virtual {v2}, Lws0;->c()Z

    .line 55
    .line 56
    .line 57
    move-result v14

    .line 58
    if-eqz v14, :cond_0

    .line 59
    .line 60
    if-lez v7, :cond_0

    .line 61
    .line 62
    sub-int/2addr v7, v4

    .line 63
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v0, v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {v2}, Lws0;->e()Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-eqz v5, :cond_1

    .line 76
    .line 77
    if-lez v10, :cond_1

    .line 78
    .line 79
    sub-int/2addr v10, v4

    .line 80
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v0, v8, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {v2}, Lws0;->a()Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_2

    .line 93
    .line 94
    if-lez v13, :cond_2

    .line 95
    .line 96
    sub-int/2addr v13, v4

    .line 97
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v0, v11, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    :goto_0
    sget-object v0, Lvd1;->A:Lg5;

    .line 105
    .line 106
    const-string v4, "Transport is not initialized yet, %s will be queued for to be dispatched later"

    .line 107
    .line 108
    invoke-static {v2}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-virtual {v0, v4, v5}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, v1, Lvd1;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 120
    .line 121
    new-instance v1, Lvs0;

    .line 122
    .line 123
    invoke-direct {v1, v2, v3}, Lvs0;-><init>(Lws0;Lx9;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_2
    sget-object v0, Lvd1;->A:Lg5;

    .line 131
    .line 132
    const-string v1, "%s is not allowed to cache. Cache exhausted the limit (availableTracesForCaching: %d, availableNetworkRequestsForCaching: %d, availableGaugesForCaching: %d)."

    .line 133
    .line 134
    invoke-static {v2}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    filled-new-array {v2, v6, v9, v12}, [Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v0, v1, v2}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    sget-object v5, Lvd1;->A:Lg5;

    .line 147
    .line 148
    iget-object v0, v1, Lvd1;->t:Lkn;

    .line 149
    .line 150
    invoke-virtual {v0}, Lkn;->n()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    iget-object v0, v1, Lvd1;->w:Lt9;

    .line 157
    .line 158
    iget-object v0, v0, Lea0;->k:Lia0;

    .line 159
    .line 160
    check-cast v0, Lw9;

    .line 161
    .line 162
    invoke-virtual {v0}, Lw9;->u()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    iget-boolean v0, v1, Lvd1;->z:Z

    .line 169
    .line 170
    if-nez v0, :cond_4

    .line 171
    .line 172
    goto :goto_6

    .line 173
    :cond_4
    :try_start_0
    iget-object v0, v1, Lvd1;->o:Lh40;

    .line 174
    .line 175
    check-cast v0, Lg40;

    .line 176
    .line 177
    invoke-virtual {v0}, Lg40;->c()Ljd2;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const-wide/32 v6, 0xea60

    .line 182
    .line 183
    .line 184
    invoke-static {v0, v6, v7}, Lbe2;->b(Ljd2;J)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :catch_0
    move-exception v0

    .line 192
    goto :goto_1

    .line 193
    :catch_1
    move-exception v0

    .line 194
    goto :goto_2

    .line 195
    :catch_2
    move-exception v0

    .line 196
    goto :goto_3

    .line 197
    :goto_1
    const-string v6, "Task to retrieve Installation Id is timed out: %s"

    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v5, v6, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :goto_2
    const-string v6, "Task to retrieve Installation Id is interrupted: %s"

    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v5, v6, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    goto :goto_4

    .line 225
    :goto_3
    const-string v6, "Unable to retrieve Installation Id: %s"

    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v5, v6, v0}, Lg5;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    :goto_4
    const/4 v0, 0x0

    .line 239
    :goto_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 240
    .line 241
    .line 242
    move-result v6

    .line 243
    if-nez v6, :cond_5

    .line 244
    .line 245
    iget-object v5, v1, Lvd1;->w:Lt9;

    .line 246
    .line 247
    invoke-virtual {v5}, Lea0;->i()V

    .line 248
    .line 249
    .line 250
    iget-object v5, v5, Lea0;->k:Lia0;

    .line 251
    .line 252
    check-cast v5, Lw9;

    .line 253
    .line 254
    invoke-virtual {v5, v0}, Lw9;->A(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    goto :goto_6

    .line 258
    :cond_5
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 259
    .line 260
    .line 261
    :cond_6
    :goto_6
    iget-object v0, v1, Lvd1;->w:Lt9;

    .line 262
    .line 263
    invoke-virtual {v0}, Lea0;->i()V

    .line 264
    .line 265
    .line 266
    iget-object v5, v0, Lea0;->k:Lia0;

    .line 267
    .line 268
    check-cast v5, Lw9;

    .line 269
    .line 270
    invoke-virtual {v5, v3}, Lw9;->B(Lx9;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v2}, Lws0;->c()Z

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    const/4 v5, 0x5

    .line 278
    if-nez v3, :cond_7

    .line 279
    .line 280
    invoke-virtual {v2}, Lws0;->e()Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_b

    .line 285
    .line 286
    :cond_7
    iget-object v3, v0, Lea0;->j:Lia0;

    .line 287
    .line 288
    invoke-virtual {v3, v5}, Lia0;->j(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    check-cast v3, Lea0;

    .line 293
    .line 294
    iget-object v6, v0, Lea0;->k:Lia0;

    .line 295
    .line 296
    invoke-virtual {v6}, Lia0;->m()Z

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    iget-object v7, v0, Lea0;->k:Lia0;

    .line 301
    .line 302
    if-nez v6, :cond_8

    .line 303
    .line 304
    goto :goto_7

    .line 305
    :cond_8
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    .line 307
    .line 308
    sget-object v6, Lcw0;->c:Lcw0;

    .line 309
    .line 310
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 314
    .line 315
    .line 316
    move-result-object v8

    .line 317
    invoke-virtual {v6, v8}, Lcw0;->a(Ljava/lang/Class;)Lb31;

    .line 318
    .line 319
    .line 320
    move-result-object v6

    .line 321
    invoke-interface {v6, v7}, Lb31;->b(Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v7}, Lia0;->n()V

    .line 325
    .line 326
    .line 327
    iget-object v7, v0, Lea0;->k:Lia0;

    .line 328
    .line 329
    :goto_7
    iput-object v7, v3, Lea0;->k:Lia0;

    .line 330
    .line 331
    move-object v0, v3

    .line 332
    check-cast v0, Lt9;

    .line 333
    .line 334
    iget-object v3, v1, Lvd1;->n:Lq40;

    .line 335
    .line 336
    if-nez v3, :cond_9

    .line 337
    .line 338
    iget-object v3, v1, Lvd1;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 339
    .line 340
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    if-eqz v3, :cond_9

    .line 345
    .line 346
    sget-object v3, Lq40;->b:Lg5;

    .line 347
    .line 348
    invoke-static {}, Lu30;->c()Lu30;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    const-class v6, Lq40;

    .line 353
    .line 354
    invoke-virtual {v3, v6}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    check-cast v3, Lq40;

    .line 359
    .line 360
    iput-object v3, v1, Lvd1;->n:Lq40;

    .line 361
    .line 362
    :cond_9
    iget-object v3, v1, Lvd1;->n:Lq40;

    .line 363
    .line 364
    if-eqz v3, :cond_a

    .line 365
    .line 366
    new-instance v6, Ljava/util/HashMap;

    .line 367
    .line 368
    iget-object v3, v3, Lq40;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 369
    .line 370
    invoke-direct {v6, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 371
    .line 372
    .line 373
    goto :goto_8

    .line 374
    :cond_a
    sget-object v6, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 375
    .line 376
    :goto_8
    invoke-virtual {v0}, Lea0;->i()V

    .line 377
    .line 378
    .line 379
    iget-object v3, v0, Lea0;->k:Lia0;

    .line 380
    .line 381
    check-cast v3, Lw9;

    .line 382
    .line 383
    invoke-virtual {v3}, Lw9;->x()Lml0;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    invoke-virtual {v3, v6}, Lml0;->putAll(Ljava/util/Map;)V

    .line 388
    .line 389
    .line 390
    :cond_b
    invoke-virtual {v2}, Lea0;->i()V

    .line 391
    .line 392
    .line 393
    iget-object v3, v2, Lea0;->k:Lia0;

    .line 394
    .line 395
    check-cast v3, Lxs0;

    .line 396
    .line 397
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Lw9;

    .line 402
    .line 403
    invoke-virtual {v3, v0}, Lxs0;->u(Lw9;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v2}, Lea0;->h()Lia0;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Lxs0;

    .line 411
    .line 412
    iget-object v2, v1, Lvd1;->t:Lkn;

    .line 413
    .line 414
    invoke-virtual {v2}, Lkn;->n()Z

    .line 415
    .line 416
    .line 417
    move-result v2

    .line 418
    if-nez v2, :cond_c

    .line 419
    .line 420
    sget-object v1, Lvd1;->A:Lg5;

    .line 421
    .line 422
    const-string v2, "Performance collection is not enabled, dropping %s"

    .line 423
    .line 424
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-virtual {v1, v2, v0}, Lg5;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 433
    .line 434
    .line 435
    goto/16 :goto_1e

    .line 436
    .line 437
    :cond_c
    invoke-virtual {v0}, Lxs0;->r()Lw9;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    invoke-virtual {v2}, Lw9;->u()Z

    .line 442
    .line 443
    .line 444
    move-result v2

    .line 445
    if-nez v2, :cond_d

    .line 446
    .line 447
    sget-object v1, Lvd1;->A:Lg5;

    .line 448
    .line 449
    const-string v2, "App Instance ID is null or empty, dropping %s"

    .line 450
    .line 451
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-virtual {v1, v2, v0}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 460
    .line 461
    .line 462
    goto/16 :goto_1e

    .line 463
    .line 464
    :cond_d
    iget-object v2, v1, Lvd1;->s:Landroid/content/Context;

    .line 465
    .line 466
    sget-object v3, Lzs0;->a:Ljava/util/regex/Pattern;

    .line 467
    .line 468
    new-instance v3, Ljava/util/ArrayList;

    .line 469
    .line 470
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 474
    .line 475
    .line 476
    move-result v6

    .line 477
    if-eqz v6, :cond_e

    .line 478
    .line 479
    new-instance v6, Lp40;

    .line 480
    .line 481
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 482
    .line 483
    .line 484
    move-result-object v7

    .line 485
    invoke-direct {v6, v7}, Lp40;-><init>(Lld1;)V

    .line 486
    .line 487
    .line 488
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    .line 490
    .line 491
    :cond_e
    invoke-virtual {v0}, Lxs0;->e()Z

    .line 492
    .line 493
    .line 494
    move-result v6

    .line 495
    if-eqz v6, :cond_f

    .line 496
    .line 497
    new-instance v6, Ln40;

    .line 498
    .line 499
    invoke-virtual {v0}, Lxs0;->f()Lop0;

    .line 500
    .line 501
    .line 502
    move-result-object v7

    .line 503
    invoke-direct {v6, v7, v2}, Ln40;-><init>(Lop0;Landroid/content/Context;)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    :cond_f
    invoke-virtual {v0}, Lxs0;->s()Z

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    if-eqz v2, :cond_10

    .line 514
    .line 515
    new-instance v2, Lk40;

    .line 516
    .line 517
    invoke-virtual {v0}, Lxs0;->r()Lw9;

    .line 518
    .line 519
    .line 520
    move-result-object v6

    .line 521
    invoke-direct {v2, v6}, Lk40;-><init>(Lw9;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 525
    .line 526
    .line 527
    :cond_10
    invoke-virtual {v0}, Lxs0;->a()Z

    .line 528
    .line 529
    .line 530
    move-result v2

    .line 531
    if-eqz v2, :cond_11

    .line 532
    .line 533
    new-instance v2, Lm40;

    .line 534
    .line 535
    invoke-virtual {v0}, Lxs0;->b()Laa0;

    .line 536
    .line 537
    .line 538
    move-result-object v6

    .line 539
    invoke-direct {v2, v6}, Lm40;-><init>(Laa0;)V

    .line 540
    .line 541
    .line 542
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 543
    .line 544
    .line 545
    :cond_11
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    if-eqz v2, :cond_12

    .line 550
    .line 551
    invoke-static {}, Lg5;->c()Lg5;

    .line 552
    .line 553
    .line 554
    move-result-object v1

    .line 555
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 556
    .line 557
    .line 558
    goto :goto_9

    .line 559
    :cond_12
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    const/4 v6, 0x0

    .line 564
    move v7, v6

    .line 565
    :cond_13
    if-ge v7, v2, :cond_14

    .line 566
    .line 567
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v8

    .line 571
    add-int/lit8 v7, v7, 0x1

    .line 572
    .line 573
    check-cast v8, Lzs0;

    .line 574
    .line 575
    invoke-virtual {v8}, Lzs0;->a()Z

    .line 576
    .line 577
    .line 578
    move-result v8

    .line 579
    if-nez v8, :cond_13

    .line 580
    .line 581
    :goto_9
    sget-object v1, Lvd1;->A:Lg5;

    .line 582
    .line 583
    const-string v2, "Unable to process the PerfMetric (%s) due to missing or invalid values. See earlier log statements for additional information on the specific missing/invalid values."

    .line 584
    .line 585
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object v0

    .line 593
    invoke-virtual {v1, v2, v0}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 594
    .line 595
    .line 596
    goto/16 :goto_1e

    .line 597
    .line 598
    :cond_14
    iget-object v2, v1, Lvd1;->u:Lnx0;

    .line 599
    .line 600
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 601
    .line 602
    .line 603
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 604
    .line 605
    .line 606
    move-result v3

    .line 607
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 608
    .line 609
    const-wide v9, 0x3f50624dd2f1a9fcL    # 0.001

    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    if-eqz v3, :cond_1a

    .line 615
    .line 616
    iget-object v3, v2, Lnx0;->a:Lkn;

    .line 617
    .line 618
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 619
    .line 620
    .line 621
    const-class v11, Llo;

    .line 622
    .line 623
    monitor-enter v11

    .line 624
    :try_start_1
    sget-object v12, Llo;->d:Llo;

    .line 625
    .line 626
    if-nez v12, :cond_15

    .line 627
    .line 628
    new-instance v12, Llo;

    .line 629
    .line 630
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 631
    .line 632
    .line 633
    sput-object v12, Llo;->d:Llo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 634
    .line 635
    goto :goto_a

    .line 636
    :catchall_0
    move-exception v0

    .line 637
    goto/16 :goto_c

    .line 638
    .line 639
    :cond_15
    :goto_a
    monitor-exit v11

    .line 640
    iget-object v11, v3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 641
    .line 642
    const-string v13, "fpr_vc_trace_sampling_rate"

    .line 643
    .line 644
    invoke-virtual {v11, v13}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getDouble(Ljava/lang/String;)Lgs0;

    .line 645
    .line 646
    .line 647
    move-result-object v11

    .line 648
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 649
    .line 650
    .line 651
    move-result v13

    .line 652
    if-eqz v13, :cond_16

    .line 653
    .line 654
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 655
    .line 656
    .line 657
    move-result-object v13

    .line 658
    check-cast v13, Ljava/lang/Double;

    .line 659
    .line 660
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 661
    .line 662
    .line 663
    move-result-wide v13

    .line 664
    invoke-static {v13, v14}, Lkn;->o(D)Z

    .line 665
    .line 666
    .line 667
    move-result v13

    .line 668
    if-eqz v13, :cond_16

    .line 669
    .line 670
    iget-object v3, v3, Lkn;->c:Lgx;

    .line 671
    .line 672
    const-string v12, "com.google.firebase.perf.TraceSamplingRate"

    .line 673
    .line 674
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 675
    .line 676
    .line 677
    move-result-object v13

    .line 678
    check-cast v13, Ljava/lang/Double;

    .line 679
    .line 680
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 681
    .line 682
    .line 683
    move-result-wide v13

    .line 684
    invoke-virtual {v3, v12, v13, v14}, Lgx;->d(Ljava/lang/String;D)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 688
    .line 689
    .line 690
    move-result-object v3

    .line 691
    check-cast v3, Ljava/lang/Double;

    .line 692
    .line 693
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 694
    .line 695
    .line 696
    move-result-wide v11

    .line 697
    goto :goto_b

    .line 698
    :cond_16
    invoke-virtual {v3, v12}, Lkn;->b(Lbe2;)Lgs0;

    .line 699
    .line 700
    .line 701
    move-result-object v11

    .line 702
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 703
    .line 704
    .line 705
    move-result v12

    .line 706
    if-eqz v12, :cond_17

    .line 707
    .line 708
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 709
    .line 710
    .line 711
    move-result-object v12

    .line 712
    check-cast v12, Ljava/lang/Double;

    .line 713
    .line 714
    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    .line 715
    .line 716
    .line 717
    move-result-wide v12

    .line 718
    invoke-static {v12, v13}, Lkn;->o(D)Z

    .line 719
    .line 720
    .line 721
    move-result v12

    .line 722
    if-eqz v12, :cond_17

    .line 723
    .line 724
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    move-result-object v3

    .line 728
    check-cast v3, Ljava/lang/Double;

    .line 729
    .line 730
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 731
    .line 732
    .line 733
    move-result-wide v11

    .line 734
    goto :goto_b

    .line 735
    :cond_17
    iget-object v3, v3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 736
    .line 737
    invoke-virtual {v3}, Lcom/google/firebase/perf/config/RemoteConfigManager;->isLastFetchFailed()Z

    .line 738
    .line 739
    .line 740
    move-result v3

    .line 741
    if-eqz v3, :cond_18

    .line 742
    .line 743
    move-wide v11, v9

    .line 744
    goto :goto_b

    .line 745
    :cond_18
    move-wide v11, v7

    .line 746
    :goto_b
    iget-wide v13, v2, Lnx0;->b:D

    .line 747
    .line 748
    cmpg-double v3, v13, v11

    .line 749
    .line 750
    if-gez v3, :cond_19

    .line 751
    .line 752
    goto :goto_d

    .line 753
    :cond_19
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 754
    .line 755
    .line 756
    move-result-object v3

    .line 757
    invoke-virtual {v3}, Lld1;->C()Lif0;

    .line 758
    .line 759
    .line 760
    move-result-object v3

    .line 761
    invoke-static {v3}, Lnx0;->a(Lif0;)Z

    .line 762
    .line 763
    .line 764
    move-result v3

    .line 765
    if-nez v3, :cond_1a

    .line 766
    .line 767
    goto/16 :goto_14

    .line 768
    .line 769
    :goto_c
    :try_start_2
    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 770
    throw v0

    .line 771
    :cond_1a
    :goto_d
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 772
    .line 773
    .line 774
    move-result v3

    .line 775
    if-eqz v3, :cond_20

    .line 776
    .line 777
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 778
    .line 779
    .line 780
    move-result-object v3

    .line 781
    invoke-virtual {v3}, Lld1;->B()Ljava/lang/String;

    .line 782
    .line 783
    .line 784
    move-result-object v3

    .line 785
    const-string v11, "_st_"

    .line 786
    .line 787
    invoke-virtual {v3, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 788
    .line 789
    .line 790
    move-result v3

    .line 791
    if-eqz v3, :cond_20

    .line 792
    .line 793
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 794
    .line 795
    .line 796
    move-result-object v3

    .line 797
    invoke-virtual {v3}, Lld1;->v()Z

    .line 798
    .line 799
    .line 800
    move-result v3

    .line 801
    if-eqz v3, :cond_20

    .line 802
    .line 803
    iget-object v3, v2, Lnx0;->a:Lkn;

    .line 804
    .line 805
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 806
    .line 807
    .line 808
    const-class v11, Ltn;

    .line 809
    .line 810
    monitor-enter v11

    .line 811
    :try_start_3
    sget-object v12, Ltn;->d:Ltn;

    .line 812
    .line 813
    if-nez v12, :cond_1b

    .line 814
    .line 815
    new-instance v12, Ltn;

    .line 816
    .line 817
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 818
    .line 819
    .line 820
    sput-object v12, Ltn;->d:Ltn;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 821
    .line 822
    goto :goto_e

    .line 823
    :catchall_1
    move-exception v0

    .line 824
    goto/16 :goto_10

    .line 825
    .line 826
    :cond_1b
    :goto_e
    monitor-exit v11

    .line 827
    invoke-virtual {v3, v12}, Lkn;->h(Lbe2;)Lgs0;

    .line 828
    .line 829
    .line 830
    move-result-object v11

    .line 831
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 832
    .line 833
    .line 834
    move-result v13

    .line 835
    if-eqz v13, :cond_1c

    .line 836
    .line 837
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 838
    .line 839
    .line 840
    move-result-object v11

    .line 841
    check-cast v11, Ljava/lang/Double;

    .line 842
    .line 843
    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    .line 844
    .line 845
    .line 846
    move-result-wide v13

    .line 847
    const-wide/high16 v15, 0x4059000000000000L    # 100.0

    .line 848
    .line 849
    div-double/2addr v13, v15

    .line 850
    invoke-static {v13, v14}, Lkn;->o(D)Z

    .line 851
    .line 852
    .line 853
    move-result v11

    .line 854
    if-eqz v11, :cond_1c

    .line 855
    .line 856
    goto :goto_f

    .line 857
    :cond_1c
    iget-object v11, v3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 858
    .line 859
    const-string v13, "fpr_vc_fragment_sampling_rate"

    .line 860
    .line 861
    invoke-virtual {v11, v13}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getDouble(Ljava/lang/String;)Lgs0;

    .line 862
    .line 863
    .line 864
    move-result-object v11

    .line 865
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 866
    .line 867
    .line 868
    move-result v13

    .line 869
    if-eqz v13, :cond_1d

    .line 870
    .line 871
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 872
    .line 873
    .line 874
    move-result-object v13

    .line 875
    check-cast v13, Ljava/lang/Double;

    .line 876
    .line 877
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 878
    .line 879
    .line 880
    move-result-wide v13

    .line 881
    invoke-static {v13, v14}, Lkn;->o(D)Z

    .line 882
    .line 883
    .line 884
    move-result v13

    .line 885
    if-eqz v13, :cond_1d

    .line 886
    .line 887
    iget-object v3, v3, Lkn;->c:Lgx;

    .line 888
    .line 889
    const-string v12, "com.google.firebase.perf.FragmentSamplingRate"

    .line 890
    .line 891
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 892
    .line 893
    .line 894
    move-result-object v13

    .line 895
    check-cast v13, Ljava/lang/Double;

    .line 896
    .line 897
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 898
    .line 899
    .line 900
    move-result-wide v13

    .line 901
    invoke-virtual {v3, v12, v13, v14}, Lgx;->d(Ljava/lang/String;D)V

    .line 902
    .line 903
    .line 904
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 905
    .line 906
    .line 907
    move-result-object v3

    .line 908
    check-cast v3, Ljava/lang/Double;

    .line 909
    .line 910
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 911
    .line 912
    .line 913
    move-result-wide v13

    .line 914
    goto :goto_f

    .line 915
    :cond_1d
    invoke-virtual {v3, v12}, Lkn;->b(Lbe2;)Lgs0;

    .line 916
    .line 917
    .line 918
    move-result-object v3

    .line 919
    invoke-virtual {v3}, Lgs0;->b()Z

    .line 920
    .line 921
    .line 922
    move-result v11

    .line 923
    if-eqz v11, :cond_1e

    .line 924
    .line 925
    invoke-virtual {v3}, Lgs0;->a()Ljava/lang/Object;

    .line 926
    .line 927
    .line 928
    move-result-object v11

    .line 929
    check-cast v11, Ljava/lang/Double;

    .line 930
    .line 931
    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    .line 932
    .line 933
    .line 934
    move-result-wide v11

    .line 935
    invoke-static {v11, v12}, Lkn;->o(D)Z

    .line 936
    .line 937
    .line 938
    move-result v11

    .line 939
    if-eqz v11, :cond_1e

    .line 940
    .line 941
    invoke-virtual {v3}, Lgs0;->a()Ljava/lang/Object;

    .line 942
    .line 943
    .line 944
    move-result-object v3

    .line 945
    check-cast v3, Ljava/lang/Double;

    .line 946
    .line 947
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 948
    .line 949
    .line 950
    move-result-wide v13

    .line 951
    goto :goto_f

    .line 952
    :cond_1e
    const-wide/16 v13, 0x0

    .line 953
    .line 954
    :goto_f
    iget-wide v11, v2, Lnx0;->c:D

    .line 955
    .line 956
    cmpg-double v3, v11, v13

    .line 957
    .line 958
    if-gez v3, :cond_1f

    .line 959
    .line 960
    goto :goto_11

    .line 961
    :cond_1f
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 962
    .line 963
    .line 964
    move-result-object v3

    .line 965
    invoke-virtual {v3}, Lld1;->C()Lif0;

    .line 966
    .line 967
    .line 968
    move-result-object v3

    .line 969
    invoke-static {v3}, Lnx0;->a(Lif0;)Z

    .line 970
    .line 971
    .line 972
    move-result v3

    .line 973
    if-nez v3, :cond_20

    .line 974
    .line 975
    goto/16 :goto_14

    .line 976
    .line 977
    :goto_10
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 978
    throw v0

    .line 979
    :cond_20
    :goto_11
    invoke-virtual {v0}, Lxs0;->e()Z

    .line 980
    .line 981
    .line 982
    move-result v3

    .line 983
    if-eqz v3, :cond_26

    .line 984
    .line 985
    iget-object v3, v2, Lnx0;->a:Lkn;

    .line 986
    .line 987
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 988
    .line 989
    .line 990
    const-class v11, Lyn;

    .line 991
    .line 992
    monitor-enter v11

    .line 993
    :try_start_5
    sget-object v12, Lyn;->d:Lyn;

    .line 994
    .line 995
    if-nez v12, :cond_21

    .line 996
    .line 997
    new-instance v12, Lyn;

    .line 998
    .line 999
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 1000
    .line 1001
    .line 1002
    sput-object v12, Lyn;->d:Lyn;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 1003
    .line 1004
    goto :goto_12

    .line 1005
    :catchall_2
    move-exception v0

    .line 1006
    goto/16 :goto_15

    .line 1007
    .line 1008
    :cond_21
    :goto_12
    monitor-exit v11

    .line 1009
    iget-object v11, v3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 1010
    .line 1011
    const-string v13, "fpr_vc_network_request_sampling_rate"

    .line 1012
    .line 1013
    invoke-virtual {v11, v13}, Lcom/google/firebase/perf/config/RemoteConfigManager;->getDouble(Ljava/lang/String;)Lgs0;

    .line 1014
    .line 1015
    .line 1016
    move-result-object v11

    .line 1017
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 1018
    .line 1019
    .line 1020
    move-result v13

    .line 1021
    if-eqz v13, :cond_22

    .line 1022
    .line 1023
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v13

    .line 1027
    check-cast v13, Ljava/lang/Double;

    .line 1028
    .line 1029
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    .line 1030
    .line 1031
    .line 1032
    move-result-wide v13

    .line 1033
    invoke-static {v13, v14}, Lkn;->o(D)Z

    .line 1034
    .line 1035
    .line 1036
    move-result v13

    .line 1037
    if-eqz v13, :cond_22

    .line 1038
    .line 1039
    iget-object v3, v3, Lkn;->c:Lgx;

    .line 1040
    .line 1041
    const-string v7, "com.google.firebase.perf.NetworkRequestSamplingRate"

    .line 1042
    .line 1043
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 1044
    .line 1045
    .line 1046
    move-result-object v8

    .line 1047
    check-cast v8, Ljava/lang/Double;

    .line 1048
    .line 1049
    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    .line 1050
    .line 1051
    .line 1052
    move-result-wide v8

    .line 1053
    invoke-virtual {v3, v7, v8, v9}, Lgx;->d(Ljava/lang/String;D)V

    .line 1054
    .line 1055
    .line 1056
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v3

    .line 1060
    check-cast v3, Ljava/lang/Double;

    .line 1061
    .line 1062
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 1063
    .line 1064
    .line 1065
    move-result-wide v7

    .line 1066
    goto :goto_13

    .line 1067
    :cond_22
    invoke-virtual {v3, v12}, Lkn;->b(Lbe2;)Lgs0;

    .line 1068
    .line 1069
    .line 1070
    move-result-object v11

    .line 1071
    invoke-virtual {v11}, Lgs0;->b()Z

    .line 1072
    .line 1073
    .line 1074
    move-result v12

    .line 1075
    if-eqz v12, :cond_23

    .line 1076
    .line 1077
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v12

    .line 1081
    check-cast v12, Ljava/lang/Double;

    .line 1082
    .line 1083
    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    .line 1084
    .line 1085
    .line 1086
    move-result-wide v12

    .line 1087
    invoke-static {v12, v13}, Lkn;->o(D)Z

    .line 1088
    .line 1089
    .line 1090
    move-result v12

    .line 1091
    if-eqz v12, :cond_23

    .line 1092
    .line 1093
    invoke-virtual {v11}, Lgs0;->a()Ljava/lang/Object;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v3

    .line 1097
    check-cast v3, Ljava/lang/Double;

    .line 1098
    .line 1099
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 1100
    .line 1101
    .line 1102
    move-result-wide v7

    .line 1103
    goto :goto_13

    .line 1104
    :cond_23
    iget-object v3, v3, Lkn;->a:Lcom/google/firebase/perf/config/RemoteConfigManager;

    .line 1105
    .line 1106
    invoke-virtual {v3}, Lcom/google/firebase/perf/config/RemoteConfigManager;->isLastFetchFailed()Z

    .line 1107
    .line 1108
    .line 1109
    move-result v3

    .line 1110
    if-eqz v3, :cond_24

    .line 1111
    .line 1112
    move-wide v7, v9

    .line 1113
    :cond_24
    :goto_13
    iget-wide v2, v2, Lnx0;->b:D

    .line 1114
    .line 1115
    cmpg-double v2, v2, v7

    .line 1116
    .line 1117
    if-gez v2, :cond_25

    .line 1118
    .line 1119
    goto :goto_16

    .line 1120
    :cond_25
    invoke-virtual {v0}, Lxs0;->f()Lop0;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v2

    .line 1124
    invoke-virtual {v2}, Lop0;->x()Lif0;

    .line 1125
    .line 1126
    .line 1127
    move-result-object v2

    .line 1128
    invoke-static {v2}, Lnx0;->a(Lif0;)Z

    .line 1129
    .line 1130
    .line 1131
    move-result v2

    .line 1132
    if-nez v2, :cond_26

    .line 1133
    .line 1134
    :goto_14
    invoke-virtual {v1, v0}, Lvd1;->b(Lxs0;)V

    .line 1135
    .line 1136
    .line 1137
    sget-object v1, Lvd1;->A:Lg5;

    .line 1138
    .line 1139
    const-string v2, "Event dropped due to device sampling - %s"

    .line 1140
    .line 1141
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v0

    .line 1145
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v0

    .line 1149
    invoke-virtual {v1, v2, v0}, Lg5;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1150
    .line 1151
    .line 1152
    goto/16 :goto_1e

    .line 1153
    .line 1154
    :goto_15
    :try_start_6
    monitor-exit v11
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1155
    throw v0

    .line 1156
    :cond_26
    :goto_16
    iget-object v2, v1, Lvd1;->u:Lnx0;

    .line 1157
    .line 1158
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1159
    .line 1160
    .line 1161
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 1162
    .line 1163
    .line 1164
    move-result v3

    .line 1165
    if-eqz v3, :cond_28

    .line 1166
    .line 1167
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 1168
    .line 1169
    .line 1170
    move-result-object v3

    .line 1171
    invoke-virtual {v3}, Lld1;->B()Ljava/lang/String;

    .line 1172
    .line 1173
    .line 1174
    move-result-object v3

    .line 1175
    const-string v7, "_fs"

    .line 1176
    .line 1177
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1178
    .line 1179
    .line 1180
    move-result v3

    .line 1181
    if-nez v3, :cond_27

    .line 1182
    .line 1183
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 1184
    .line 1185
    .line 1186
    move-result-object v3

    .line 1187
    invoke-virtual {v3}, Lld1;->B()Ljava/lang/String;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v3

    .line 1191
    const-string v7, "_bs"

    .line 1192
    .line 1193
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1194
    .line 1195
    .line 1196
    move-result v3

    .line 1197
    if-eqz v3, :cond_28

    .line 1198
    .line 1199
    :cond_27
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v3

    .line 1203
    invoke-virtual {v3}, Lld1;->w()I

    .line 1204
    .line 1205
    .line 1206
    move-result v3

    .line 1207
    if-lez v3, :cond_28

    .line 1208
    .line 1209
    goto :goto_17

    .line 1210
    :cond_28
    invoke-virtual {v0}, Lxs0;->a()Z

    .line 1211
    .line 1212
    .line 1213
    move-result v3

    .line 1214
    if-eqz v3, :cond_29

    .line 1215
    .line 1216
    :goto_17
    move v4, v6

    .line 1217
    goto :goto_19

    .line 1218
    :cond_29
    invoke-virtual {v0}, Lxs0;->e()Z

    .line 1219
    .line 1220
    .line 1221
    move-result v3

    .line 1222
    if-eqz v3, :cond_2a

    .line 1223
    .line 1224
    iget-object v2, v2, Lnx0;->e:Lmx0;

    .line 1225
    .line 1226
    invoke-virtual {v2}, Lmx0;->b()Z

    .line 1227
    .line 1228
    .line 1229
    move-result v2

    .line 1230
    :goto_18
    xor-int/2addr v4, v2

    .line 1231
    goto :goto_19

    .line 1232
    :cond_2a
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 1233
    .line 1234
    .line 1235
    move-result v3

    .line 1236
    if-eqz v3, :cond_2b

    .line 1237
    .line 1238
    iget-object v2, v2, Lnx0;->d:Lmx0;

    .line 1239
    .line 1240
    invoke-virtual {v2}, Lmx0;->b()Z

    .line 1241
    .line 1242
    .line 1243
    move-result v2

    .line 1244
    goto :goto_18

    .line 1245
    :cond_2b
    :goto_19
    if-eqz v4, :cond_2c

    .line 1246
    .line 1247
    invoke-virtual {v1, v0}, Lvd1;->b(Lxs0;)V

    .line 1248
    .line 1249
    .line 1250
    sget-object v1, Lvd1;->A:Lg5;

    .line 1251
    .line 1252
    const-string v2, "Rate limited (per device) - %s"

    .line 1253
    .line 1254
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v0

    .line 1258
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v0

    .line 1262
    invoke-virtual {v1, v2, v0}, Lg5;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1263
    .line 1264
    .line 1265
    goto/16 :goto_1e

    .line 1266
    .line 1267
    :cond_2c
    sget-object v2, Lvd1;->A:Lg5;

    .line 1268
    .line 1269
    invoke-virtual {v0}, Lxs0;->c()Z

    .line 1270
    .line 1271
    .line 1272
    move-result v3

    .line 1273
    if-eqz v3, :cond_2e

    .line 1274
    .line 1275
    const-string v3, "Logging %s. In a minute, visit the Firebase console to view your data: %s"

    .line 1276
    .line 1277
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 1278
    .line 1279
    .line 1280
    move-result-object v4

    .line 1281
    invoke-virtual {v0}, Lxs0;->d()Lld1;

    .line 1282
    .line 1283
    .line 1284
    move-result-object v6

    .line 1285
    const-string v7, "?utm_source=perf-android-sdk&utm_medium=android-ide"

    .line 1286
    .line 1287
    invoke-virtual {v6}, Lld1;->B()Ljava/lang/String;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v6

    .line 1291
    const-string v8, "_st_"

    .line 1292
    .line 1293
    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 1294
    .line 1295
    .line 1296
    move-result v8

    .line 1297
    iget-object v9, v1, Lvd1;->y:Ljava/lang/String;

    .line 1298
    .line 1299
    iget-object v10, v1, Lvd1;->x:Ljava/lang/String;

    .line 1300
    .line 1301
    if-eqz v8, :cond_2d

    .line 1302
    .line 1303
    invoke-static {v9, v10}, Lml;->q(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v8

    .line 1307
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1308
    .line 1309
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1310
    .line 1311
    .line 1312
    const-string v8, "/troubleshooting/trace/SCREEN_TRACE/"

    .line 1313
    .line 1314
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1315
    .line 1316
    .line 1317
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1318
    .line 1319
    .line 1320
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1321
    .line 1322
    .line 1323
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1324
    .line 1325
    .line 1326
    move-result-object v6

    .line 1327
    goto :goto_1a

    .line 1328
    :cond_2d
    invoke-static {v9, v10}, Lml;->q(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v8

    .line 1332
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1333
    .line 1334
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1335
    .line 1336
    .line 1337
    const-string v8, "/troubleshooting/trace/DURATION_TRACE/"

    .line 1338
    .line 1339
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    .line 1341
    .line 1342
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1343
    .line 1344
    .line 1345
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1346
    .line 1347
    .line 1348
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1349
    .line 1350
    .line 1351
    move-result-object v6

    .line 1352
    :goto_1a
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v4

    .line 1356
    invoke-virtual {v2, v3, v4}, Lg5;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1357
    .line 1358
    .line 1359
    goto :goto_1b

    .line 1360
    :cond_2e
    const-string v3, "Logging %s"

    .line 1361
    .line 1362
    invoke-static {v0}, Lvd1;->a(Lys0;)Ljava/lang/String;

    .line 1363
    .line 1364
    .line 1365
    move-result-object v4

    .line 1366
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 1367
    .line 1368
    .line 1369
    move-result-object v4

    .line 1370
    invoke-virtual {v2, v3, v4}, Lg5;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1371
    .line 1372
    .line 1373
    :goto_1b
    iget-object v1, v1, Lvd1;->q:Lq50;

    .line 1374
    .line 1375
    sget-object v2, Lq50;->d:Lg5;

    .line 1376
    .line 1377
    iget-object v3, v1, Lq50;->c:Law;

    .line 1378
    .line 1379
    if-nez v3, :cond_30

    .line 1380
    .line 1381
    iget-object v3, v1, Lq50;->b:Llw0;

    .line 1382
    .line 1383
    invoke-interface {v3}, Llw0;->get()Ljava/lang/Object;

    .line 1384
    .line 1385
    .line 1386
    move-result-object v3

    .line 1387
    check-cast v3, Lqd1;

    .line 1388
    .line 1389
    if-eqz v3, :cond_2f

    .line 1390
    .line 1391
    iget-object v4, v1, Lq50;->a:Ljava/lang/String;

    .line 1392
    .line 1393
    const-string v6, "proto"

    .line 1394
    .line 1395
    new-instance v7, La10;

    .line 1396
    .line 1397
    invoke-direct {v7, v6}, La10;-><init>(Ljava/lang/String;)V

    .line 1398
    .line 1399
    .line 1400
    new-instance v6, Lo40;

    .line 1401
    .line 1402
    invoke-direct {v6, v5}, Lo40;-><init>(I)V

    .line 1403
    .line 1404
    .line 1405
    check-cast v3, Lrd1;

    .line 1406
    .line 1407
    invoke-virtual {v3, v4, v7, v6}, Lrd1;->a(Ljava/lang/String;La10;Lnd1;)Law;

    .line 1408
    .line 1409
    .line 1410
    move-result-object v3

    .line 1411
    iput-object v3, v1, Lq50;->c:Law;

    .line 1412
    .line 1413
    goto :goto_1c

    .line 1414
    :cond_2f
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1415
    .line 1416
    .line 1417
    :cond_30
    :goto_1c
    iget-object v1, v1, Lq50;->c:Law;

    .line 1418
    .line 1419
    if-eqz v1, :cond_31

    .line 1420
    .line 1421
    new-instance v2, Lje;

    .line 1422
    .line 1423
    sget-object v3, Lav0;->j:Lav0;

    .line 1424
    .line 1425
    invoke-direct {v2, v0, v3}, Lje;-><init>(Ljava/lang/Object;Lav0;)V

    .line 1426
    .line 1427
    .line 1428
    new-instance v0, Lo40;

    .line 1429
    .line 1430
    const/16 v3, 0x1b

    .line 1431
    .line 1432
    invoke-direct {v0, v3}, Lo40;-><init>(I)V

    .line 1433
    .line 1434
    .line 1435
    invoke-virtual {v1, v2, v0}, Law;->a(Lje;Lyd1;)V

    .line 1436
    .line 1437
    .line 1438
    goto :goto_1d

    .line 1439
    :cond_31
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1440
    .line 1441
    .line 1442
    :goto_1d
    invoke-static {}, Lcom/google/firebase/perf/session/SessionManager;->getInstance()Lcom/google/firebase/perf/session/SessionManager;

    .line 1443
    .line 1444
    .line 1445
    move-result-object v0

    .line 1446
    invoke-virtual {v0}, Lcom/google/firebase/perf/session/SessionManager;->stopGaugeCollectionIfSessionRunningTooLong()V

    .line 1447
    .line 1448
    .line 1449
    :goto_1e
    return-void
.end method

.method public final onUpdateAppState(Lx9;)V
    .locals 2

    .line 1
    sget-object v0, Lx9;->l:Lx9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p1, v1

    .line 9
    :goto_0
    iput-boolean p1, p0, Lvd1;->z:Z

    .line 10
    .line 11
    iget-object p1, p0, Lvd1;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    new-instance p1, Lud1;

    .line 20
    .line 21
    invoke-direct {p1, p0, v1}, Lud1;-><init>(Lvd1;I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lvd1;->r:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
