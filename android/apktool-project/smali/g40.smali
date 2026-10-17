.class public final Lg40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lh40;


# static fields
.field public static final l:Ljava/lang/Object;


# instance fields
.field public final a:Lu30;

.field public final b:Le40;

.field public final c:Lxn0;

.field public final d:Lkg1;

.field public final e:Llh0;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/util/concurrent/ExecutorService;

.field public final h:Lh41;

.field public i:Ljava/lang/String;

.field public final j:Ljava/util/HashSet;

.field public final k:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lg40;->l:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lu30;Llw0;Ljava/util/concurrent/ExecutorService;Lh41;)V
    .locals 5

    .line 1
    new-instance v0, Le40;

    .line 2
    .line 3
    invoke-virtual {p1}, Lu30;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lu30;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-direct {v0, v1, p2}, Le40;-><init>(Landroid/content/Context;Llw0;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lxn0;

    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    invoke-direct {p2, v1, p1}, Lxn0;-><init>(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Lt11;->r:Lt11;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Lt11;

    .line 22
    .line 23
    const/16 v2, 0x15

    .line 24
    .line 25
    invoke-direct {v1, v2}, Lt11;-><init>(I)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Lt11;->r:Lt11;

    .line 29
    .line 30
    :cond_0
    sget-object v2, Lkg1;->b:Lkg1;

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    new-instance v2, Lkg1;

    .line 35
    .line 36
    invoke-direct {v2, v1}, Lkg1;-><init>(Lt11;)V

    .line 37
    .line 38
    .line 39
    sput-object v2, Lkg1;->b:Lkg1;

    .line 40
    .line 41
    :cond_1
    new-instance v1, Llh0;

    .line 42
    .line 43
    new-instance v3, Lim;

    .line 44
    .line 45
    const/4 v4, 0x2

    .line 46
    invoke-direct {v3, v4, p1}, Lim;-><init>(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {v1, v3}, Llh0;-><init>(Llw0;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Ljx0;

    .line 53
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v3, Ljava/lang/Object;

    .line 58
    .line 59
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Lg40;->f:Ljava/lang/Object;

    .line 63
    .line 64
    new-instance v3, Ljava/util/HashSet;

    .line 65
    .line 66
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v3, p0, Lg40;->j:Ljava/util/HashSet;

    .line 70
    .line 71
    new-instance v3, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v3, p0, Lg40;->k:Ljava/util/ArrayList;

    .line 77
    .line 78
    iput-object p1, p0, Lg40;->a:Lu30;

    .line 79
    .line 80
    iput-object v0, p0, Lg40;->b:Le40;

    .line 81
    .line 82
    iput-object p2, p0, Lg40;->c:Lxn0;

    .line 83
    .line 84
    iput-object v2, p0, Lg40;->d:Lkg1;

    .line 85
    .line 86
    iput-object v1, p0, Lg40;->e:Llh0;

    .line 87
    .line 88
    iput-object p3, p0, Lg40;->g:Ljava/util/concurrent/ExecutorService;

    .line 89
    .line 90
    iput-object p4, p0, Lg40;->h:Lh41;

    .line 91
    .line 92
    return-void
.end method

.method public static d()Lg40;
    .locals 2

    .line 1
    invoke-static {}, Lu30;->c()Lu30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lh40;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lg40;

    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    sget-object v0, Lg40;->l:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lg40;->a:Lu30;

    .line 5
    .line 6
    invoke-virtual {v1}, Lu30;->a()V

    .line 7
    .line 8
    .line 9
    iget-object v1, v1, Lu30;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v1}, Ls7;->c(Landroid/content/Context;)Ls7;

    .line 12
    .line 13
    .line 14
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    iget-object v2, p0, Lg40;->c:Lxn0;

    .line 16
    .line 17
    invoke-virtual {v2}, Lxn0;->v()Lcf;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget v3, v2, Lcf;->b:I

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    const/4 v5, 0x1

    .line 25
    if-eq v3, v4, :cond_1

    .line 26
    .line 27
    if-ne v3, v5, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v5, 0x0

    .line 31
    :cond_1
    :goto_0
    if-eqz v5, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Lg40;->g(Lcf;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v5, p0, Lg40;->c:Lxn0;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcf;->a()Lbf;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v3, v2, Lbf;->a:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v3, 0x3

    .line 46
    iput v3, v2, Lbf;->b:I

    .line 47
    .line 48
    invoke-virtual {v2}, Lbf;->a()Lcf;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v5, v2}, Lxn0;->p(Lcf;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_3

    .line 58
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 59
    .line 60
    :try_start_2
    invoke-virtual {v1}, Ls7;->G()V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catchall_1
    move-exception p0

    .line 65
    goto :goto_4

    .line 66
    :cond_3
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 67
    invoke-virtual {p0, v2}, Lg40;->j(Lcf;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lg40;->h:Lh41;

    .line 71
    .line 72
    new-instance v1, Lf40;

    .line 73
    .line 74
    invoke-direct {v1, p0, v4}, Lf40;-><init>(Lg40;I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lh41;->execute(Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :goto_3
    if-eqz v1, :cond_4

    .line 82
    .line 83
    :try_start_3
    invoke-virtual {v1}, Ls7;->G()V

    .line 84
    .line 85
    .line 86
    :cond_4
    throw p0

    .line 87
    :goto_4
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 88
    throw p0
.end method

.method public final b(Lcf;)Lcf;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Lg40;->b:Le40;

    .line 6
    .line 7
    iget-object v3, v1, Lg40;->a:Lu30;

    .line 8
    .line 9
    invoke-virtual {v3}, Lu30;->a()V

    .line 10
    .line 11
    .line 12
    iget-object v3, v3, Lu30;->c:Lj40;

    .line 13
    .line 14
    iget-object v3, v3, Lj40;->a:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v4, v0, Lcf;->a:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v5, v1, Lg40;->a:Lu30;

    .line 19
    .line 20
    invoke-virtual {v5}, Lu30;->a()V

    .line 21
    .line 22
    .line 23
    iget-object v5, v5, Lu30;->c:Lj40;

    .line 24
    .line 25
    iget-object v5, v5, Lj40;->g:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v6, v0, Lcf;->d:Ljava/lang/String;

    .line 28
    .line 29
    const-string v7, "Firebase Installations Service is unavailable. Please try again later."

    .line 30
    .line 31
    iget-object v8, v2, Le40;->c:Lr01;

    .line 32
    .line 33
    invoke-virtual {v8}, Lr01;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    if-eqz v9, :cond_c

    .line 38
    .line 39
    new-instance v9, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v10, "projects/"

    .line 42
    .line 43
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v5, "/installations/"

    .line 50
    .line 51
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v4, "/authTokens:generate"

    .line 58
    .line 59
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-static {v4}, Le40;->a(Ljava/lang/String;)Ljava/net/URL;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const/4 v9, 0x0

    .line 71
    :goto_0
    const/4 v10, 0x1

    .line 72
    if-gt v9, v10, :cond_b

    .line 73
    .line 74
    const v11, 0x8003

    .line 75
    .line 76
    .line 77
    invoke-static {v11}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v4, v3}, Le40;->c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    :try_start_0
    const-string v12, "POST"

    .line 85
    .line 86
    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v12, "Authorization"

    .line 90
    .line 91
    new-instance v13, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v14, "FIS_v2 "

    .line 97
    .line 98
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v13

    .line 108
    invoke-virtual {v11, v12, v13}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v11, v10}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 112
    .line 113
    .line 114
    invoke-static {v11}, Le40;->h(Ljava/net/HttpURLConnection;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 118
    .line 119
    .line 120
    move-result v12

    .line 121
    invoke-virtual {v8, v12}, Lr01;->b(I)V

    .line 122
    .line 123
    .line 124
    const/16 v13, 0xc8

    .line 125
    .line 126
    if-lt v12, v13, :cond_0

    .line 127
    .line 128
    const/16 v13, 0x12c

    .line 129
    .line 130
    if-ge v12, v13, :cond_0

    .line 131
    .line 132
    move v13, v10

    .line 133
    goto :goto_1

    .line 134
    :cond_0
    const/4 v13, 0x0

    .line 135
    :goto_1
    const/4 v14, 0x2

    .line 136
    const/4 v15, 0x0

    .line 137
    if-eqz v13, :cond_1

    .line 138
    .line 139
    invoke-static {v11}, Le40;->f(Ljava/net/HttpURLConnection;)Lpf;

    .line 140
    .line 141
    .line 142
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :catchall_0
    move-exception v0

    .line 151
    goto/16 :goto_6

    .line 152
    .line 153
    :catch_0
    move-object/from16 v16, v6

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_1
    :try_start_1
    invoke-static {v11, v15}, Le40;->b(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    .line 158
    .line 159
    const/16 v13, 0x191

    .line 160
    .line 161
    move-object/from16 v16, v6

    .line 162
    .line 163
    const-wide/16 v5, 0x0

    .line 164
    .line 165
    if-eq v12, v13, :cond_6

    .line 166
    .line 167
    const/16 v13, 0x194

    .line 168
    .line 169
    if-ne v12, v13, :cond_2

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_2
    const/16 v13, 0x1ad

    .line 173
    .line 174
    if-eq v12, v13, :cond_5

    .line 175
    .line 176
    const/16 v13, 0x1f4

    .line 177
    .line 178
    if-lt v12, v13, :cond_3

    .line 179
    .line 180
    const/16 v13, 0x258

    .line 181
    .line 182
    if-ge v12, v13, :cond_3

    .line 183
    .line 184
    :catch_1
    :goto_2
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 185
    .line 186
    .line 187
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 188
    .line 189
    .line 190
    goto/16 :goto_7

    .line 191
    .line 192
    :cond_3
    const/4 v12, 0x0

    .line 193
    or-int/2addr v12, v10

    .line 194
    int-to-byte v12, v12

    .line 195
    if-ne v12, v10, :cond_4

    .line 196
    .line 197
    :try_start_2
    new-instance v12, Lpf;

    .line 198
    .line 199
    invoke-direct {v12, v14, v5, v6, v15}, Lpf;-><init>(IJLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 200
    .line 201
    .line 202
    :goto_3
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 206
    .line 207
    .line 208
    move-object v2, v12

    .line 209
    goto :goto_5

    .line 210
    :cond_4
    :try_start_3
    new-instance v5, Ljava/lang/IllegalStateException;

    .line 211
    .line 212
    const-string v6, "Missing required properties: tokenExpirationTimestamp"

    .line 213
    .line 214
    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    throw v5

    .line 218
    :cond_5
    new-instance v5, Li40;

    .line 219
    .line 220
    const-string v6, "Firebase servers have received too many requests from this client in a short period of time. Please try again later."

    .line 221
    .line 222
    invoke-direct {v5, v6}, Lx30;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw v5

    .line 226
    :cond_6
    :goto_4
    const/4 v12, 0x0

    .line 227
    or-int/2addr v12, v10

    .line 228
    int-to-byte v12, v12

    .line 229
    if-ne v12, v10, :cond_a

    .line 230
    .line 231
    new-instance v12, Lpf;

    .line 232
    .line 233
    const/4 v13, 0x3

    .line 234
    invoke-direct {v12, v13, v5, v6, v15}, Lpf;-><init>(IJLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 235
    .line 236
    .line 237
    goto :goto_3

    .line 238
    :goto_5
    iget v3, v2, Lpf;->c:I

    .line 239
    .line 240
    invoke-static {v3}, Loq;->t(I)I

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-eqz v3, :cond_9

    .line 245
    .line 246
    if-eq v3, v10, :cond_8

    .line 247
    .line 248
    if-ne v3, v14, :cond_7

    .line 249
    .line 250
    monitor-enter p0

    .line 251
    :try_start_4
    iput-object v15, v1, Lg40;->i:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 252
    .line 253
    monitor-exit p0

    .line 254
    invoke-virtual {v0}, Lcf;->a()Lbf;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iput v14, v0, Lbf;->b:I

    .line 259
    .line 260
    invoke-virtual {v0}, Lbf;->a()Lcf;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    return-object v0

    .line 265
    :catchall_1
    move-exception v0

    .line 266
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 267
    throw v0

    .line 268
    :cond_7
    new-instance v0, Li40;

    .line 269
    .line 270
    invoke-direct {v0, v7}, Lx30;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    throw v0

    .line 274
    :cond_8
    const-string v1, "BAD CONFIG"

    .line 275
    .line 276
    invoke-virtual {v0}, Lcf;->a()Lbf;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iput-object v1, v0, Lbf;->g:Ljava/lang/String;

    .line 281
    .line 282
    const/4 v1, 0x5

    .line 283
    iput v1, v0, Lbf;->b:I

    .line 284
    .line 285
    invoke-virtual {v0}, Lbf;->a()Lcf;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    return-object v0

    .line 290
    :cond_9
    iget-object v1, v2, Lpf;->a:Ljava/lang/String;

    .line 291
    .line 292
    iget-wide v2, v2, Lpf;->b:J

    .line 293
    .line 294
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 295
    .line 296
    .line 297
    move-result-wide v4

    .line 298
    const-wide/16 v6, 0x3e8

    .line 299
    .line 300
    div-long/2addr v4, v6

    .line 301
    invoke-virtual {v0}, Lcf;->a()Lbf;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    iput-object v1, v0, Lbf;->c:Ljava/lang/String;

    .line 306
    .line 307
    iput-wide v2, v0, Lbf;->e:J

    .line 308
    .line 309
    iget-byte v1, v0, Lbf;->h:B

    .line 310
    .line 311
    or-int/2addr v1, v10

    .line 312
    int-to-byte v1, v1

    .line 313
    iput-wide v4, v0, Lbf;->f:J

    .line 314
    .line 315
    or-int/2addr v1, v14

    .line 316
    int-to-byte v1, v1

    .line 317
    iput-byte v1, v0, Lbf;->h:B

    .line 318
    .line 319
    invoke-virtual {v0}, Lbf;->a()Lcf;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    return-object v0

    .line 324
    :cond_a
    :try_start_6
    new-instance v5, Ljava/lang/IllegalStateException;

    .line 325
    .line 326
    const-string v6, "Missing required properties: tokenExpirationTimestamp"

    .line 327
    .line 328
    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    throw v5
    :try_end_6
    .catch Ljava/lang/AssertionError; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 332
    :goto_6
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 333
    .line 334
    .line 335
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 336
    .line 337
    .line 338
    throw v0

    .line 339
    :goto_7
    add-int/lit8 v9, v9, 0x1

    .line 340
    .line 341
    move-object/from16 v6, v16

    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :cond_b
    new-instance v0, Li40;

    .line 346
    .line 347
    invoke-direct {v0, v7}, Lx30;-><init>(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    throw v0

    .line 351
    :cond_c
    new-instance v0, Li40;

    .line 352
    .line 353
    invoke-direct {v0, v7}, Lx30;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    throw v0
.end method

.method public final c()Ljd2;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lg40;->f()V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Lg40;->i:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance v0, Llb1;

    .line 16
    .line 17
    invoke-direct {v0}, Llb1;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lma0;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Lma0;-><init>(Llb1;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lg40;->f:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter v2

    .line 28
    :try_start_1
    iget-object v3, p0, Lg40;->k:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object v0, v0, Llb1;->a:Ljd2;

    .line 35
    .line 36
    iget-object v1, p0, Lg40;->g:Ljava/util/concurrent/ExecutorService;

    .line 37
    .line 38
    new-instance v2, Lf40;

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-direct {v2, p0, v3}, Lf40;-><init>(Lg40;I)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    throw p0

    .line 51
    :catchall_1
    move-exception v0

    .line 52
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 53
    throw v0
.end method

.method public final e()Ljd2;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lg40;->f()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Llb1;

    .line 5
    .line 6
    invoke-direct {v0}, Llb1;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lla0;

    .line 10
    .line 11
    iget-object v2, p0, Lg40;->d:Lkg1;

    .line 12
    .line 13
    invoke-direct {v1, v2, v0}, Lla0;-><init>(Lkg1;Llb1;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lg40;->f:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v2

    .line 19
    :try_start_0
    iget-object v3, p0, Lg40;->k:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iget-object v0, v0, Llb1;->a:Ljd2;

    .line 26
    .line 27
    iget-object v1, p0, Lg40;->g:Ljava/util/concurrent/ExecutorService;

    .line 28
    .line 29
    new-instance v2, Lf40;

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-direct {v2, p0, v3}, Lf40;-><init>(Lg40;I)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-object p0, p0, Lg40;->a:Lu30;

    .line 2
    .line 3
    invoke-virtual {p0}, Lu30;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lu30;->c:Lj40;

    .line 7
    .line 8
    iget-object v0, v0, Lj40;->b:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "Please set your Application ID. A valid Firebase App ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options."

    .line 11
    .line 12
    invoke-static {v0, v1}, Lbh;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lu30;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lu30;->c:Lj40;

    .line 19
    .line 20
    iget-object v0, v0, Lj40;->g:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "Please set your Project ID. A valid Firebase Project ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options."

    .line 23
    .line 24
    invoke-static {v0, v2}, Lbh;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lu30;->a()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lu30;->c:Lj40;

    .line 31
    .line 32
    iget-object v0, v0, Lj40;->a:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "Please set a valid API key. A Firebase API key is required to communicate with Firebase server APIs: It authenticates your project with Google.Please refer to https://firebase.google.com/support/privacy/init-options."

    .line 35
    .line 36
    invoke-static {v0, v2}, Lbh;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lu30;->a()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lu30;->c:Lj40;

    .line 43
    .line 44
    iget-object v0, v0, Lj40;->b:Ljava/lang/String;

    .line 45
    .line 46
    sget-object v3, Lkg1;->a:Ljava/util/regex/Pattern;

    .line 47
    .line 48
    const-string v3, ":"

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {v1, v0}, Lbh;->b(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lu30;->a()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lu30;->c:Lj40;

    .line 61
    .line 62
    iget-object p0, p0, Lj40;->a:Ljava/lang/String;

    .line 63
    .line 64
    sget-object v0, Lkg1;->a:Ljava/util/regex/Pattern;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {v2, p0}, Lbh;->b(Ljava/lang/String;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final g(Lcf;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lg40;->a:Lu30;

    .line 2
    .line 3
    invoke-virtual {v0}, Lu30;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, v0, Lu30;->b:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "CHIME_ANDROID_SDK"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lg40;->a:Lu30;

    .line 17
    .line 18
    const-string v1, "[DEFAULT]"

    .line 19
    .line 20
    invoke-virtual {v0}, Lu30;->a()V

    .line 21
    .line 22
    .line 23
    iget-object v0, v0, Lu30;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    :cond_0
    iget p1, p1, Lcf;->b:I

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    if-ne p1, v0, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Lg40;->e:Llh0;

    .line 37
    .line 38
    invoke-virtual {p0}, Llh0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lqd0;

    .line 43
    .line 44
    iget-object p1, p0, Lqd0;->a:Landroid/content/SharedPreferences;

    .line 45
    .line 46
    monitor-enter p1

    .line 47
    :try_start_0
    iget-object v0, p0, Lqd0;->a:Landroid/content/SharedPreferences;

    .line 48
    .line 49
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :try_start_1
    iget-object v1, p0, Lqd0;->a:Landroid/content/SharedPreferences;

    .line 51
    .line 52
    const-string v2, "|S|id"

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    :try_start_2
    monitor-exit p1

    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {p0}, Lqd0;->a()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    invoke-static {}, Ljx0;->a()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    return-object v1

    .line 83
    :catchall_1
    move-exception p0

    .line 84
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 85
    :try_start_4
    throw p0

    .line 86
    :goto_1
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 87
    throw p0

    .line 88
    :cond_3
    invoke-static {}, Ljx0;->a()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public final h(Lcf;)Lcf;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Lcf;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v3, 0x4

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x0

    .line 10
    if-eqz v2, :cond_3

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/16 v6, 0xb

    .line 17
    .line 18
    if-ne v2, v6, :cond_3

    .line 19
    .line 20
    iget-object v2, v0, Lg40;->e:Llh0;

    .line 21
    .line 22
    invoke-virtual {v2}, Llh0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lqd0;

    .line 27
    .line 28
    iget-object v6, v2, Lqd0;->a:Landroid/content/SharedPreferences;

    .line 29
    .line 30
    monitor-enter v6

    .line 31
    :try_start_0
    sget-object v7, Lqd0;->c:[Ljava/lang/String;

    .line 32
    .line 33
    move v8, v4

    .line 34
    :goto_0
    if-ge v8, v3, :cond_2

    .line 35
    .line 36
    aget-object v9, v7, v8

    .line 37
    .line 38
    iget-object v10, v2, Lqd0;->b:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v11, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v12, "|T|"

    .line 43
    .line 44
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v10, "|"

    .line 51
    .line 52
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v9

    .line 62
    iget-object v10, v2, Lqd0;->a:Landroid/content/SharedPreferences;

    .line 63
    .line 64
    invoke-interface {v10, v9, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    if-eqz v9, :cond_1

    .line 69
    .line 70
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v10

    .line 74
    if-nez v10, :cond_1

    .line 75
    .line 76
    const-string v2, "{"

    .line 77
    .line 78
    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    if-eqz v2, :cond_0

    .line 83
    .line 84
    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    .line 85
    .line 86
    invoke-direct {v2, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v7, "token"

    .line 90
    .line 91
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v5
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    goto :goto_1

    .line 96
    :cond_0
    move-object v5, v9

    .line 97
    :catch_0
    :goto_1
    :try_start_2
    monitor-exit v6

    .line 98
    goto :goto_3

    .line 99
    :catchall_0
    move-exception v0

    .line 100
    goto :goto_2

    .line 101
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    monitor-exit v6

    .line 105
    goto :goto_3

    .line 106
    :goto_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    throw v0

    .line 108
    :cond_3
    :goto_3
    iget-object v2, v0, Lg40;->b:Le40;

    .line 109
    .line 110
    iget-object v6, v0, Lg40;->a:Lu30;

    .line 111
    .line 112
    invoke-virtual {v6}, Lu30;->a()V

    .line 113
    .line 114
    .line 115
    iget-object v6, v6, Lu30;->c:Lj40;

    .line 116
    .line 117
    iget-object v6, v6, Lj40;->a:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v7, v1, Lcf;->a:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v8, v0, Lg40;->a:Lu30;

    .line 122
    .line 123
    invoke-virtual {v8}, Lu30;->a()V

    .line 124
    .line 125
    .line 126
    iget-object v8, v8, Lu30;->c:Lj40;

    .line 127
    .line 128
    iget-object v8, v8, Lj40;->g:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v0, v0, Lg40;->a:Lu30;

    .line 131
    .line 132
    invoke-virtual {v0}, Lu30;->a()V

    .line 133
    .line 134
    .line 135
    iget-object v0, v0, Lu30;->c:Lj40;

    .line 136
    .line 137
    iget-object v0, v0, Lj40;->b:Ljava/lang/String;

    .line 138
    .line 139
    const-string v9, "Firebase Installations Service is unavailable. Please try again later."

    .line 140
    .line 141
    iget-object v10, v2, Le40;->c:Lr01;

    .line 142
    .line 143
    invoke-virtual {v10}, Lr01;->a()Z

    .line 144
    .line 145
    .line 146
    move-result v11

    .line 147
    if-eqz v11, :cond_c

    .line 148
    .line 149
    new-instance v11, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v12, "projects/"

    .line 152
    .line 153
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v8, "/installations"

    .line 160
    .line 161
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    invoke-static {v8}, Le40;->a(Ljava/lang/String;)Ljava/net/URL;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    move v11, v4

    .line 173
    :goto_4
    const/4 v12, 0x1

    .line 174
    if-gt v11, v12, :cond_b

    .line 175
    .line 176
    const v13, 0x8001

    .line 177
    .line 178
    .line 179
    invoke-static {v13}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2, v8, v6}, Le40;->c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    .line 183
    .line 184
    .line 185
    move-result-object v13

    .line 186
    :try_start_3
    const-string v14, "POST"

    .line 187
    .line 188
    invoke-virtual {v13, v14}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v13, v12}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 192
    .line 193
    .line 194
    if-eqz v5, :cond_4

    .line 195
    .line 196
    const-string v14, "x-goog-fis-android-iid-migration-auth"

    .line 197
    .line 198
    invoke-virtual {v13, v14, v5}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    goto :goto_5

    .line 202
    :catchall_1
    move-exception v0

    .line 203
    goto/16 :goto_8

    .line 204
    .line 205
    :cond_4
    :goto_5
    invoke-static {v13, v7, v0}, Le40;->g(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 209
    .line 210
    .line 211
    move-result v14

    .line 212
    invoke-virtual {v10, v14}, Lr01;->b(I)V

    .line 213
    .line 214
    .line 215
    const/16 v15, 0xc8

    .line 216
    .line 217
    if-lt v14, v15, :cond_5

    .line 218
    .line 219
    const/16 v15, 0x12c

    .line 220
    .line 221
    if-ge v14, v15, :cond_5

    .line 222
    .line 223
    move v15, v12

    .line 224
    goto :goto_6

    .line 225
    :cond_5
    move v15, v4

    .line 226
    :goto_6
    if-eqz v15, :cond_6

    .line 227
    .line 228
    invoke-static {v13}, Le40;->e(Ljava/net/HttpURLConnection;)Lse;

    .line 229
    .line 230
    .line 231
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 232
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 233
    .line 234
    .line 235
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 236
    .line 237
    .line 238
    goto :goto_7

    .line 239
    :cond_6
    :try_start_4
    invoke-static {v13, v0}, Le40;->b(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/AssertionError; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 240
    .line 241
    .line 242
    const/16 v15, 0x1ad

    .line 243
    .line 244
    if-eq v14, v15, :cond_a

    .line 245
    .line 246
    const/16 v15, 0x1f4

    .line 247
    .line 248
    if-lt v14, v15, :cond_7

    .line 249
    .line 250
    const/16 v15, 0x258

    .line 251
    .line 252
    if-ge v14, v15, :cond_7

    .line 253
    .line 254
    :catch_1
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 258
    .line 259
    .line 260
    goto :goto_9

    .line 261
    :cond_7
    :try_start_5
    new-instance v16, Lse;

    .line 262
    .line 263
    const/16 v20, 0x0

    .line 264
    .line 265
    const/16 v19, 0x0

    .line 266
    .line 267
    const/16 v18, 0x0

    .line 268
    .line 269
    const/16 v17, 0x0

    .line 270
    .line 271
    const/16 v21, 0x2

    .line 272
    .line 273
    invoke-direct/range {v16 .. v21}, Lse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpf;I)V
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 274
    .line 275
    .line 276
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 277
    .line 278
    .line 279
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 280
    .line 281
    .line 282
    move-object/from16 v0, v16

    .line 283
    .line 284
    :goto_7
    iget v2, v0, Lse;->e:I

    .line 285
    .line 286
    invoke-static {v2}, Loq;->t(I)I

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    if-eqz v2, :cond_9

    .line 291
    .line 292
    if-ne v2, v12, :cond_8

    .line 293
    .line 294
    const-string v0, "BAD CONFIG"

    .line 295
    .line 296
    invoke-virtual {v1}, Lcf;->a()Lbf;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    iput-object v0, v1, Lbf;->g:Ljava/lang/String;

    .line 301
    .line 302
    const/4 v0, 0x5

    .line 303
    iput v0, v1, Lbf;->b:I

    .line 304
    .line 305
    invoke-virtual {v1}, Lbf;->a()Lcf;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    return-object v0

    .line 310
    :cond_8
    new-instance v0, Li40;

    .line 311
    .line 312
    const-string v1, "Firebase Installations Service is unavailable. Please try again later."

    .line 313
    .line 314
    invoke-direct {v0, v1}, Lx30;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    throw v0

    .line 318
    :cond_9
    iget-object v2, v0, Lse;->b:Ljava/lang/String;

    .line 319
    .line 320
    iget-object v4, v0, Lse;->c:Ljava/lang/String;

    .line 321
    .line 322
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 323
    .line 324
    .line 325
    move-result-wide v5

    .line 326
    const-wide/16 v7, 0x3e8

    .line 327
    .line 328
    div-long/2addr v5, v7

    .line 329
    iget-object v0, v0, Lse;->d:Lpf;

    .line 330
    .line 331
    iget-object v7, v0, Lpf;->a:Ljava/lang/String;

    .line 332
    .line 333
    iget-wide v8, v0, Lpf;->b:J

    .line 334
    .line 335
    invoke-virtual {v1}, Lcf;->a()Lbf;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    iput-object v2, v0, Lbf;->a:Ljava/lang/String;

    .line 340
    .line 341
    iput v3, v0, Lbf;->b:I

    .line 342
    .line 343
    iput-object v7, v0, Lbf;->c:Ljava/lang/String;

    .line 344
    .line 345
    iput-object v4, v0, Lbf;->d:Ljava/lang/String;

    .line 346
    .line 347
    iput-wide v8, v0, Lbf;->e:J

    .line 348
    .line 349
    iget-byte v1, v0, Lbf;->h:B

    .line 350
    .line 351
    or-int/2addr v1, v12

    .line 352
    int-to-byte v1, v1

    .line 353
    iput-wide v5, v0, Lbf;->f:J

    .line 354
    .line 355
    or-int/lit8 v1, v1, 0x2

    .line 356
    .line 357
    int-to-byte v1, v1

    .line 358
    iput-byte v1, v0, Lbf;->h:B

    .line 359
    .line 360
    invoke-virtual {v0}, Lbf;->a()Lcf;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    return-object v0

    .line 365
    :cond_a
    :try_start_6
    new-instance v12, Li40;

    .line 366
    .line 367
    const-string v14, "Firebase servers have received too many requests from this client in a short period of time. Please try again later."

    .line 368
    .line 369
    invoke-direct {v12, v14}, Lx30;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    throw v12
    :try_end_6
    .catch Ljava/lang/AssertionError; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 373
    :goto_8
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 374
    .line 375
    .line 376
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 377
    .line 378
    .line 379
    throw v0

    .line 380
    :goto_9
    add-int/lit8 v11, v11, 0x1

    .line 381
    .line 382
    goto/16 :goto_4

    .line 383
    .line 384
    :cond_b
    new-instance v0, Li40;

    .line 385
    .line 386
    invoke-direct {v0, v9}, Lx30;-><init>(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    throw v0

    .line 390
    :cond_c
    new-instance v0, Li40;

    .line 391
    .line 392
    invoke-direct {v0, v9}, Lx30;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    throw v0
.end method

.method public final i(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lg40;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lg40;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

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
    check-cast v1, Lv91;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Lv91;->a(Ljava/lang/Exception;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public final j(Lcf;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lg40;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lg40;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

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
    check-cast v1, Lv91;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Lv91;->b(Lcf;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method
