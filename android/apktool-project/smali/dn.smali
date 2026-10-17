.class public final Ldn;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final i:[I


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ldn;->i:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x2
        0x4
        0x8
        0x10
        0x20
        0x40
        0x80
        0x100
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lo61;Lmz;Lny0;Lbv1;Ldb2;Lqt;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    new-instance v2, Llb1;

    .line 14
    .line 15
    invoke-direct {v2}, Llb1;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ldn;->h:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object p1, p0, Ldn;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object p2, p0, Ldn;->b:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object p4, p0, Ldn;->c:Ljava/lang/Object;

    .line 28
    .line 29
    iput-object p5, p0, Ldn;->d:Ljava/lang/Object;

    .line 30
    .line 31
    iput-object p6, p0, Ldn;->e:Ljava/lang/Object;

    .line 32
    .line 33
    iput-object p7, p0, Ldn;->f:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-static {p3}, Lok0;->n(Lmz;)Lp51;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 43
    iput-object p1, p0, Ldn;->a:Ljava/lang/Object;

    iput-object p2, p0, Ldn;->b:Ljava/lang/Object;

    iput-object p3, p0, Ldn;->c:Ljava/lang/Object;

    iput-object p4, p0, Ldn;->d:Ljava/lang/Object;

    iput-object p5, p0, Ldn;->e:Ljava/lang/Object;

    iput-object p6, p0, Ldn;->f:Ljava/lang/Object;

    iput-object p7, p0, Ldn;->g:Ljava/lang/Object;

    iput-object p8, p0, Ldn;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/net/HttpURLConnection;Ldn;Lxm;Ljava/util/LinkedHashSet;Lin;Ljava/util/concurrent/ScheduledExecutorService;Lmn;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Ldn;->b:Ljava/lang/Object;

    .line 46
    iput-object p2, p0, Ldn;->c:Ljava/lang/Object;

    .line 47
    iput-object p3, p0, Ldn;->e:Ljava/lang/Object;

    .line 48
    iput-object p4, p0, Ldn;->a:Ljava/lang/Object;

    .line 49
    iput-object p5, p0, Ldn;->f:Ljava/lang/Object;

    .line 50
    iput-object p6, p0, Ldn;->h:Ljava/lang/Object;

    .line 51
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Ldn;->d:Ljava/lang/Object;

    .line 52
    iput-object p7, p0, Ldn;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a(IJ)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lb50;

    .line 4
    .line 5
    const-string p2, "Unable to fetch the latest version of the template."

    .line 6
    .line 7
    invoke-direct {p1, p2}, Lb50;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ldn;->i(Lx40;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ldn;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/util/Random;

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ldn;->h:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 26
    .line 27
    new-instance v2, Lum;

    .line 28
    .line 29
    invoke-direct {v2, p0, p1, p2, p3}, Lum;-><init>(Ldn;IJ)V

    .line 30
    .line 31
    .line 32
    int-to-long p0, v0

    .line 33
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    invoke-interface {v1, v2, p0, p1, p2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/HashMap;)Lcn;
    .locals 12

    .line 1
    const/4 v1, 0x1

    .line 2
    :try_start_0
    iget-object v0, p0, Ldn;->f:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;->b()Ljava/net/HttpURLConnection;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    iget-object v0, p0, Ldn;->f:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v2, v0

    .line 13
    check-cast v2, Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;

    .line 14
    .line 15
    invoke-virtual {p0}, Ldn;->g()Ljava/util/HashMap;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lmn;

    .line 22
    .line 23
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 24
    .line 25
    const-string v4, "last_fetch_etag"

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    iget-object v0, p0, Ldn;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Llw0;

    .line 35
    .line 36
    invoke-interface {v0}, Llw0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lj4;

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    :goto_0
    move-object v9, v5

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    check-cast v0, Lk4;

    .line 47
    .line 48
    iget-object v0, v0, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 51
    .line 52
    invoke-virtual {v0, v5, v5, v1}, Ldx1;->a(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v4, "_fot"

    .line 57
    .line 58
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    move-object v5, v0

    .line 63
    check-cast v5, Ljava/lang/Long;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :goto_1
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v0, Lmn;

    .line 69
    .line 70
    invoke-virtual {v0}, Lmn;->b()Ljava/util/HashMap;

    .line 71
    .line 72
    .line 73
    move-result-object v11

    .line 74
    move-object v4, p1

    .line 75
    move-object v5, p2

    .line 76
    move-object v10, p3

    .line 77
    move-object/from16 v8, p4

    .line 78
    .line 79
    invoke-virtual/range {v2 .. v11}, Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;->fetch(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;Ljava/util/Date;Ljava/util/Map;)Lcn;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p2, p1, Lcn;->b:Lzm;

    .line 84
    .line 85
    if-eqz p2, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v0, Lmn;

    .line 90
    .line 91
    iget-wide v2, p2, Lzm;->f:J

    .line 92
    .line 93
    iget-object p2, v0, Lmn;->b:Ljava/lang/Object;

    .line 94
    .line 95
    monitor-enter p2
    :try_end_0
    .catch Lb50; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :try_start_1
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 97
    .line 98
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-string v4, "last_template_version"

    .line 103
    .line 104
    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 109
    .line 110
    .line 111
    monitor-exit p2

    .line 112
    goto :goto_2

    .line 113
    :catchall_0
    move-exception v0

    .line 114
    move-object p1, v0

    .line 115
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    :try_start_2
    throw p1

    .line 117
    :catch_0
    move-exception v0

    .line 118
    move-object p1, v0

    .line 119
    goto :goto_4

    .line 120
    :cond_1
    :goto_2
    iget-object p2, p1, Lcn;->c:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p2, :cond_2

    .line 123
    .line 124
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v0, Lmn;

    .line 127
    .line 128
    iget-object v2, v0, Lmn;->b:Ljava/lang/Object;

    .line 129
    .line 130
    monitor-enter v2
    :try_end_2
    .catch Lb50; {:try_start_2 .. :try_end_2} :catch_0

    .line 131
    :try_start_3
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 132
    .line 133
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v3, "last_fetch_etag"

    .line 138
    .line 139
    invoke-interface {v0, v3, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 144
    .line 145
    .line 146
    monitor-exit v2

    .line 147
    goto :goto_3

    .line 148
    :catchall_1
    move-exception v0

    .line 149
    move-object p1, v0

    .line 150
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 151
    :try_start_4
    throw p1

    .line 152
    :cond_2
    :goto_3
    iget-object p2, p0, Ldn;->g:Ljava/lang/Object;

    .line 153
    .line 154
    check-cast p2, Lmn;

    .line 155
    .line 156
    sget-object v0, Lmn;->f:Ljava/util/Date;

    .line 157
    .line 158
    const/4 v2, 0x0

    .line 159
    invoke-virtual {p2, v2, v0}, Lmn;->d(ILjava/util/Date;)V
    :try_end_4
    .catch Lb50; {:try_start_4 .. :try_end_4} :catch_0

    .line 160
    .line 161
    .line 162
    return-object p1

    .line 163
    :goto_4
    iget p2, p1, Lb50;->j:I

    .line 164
    .line 165
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v0, Lmn;

    .line 168
    .line 169
    const/16 v2, 0x1ad

    .line 170
    .line 171
    if-eq p2, v2, :cond_3

    .line 172
    .line 173
    const/16 v3, 0x1f6

    .line 174
    .line 175
    if-eq p2, v3, :cond_3

    .line 176
    .line 177
    const/16 v3, 0x1f7

    .line 178
    .line 179
    if-eq p2, v3, :cond_3

    .line 180
    .line 181
    const/16 v3, 0x1f8

    .line 182
    .line 183
    if-ne p2, v3, :cond_4

    .line 184
    .line 185
    :cond_3
    invoke-virtual {v0}, Lmn;->a()Lln;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    iget p2, p2, Lln;->a:I

    .line 190
    .line 191
    add-int/2addr p2, v1

    .line 192
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 193
    .line 194
    sget-object v4, Ldn;->i:[I

    .line 195
    .line 196
    const/16 v5, 0x8

    .line 197
    .line 198
    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    sub-int/2addr v5, v1

    .line 203
    aget v4, v4, v5

    .line 204
    .line 205
    int-to-long v4, v4

    .line 206
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 207
    .line 208
    .line 209
    move-result-wide v3

    .line 210
    const-wide/16 v5, 0x2

    .line 211
    .line 212
    div-long v5, v3, v5

    .line 213
    .line 214
    iget-object p0, p0, Ldn;->d:Ljava/lang/Object;

    .line 215
    .line 216
    check-cast p0, Ljava/util/Random;

    .line 217
    .line 218
    long-to-int v3, v3

    .line 219
    invoke-virtual {p0, v3}, Ljava/util/Random;->nextInt(I)I

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    int-to-long v3, p0

    .line 224
    add-long/2addr v5, v3

    .line 225
    new-instance p0, Ljava/util/Date;

    .line 226
    .line 227
    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    .line 228
    .line 229
    .line 230
    move-result-wide v3

    .line 231
    add-long/2addr v3, v5

    .line 232
    invoke-direct {p0, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, p2, p0}, Lmn;->d(ILjava/util/Date;)V

    .line 236
    .line 237
    .line 238
    :cond_4
    invoke-virtual {v0}, Lmn;->a()Lln;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    iget p2, p1, Lb50;->j:I

    .line 243
    .line 244
    iget v0, p0, Lln;->a:I

    .line 245
    .line 246
    if-gt v0, v1, :cond_9

    .line 247
    .line 248
    if-eq p2, v2, :cond_9

    .line 249
    .line 250
    const/16 p0, 0x191

    .line 251
    .line 252
    if-eq p2, p0, :cond_8

    .line 253
    .line 254
    const/16 p0, 0x193

    .line 255
    .line 256
    if-eq p2, p0, :cond_7

    .line 257
    .line 258
    if-eq p2, v2, :cond_6

    .line 259
    .line 260
    const/16 p0, 0x1f4

    .line 261
    .line 262
    if-eq p2, p0, :cond_5

    .line 263
    .line 264
    packed-switch p2, :pswitch_data_0

    .line 265
    .line 266
    .line 267
    const-string p0, "The server returned an unexpected error."

    .line 268
    .line 269
    goto :goto_5

    .line 270
    :pswitch_0
    const-string p0, "The server is unavailable. Please try again later."

    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_5
    const-string p0, "There was an internal server error."

    .line 274
    .line 275
    goto :goto_5

    .line 276
    :cond_6
    new-instance p0, Lw40;

    .line 277
    .line 278
    const-string p1, "The throttled response from the server was not handled correctly by the FRC SDK."

    .line 279
    .line 280
    invoke-direct {p0, p1}, Lx30;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw p0

    .line 284
    :cond_7
    const-string p0, "The user is not authorized to access the project. Please make sure you are using the API key that corresponds to your Firebase project."

    .line 285
    .line 286
    goto :goto_5

    .line 287
    :cond_8
    const-string p0, "The request did not have the required credentials. Please make sure your google-services.json is valid."

    .line 288
    .line 289
    :goto_5
    new-instance p2, Lb50;

    .line 290
    .line 291
    iget v0, p1, Lb50;->j:I

    .line 292
    .line 293
    const-string v1, "Fetch failed: "

    .line 294
    .line 295
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-direct {p2, v0, p0, p1}, Lb50;-><init>(ILjava/lang/String;Lb50;)V

    .line 300
    .line 301
    .line 302
    throw p2

    .line 303
    :cond_9
    new-instance p1, Ly40;

    .line 304
    .line 305
    iget-object p0, p0, Lln;->b:Ljava/util/Date;

    .line 306
    .line 307
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 308
    .line 309
    .line 310
    const-string p0, "Fetch was throttled."

    .line 311
    .line 312
    invoke-direct {p1, p0}, Lx30;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    throw p1

    .line 316
    nop

    .line 317
    :pswitch_data_0
    .packed-switch 0x1f6
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ljd2;JLjava/util/HashMap;)Ljd2;
    .locals 12

    .line 1
    iget-object v0, p0, Ldn;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    iget-object v1, p0, Ldn;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lh40;

    .line 8
    .line 9
    iget-object v2, p0, Ldn;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Lmn;

    .line 12
    .line 13
    new-instance v7, Ljava/util/Date;

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-direct {v7, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v9, 0x2

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ljava/util/Date;

    .line 31
    .line 32
    iget-object v4, v2, Lmn;->a:Landroid/content/SharedPreferences;

    .line 33
    .line 34
    const-string v5, "last_fetch_time_in_millis"

    .line 35
    .line 36
    const-wide/16 v10, -0x1

    .line 37
    .line 38
    invoke-interface {v4, v5, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    invoke-direct {p1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 43
    .line 44
    .line 45
    sget-object v4, Lmn;->e:Ljava/util/Date;

    .line 46
    .line 47
    invoke-virtual {p1, v4}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_0

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    new-instance v4, Ljava/util/Date;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 62
    .line 63
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 64
    .line 65
    .line 66
    move-result-wide v10

    .line 67
    add-long/2addr v10, v5

    .line 68
    invoke-direct {v4, v10, v11}, Ljava/util/Date;-><init>(J)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v7, v4}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    :goto_0
    if-eqz p1, :cond_1

    .line 76
    .line 77
    new-instance p0, Lcn;

    .line 78
    .line 79
    invoke-direct {p0, v9, v3, v3}, Lcn;-><init>(ILzm;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_1
    invoke-virtual {v2}, Lmn;->a()Lln;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p1, p1, Lln;->b:Ljava/util/Date;

    .line 92
    .line 93
    invoke-virtual {v7, p1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    move-object v3, p1

    .line 100
    :cond_2
    if-eqz v3, :cond_3

    .line 101
    .line 102
    new-instance p1, Ly40;

    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    .line 105
    .line 106
    .line 107
    move-result-wide v1

    .line 108
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    .line 109
    .line 110
    .line 111
    move-result-wide v4

    .line 112
    sub-long/2addr v1, v4

    .line 113
    const-wide/16 v4, 0x3e8

    .line 114
    .line 115
    div-long/2addr v1, v4

    .line 116
    invoke-static {v1, v2}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    new-instance v2, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v4, "Fetch is throttled. Please wait before calling fetch again: "

    .line 123
    .line 124
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    .line 135
    .line 136
    .line 137
    invoke-direct {p1, v1}, Lx30;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p1}, Lbe2;->k(Lx40;)Ljd2;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    goto :goto_1

    .line 145
    :cond_3
    check-cast v1, Lg40;

    .line 146
    .line 147
    invoke-virtual {v1}, Lg40;->c()Ljd2;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {v1}, Lg40;->e()Ljd2;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    filled-new-array {v5, v6}, [Ljd2;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {p1}, Lbe2;->y([Ljd2;)Ljd2;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    new-instance v3, Lbn;

    .line 164
    .line 165
    move-object v4, p0

    .line 166
    move-object/from16 v8, p4

    .line 167
    .line 168
    invoke-direct/range {v3 .. v8}, Lbn;-><init>(Ldn;Ljd2;Ljd2;Ljava/util/Date;Ljava/util/HashMap;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v0, v3}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    :goto_1
    new-instance v1, Lkm;

    .line 176
    .line 177
    invoke-direct {v1, p0, v9, v7}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, v0, v1}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    return-object p0
.end method

.method public d(I)Ljd2;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p0, Ldn;->h:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/Map;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "REALTIME"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "/"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v1, "X-Firebase-RC-Fetch-Type"

    .line 30
    .line 31
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ldn;->e:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Lxm;

    .line 37
    .line 38
    invoke-virtual {p1}, Lxm;->b()Ljd2;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v1, p0, Ldn;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Ljava/util/concurrent/Executor;

    .line 45
    .line 46
    new-instance v2, Lkm;

    .line 47
    .line 48
    const/4 v3, 0x3

    .line 49
    invoke-direct {v2, p0, v3, v0}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v1, v2}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public e(I)Lp51;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    :try_start_0
    invoke-static {v1, p1}, Loq;->a(II)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_3

    .line 8
    .line 9
    iget-object v1, p0, Ldn;->d:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lbv1;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 12
    .line 13
    :try_start_1
    iget-object v1, v1, Lbv1;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/io/File;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    new-instance v2, Ljava/io/FileInputStream;

    .line 24
    .line 25
    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 26
    .line 27
    .line 28
    :try_start_2
    invoke-static {v2}, Lml;->C(Ljava/io/FileInputStream;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v3, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :catchall_1
    move-exception p0

    .line 41
    move-object v2, v0

    .line 42
    goto :goto_1

    .line 43
    :catch_0
    move-object v2, v0

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    move-object v2, v0

    .line 46
    move-object v3, v2

    .line 47
    :goto_0
    :try_start_3
    invoke-static {v2}, Lml;->i(Ljava/io/Closeable;)V

    .line 48
    .line 49
    .line 50
    goto :goto_3

    .line 51
    :goto_1
    invoke-static {v2}, Lml;->i(Ljava/io/Closeable;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :catch_1
    :goto_2
    invoke-static {v2}, Lml;->i(Ljava/io/Closeable;)V

    .line 56
    .line 57
    .line 58
    move-object v3, v0

    .line 59
    :goto_3
    if-eqz v3, :cond_3

    .line 60
    .line 61
    iget-object p0, p0, Ldn;->c:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p0, Lny0;

    .line 64
    .line 65
    const-string v1, "settings_version"

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v2, 0x3

    .line 72
    if-eq v1, v2, :cond_1

    .line 73
    .line 74
    new-instance v1, Lok0;

    .line 75
    .line 76
    const/16 v4, 0xc

    .line 77
    .line 78
    invoke-direct {v1, v4}, Lok0;-><init>(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_4

    .line 82
    :cond_1
    new-instance v1, Lok0;

    .line 83
    .line 84
    const/16 v4, 0x15

    .line 85
    .line 86
    invoke-direct {v1, v4}, Lok0;-><init>(I)V

    .line 87
    .line 88
    .line 89
    :goto_4
    iget-object p0, p0, Lny0;->k:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast p0, Lmz;

    .line 92
    .line 93
    invoke-virtual {v1, p0, v3}, Lok0;->k(Lmz;Lorg/json/JSONObject;)Lp51;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    invoke-static {v2, p1}, Loq;->a(II)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_2

    .line 109
    .line 110
    iget-wide v1, p0, Lp51;->c:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 111
    .line 112
    cmp-long p1, v1, v3

    .line 113
    .line 114
    if-gez p1, :cond_2

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_2
    move-object v0, p0

    .line 118
    :catch_2
    :cond_3
    :goto_5
    return-object v0
.end method

.method public f()Lp51;
    .locals 0

    .line 1
    iget-object p0, p0, Ldn;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lp51;

    .line 10
    .line 11
    return-object p0
.end method

.method public g()Ljava/util/HashMap;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ldn;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Llw0;

    .line 9
    .line 10
    invoke-interface {p0}, Llw0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lj4;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    check-cast p0, Lk4;

    .line 20
    .line 21
    iget-object p0, p0, Lk4;->a:Lcom/google/android/gms/measurement/api/AppMeasurementSdk;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iget-object p0, p0, Lcom/google/android/gms/measurement/api/AppMeasurementSdk;->a:Ldx1;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {p0, v1, v1, v2}, Ldx1;->a(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/util/Map$Entry;

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    :goto_1
    return-object v0
.end method

.method public h(Ljava/io/InputStream;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/io/BufferedReader;

    .line 2
    .line 3
    new-instance v1, Ljava/io/InputStreamReader;

    .line 4
    .line 5
    const-string v2, "utf-8"

    .line 6
    .line 7
    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 11
    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_9

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v2, "}"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const-string v1, ""

    .line 34
    .line 35
    const/16 v2, 0x7b

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/16 v3, 0x7d

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-ltz v2, :cond_2

    .line 48
    .line 49
    if-gez v3, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    if-lt v2, v3, :cond_3

    .line 53
    .line 54
    :cond_2
    :goto_1
    move-object p1, v1

    .line 55
    goto :goto_2

    .line 56
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 70
    .line 71
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string p1, "featureDisabled"

    .line 75
    .line 76
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    const-string p1, "featureDisabled"

    .line 83
    .line 84
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_5

    .line 89
    .line 90
    iget-object p1, p0, Ldn;->f:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p1, Lin;

    .line 93
    .line 94
    new-instance v1, Lb50;

    .line 95
    .line 96
    const-string v2, "The server is temporarily unavailable. Try again in a few minutes."

    .line 97
    .line 98
    invoke-direct {v1, v2}, Lb50;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v1}, Lin;->b(Lx40;)V

    .line 102
    .line 103
    .line 104
    goto :goto_5

    .line 105
    :catch_0
    move-exception p1

    .line 106
    goto :goto_3

    .line 107
    :cond_5
    monitor-enter p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    :try_start_1
    iget-object p1, p0, Ldn;->a:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast p1, Ljava/util/LinkedHashSet;

    .line 111
    .line 112
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    :try_start_2
    monitor-exit p0

    .line 117
    if-eqz p1, :cond_6

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :cond_6
    const-string p1, "latestTemplateVersionNumber"

    .line 121
    .line 122
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_7

    .line 127
    .line 128
    iget-object p1, p0, Ldn;->c:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast p1, Ldn;

    .line 131
    .line 132
    iget-object p1, p1, Ldn;->g:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast p1, Lmn;

    .line 135
    .line 136
    iget-object p1, p1, Lmn;->a:Landroid/content/SharedPreferences;

    .line 137
    .line 138
    const-string v2, "last_template_version"

    .line 139
    .line 140
    const-wide/16 v3, 0x0

    .line 141
    .line 142
    invoke-interface {p1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 143
    .line 144
    .line 145
    move-result-wide v2

    .line 146
    const-string p1, "latestTemplateVersionNumber"

    .line 147
    .line 148
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 149
    .line 150
    .line 151
    move-result-wide v4

    .line 152
    cmp-long p1, v4, v2

    .line 153
    .line 154
    if-lez p1, :cond_7

    .line 155
    .line 156
    const/4 p1, 0x3

    .line 157
    invoke-virtual {p0, p1, v4, v5}, Ldn;->a(IJ)V

    .line 158
    .line 159
    .line 160
    :cond_7
    const-string p1, "retryIntervalSeconds"

    .line 161
    .line 162
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_8

    .line 167
    .line 168
    const-string p1, "retryIntervalSeconds"

    .line 169
    .line 170
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    invoke-virtual {p0, p1}, Ldn;->j(I)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 175
    .line 176
    .line 177
    goto :goto_4

    .line 178
    :catchall_0
    move-exception p1

    .line 179
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 180
    :try_start_4
    throw p1
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 181
    :goto_3
    new-instance v1, Lw40;

    .line 182
    .line 183
    const-string v2, "Unable to parse config update message."

    .line 184
    .line 185
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-direct {v1, v2, p1}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v1}, Ldn;->i(Lx40;)V

    .line 193
    .line 194
    .line 195
    :cond_8
    :goto_4
    const-string p1, ""

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :cond_9
    :goto_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public declared-synchronized i(Lx40;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ldn;->a:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lon;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Lon;->b(Lx40;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p1
.end method

.method public declared-synchronized j(I)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/Date;

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 9
    .line 10
    .line 11
    int-to-long v1, p1

    .line 12
    const-wide/16 v3, 0x3e8

    .line 13
    .line 14
    mul-long/2addr v1, v3

    .line 15
    new-instance p1, Ljava/util/Date;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    add-long/2addr v3, v1

    .line 22
    invoke-direct {p1, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ldn;->g:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lmn;

    .line 28
    .line 29
    iget-object v1, v0, Lmn;->d:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    :try_start_1
    iget-object v0, v0, Lmn;->a:Landroid/content/SharedPreferences;

    .line 33
    .line 34
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v2, "realtime_backoff_end_time_in_millis"

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 49
    .line 50
    .line 51
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception p1

    .line 55
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    :try_start_3
    throw p1

    .line 57
    :catchall_1
    move-exception p1

    .line 58
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    throw p1
.end method
