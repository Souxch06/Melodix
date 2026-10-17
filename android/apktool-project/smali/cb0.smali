.class public final Lcb0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static c:Lcb0;


# instance fields
.field public a:Ljava/lang/Object;

.field public volatile b:Ljava/lang/Object;


# direct methods
.method public static a(Landroid/content/Context;)Lcb0;
    .locals 3

    .line 1
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcb0;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    sget-object v1, Lcb0;->c:Lcb0;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    sget-object v1, Le92;->a:Ljw1;

    .line 12
    .line 13
    const-class v1, Le92;

    .line 14
    .line 15
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    :try_start_1
    sget-object v2, Le92;->e:Landroid/content/Context;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    sput-object v2, Le92;->e:Landroid/content/Context;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    :try_start_2
    monitor-exit v1

    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    monitor-exit v1

    .line 31
    :goto_0
    new-instance v1, Lcb0;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iput-object p0, v1, Lcb0;->a:Ljava/lang/Object;

    .line 41
    .line 42
    sput-object v1, Lcb0;->c:Lcb0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :catchall_1
    move-exception p0

    .line 46
    goto :goto_3

    .line 47
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 48
    :try_start_4
    throw p0

    .line 49
    :cond_1
    :goto_2
    monitor-exit v0

    .line 50
    return-object v1

    .line 51
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 52
    throw p0
.end method

.method public static final d(Landroid/content/pm/PackageInfo;Z)Z
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    goto/16 :goto_b

    .line 5
    .line 6
    :cond_0
    const/4 v1, 0x1

    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    iget-object v2, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 10
    .line 11
    const-string v3, "com.android.vending"

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "com.google.android.gms"

    .line 22
    .line 23
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_4

    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 30
    .line 31
    if-nez p1, :cond_3

    .line 32
    .line 33
    :cond_2
    move p1, v0

    .line 34
    goto :goto_0

    .line 35
    :cond_3
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 36
    .line 37
    and-int/lit16 p1, p1, 0x81

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    move p1, v1

    .line 42
    :cond_4
    :goto_0
    if-eqz p1, :cond_5

    .line 43
    .line 44
    :try_start_0
    sget-object v2, Lq72;->c:Lft1;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_5
    sget-object v2, Lq72;->b:Lft1;

    .line 48
    .line 49
    :goto_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 50
    .line 51
    const/16 v4, 0x1c

    .line 52
    .line 53
    if-ge v3, v4, :cond_8

    .line 54
    .line 55
    iget-object v3, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    if-eqz v3, :cond_6

    .line 59
    .line 60
    array-length v5, v3

    .line 61
    if-ne v5, v1, :cond_6

    .line 62
    .line 63
    aget-object v3, v3, v0

    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    :cond_6
    if-eqz v4, :cond_7

    .line 70
    .line 71
    sget-object v3, Lqr1;->k:Lqp1;

    .line 72
    .line 73
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v1, v3}, Lea1;->m(I[Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    new-instance v4, Lft1;

    .line 81
    .line 82
    invoke-direct {v4, v1, v3}, Lft1;-><init>(I[Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_7

    .line 86
    .line 87
    :cond_7
    sget-object v3, Lqr1;->k:Lqp1;

    .line 88
    .line 89
    sget-object v4, Lft1;->n:Lft1;

    .line 90
    .line 91
    goto/16 :goto_7

    .line 92
    .line 93
    :cond_8
    if-lt v3, v4, :cond_15

    .line 94
    .line 95
    invoke-static {p0}, Ld1;->f(Landroid/content/pm/PackageInfo;)Landroid/content/pm/SigningInfo;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    if-eqz v3, :cond_11

    .line 100
    .line 101
    invoke-static {v3}, Ld1;->x(Landroid/content/pm/SigningInfo;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-nez v4, :cond_11

    .line 106
    .line 107
    invoke-static {v3}, Ld1;->D(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    if-nez v4, :cond_9

    .line 112
    .line 113
    goto :goto_6

    .line 114
    :cond_9
    sget-object v4, Lqr1;->k:Lqp1;

    .line 115
    .line 116
    const/4 v4, 0x4

    .line 117
    new-array v4, v4, [Ljava/lang/Object;

    .line 118
    .line 119
    invoke-static {v3}, Ld1;->D(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    array-length v5, v3

    .line 124
    move v6, v0

    .line 125
    move v7, v6

    .line 126
    :goto_2
    if-ge v6, v5, :cond_f

    .line 127
    .line 128
    aget-object v8, v3, v6

    .line 129
    .line 130
    invoke-virtual {v8}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    array-length v9, v4

    .line 138
    add-int/lit8 v10, v7, 0x1

    .line 139
    .line 140
    if-ltz v10, :cond_e

    .line 141
    .line 142
    if-gt v10, v9, :cond_a

    .line 143
    .line 144
    move v11, v9

    .line 145
    goto :goto_3

    .line 146
    :cond_a
    shr-int/lit8 v11, v9, 0x1

    .line 147
    .line 148
    add-int/2addr v11, v9

    .line 149
    add-int/2addr v11, v1

    .line 150
    if-ge v11, v10, :cond_b

    .line 151
    .line 152
    invoke-static {v7}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 153
    .line 154
    .line 155
    move-result v11

    .line 156
    add-int/2addr v11, v11

    .line 157
    :cond_b
    if-gez v11, :cond_c

    .line 158
    .line 159
    const v11, 0x7fffffff

    .line 160
    .line 161
    .line 162
    :cond_c
    :goto_3
    if-gt v11, v9, :cond_d

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_d
    invoke-static {v4, v11}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    :goto_4
    aput-object v8, v4, v7

    .line 170
    .line 171
    add-int/lit8 v6, v6, 0x1

    .line 172
    .line 173
    move v7, v10

    .line 174
    goto :goto_2

    .line 175
    :cond_e
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 176
    .line 177
    const-string v3, "cannot store more than Integer.MAX_VALUE elements"

    .line 178
    .line 179
    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    throw v2

    .line 183
    :cond_f
    if-nez v7, :cond_10

    .line 184
    .line 185
    sget-object v3, Lft1;->n:Lft1;

    .line 186
    .line 187
    :goto_5
    move-object v4, v3

    .line 188
    goto :goto_7

    .line 189
    :cond_10
    new-instance v3, Lft1;

    .line 190
    .line 191
    invoke-direct {v3, v7, v4}, Lft1;-><init>(I[Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_11
    :goto_6
    sget-object v3, Lqr1;->k:Lqp1;

    .line 196
    .line 197
    sget-object v4, Lft1;->n:Lft1;

    .line 198
    .line 199
    :goto_7
    invoke-virtual {v4}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-nez v3, :cond_14

    .line 204
    .line 205
    invoke-virtual {v4}, Lqr1;->f()Lqr1;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    move v5, v0

    .line 214
    :goto_8
    if-ge v5, v4, :cond_17

    .line 215
    .line 216
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v6

    .line 220
    check-cast v6, [B

    .line 221
    .line 222
    invoke-virtual {v2, v0}, Lqr1;->j(I)Lqp1;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    :cond_12
    invoke-virtual {v7}, Lqp1;->hasNext()Z

    .line 227
    .line 228
    .line 229
    move-result v8

    .line 230
    add-int/lit8 v9, v5, 0x1

    .line 231
    .line 232
    if-eqz v8, :cond_13

    .line 233
    .line 234
    invoke-virtual {v7}, Lqp1;->next()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    check-cast v8, [B

    .line 239
    .line 240
    invoke-static {v6, v8}, Ljava/util/Arrays;->equals([B[B)Z

    .line 241
    .line 242
    .line 243
    move-result v8

    .line 244
    if-eqz v8, :cond_12

    .line 245
    .line 246
    goto :goto_a

    .line 247
    :cond_13
    move v5, v9

    .line 248
    goto :goto_8

    .line 249
    :cond_14
    const-string v2, "Unable to obtain package certificate history."

    .line 250
    .line 251
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 252
    .line 253
    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    throw v3

    .line 257
    :cond_15
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 258
    .line 259
    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    .line 260
    .line 261
    .line 262
    throw v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    :catch_0
    if-eqz p1, :cond_16

    .line 264
    .line 265
    sget-object p1, Lq72;->a:[Lf22;

    .line 266
    .line 267
    invoke-static {p0, p1}, Lcb0;->e(Landroid/content/pm/PackageInfo;[Lf22;)Lf22;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    goto :goto_9

    .line 272
    :cond_16
    sget-object p1, Lq72;->a:[Lf22;

    .line 273
    .line 274
    aget-object p1, p1, v0

    .line 275
    .line 276
    filled-new-array {p1}, [Lf22;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-static {p0, p1}, Lcb0;->e(Landroid/content/pm/PackageInfo;[Lf22;)Lf22;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    :goto_9
    if-eqz p0, :cond_17

    .line 285
    .line 286
    :goto_a
    return v1

    .line 287
    :cond_17
    :goto_b
    return v0
.end method

.method public static varargs e(Landroid/content/pm/PackageInfo;[Lf22;)Lf22;
    .locals 3

    .line 1
    iget-object v0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    array-length v0, v0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_1

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_1
    new-instance v0, Ll32;

    .line 13
    .line 14
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aget-object p0, p0, v2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ll32;-><init>([B)V

    .line 24
    .line 25
    .line 26
    :goto_0
    array-length p0, p1

    .line 27
    if-ge v2, p0, :cond_3

    .line 28
    .line 29
    aget-object p0, p1, v2

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lf22;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    aget-object p0, p1, v2

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    :goto_1
    return-object v1
.end method


# virtual methods
.method public b(I)Z
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcb0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    move/from16 v2, p1

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x3

    .line 18
    if-eqz v2, :cond_f

    .line 19
    .line 20
    array-length v4, v2

    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    goto/16 :goto_b

    .line 24
    .line 25
    :cond_0
    const/4 v6, 0x0

    .line 26
    move v7, v6

    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-ge v7, v4, :cond_e

    .line 29
    .line 30
    aget-object v8, v2, v7

    .line 31
    .line 32
    const-string v0, "null pkg"

    .line 33
    .line 34
    if-nez v8, :cond_1

    .line 35
    .line 36
    invoke-static {v0}, Lke2;->h(Ljava/lang/String;)Lke2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v13, 0x0

    .line 41
    goto/16 :goto_a

    .line 42
    .line 43
    :cond_1
    iget-object v9, v1, Lcb0;->b:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v9, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v9

    .line 51
    if-nez v9, :cond_b

    .line 52
    .line 53
    sget-object v9, Le92;->a:Ljw1;

    .line 54
    .line 55
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    const/4 v10, 0x2

    .line 60
    const/4 v11, 0x1

    .line 61
    :try_start_0
    invoke-static {}, Le92;->a()V

    .line 62
    .line 63
    .line 64
    sget-object v12, Le92;->c:Lep1;

    .line 65
    .line 66
    check-cast v12, Lwn1;

    .line 67
    .line 68
    invoke-virtual {v12}, Lwn1;->I()Z

    .line 69
    .line 70
    .line 71
    move-result v12
    :try_end_0
    .catch Lfz; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 72
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 73
    .line 74
    .line 75
    if-eqz v12, :cond_5

    .line 76
    .line 77
    iget-object v0, v1, Lcb0;->a:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v0, Landroid/content/Context;

    .line 80
    .line 81
    invoke-static {v0}, Lbb0;->a(Landroid/content/Context;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    :try_start_1
    const-string v12, "module init: "

    .line 90
    .line 91
    sget-object v13, Le92;->e:Landroid/content/Context;

    .line 92
    .line 93
    invoke-static {v13}, Lbh;->h(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .line 95
    .line 96
    :try_start_2
    invoke-static {}, Le92;->a()V
    :try_end_2
    .catch Lfz; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    .line 98
    .line 99
    :try_start_3
    sget-object v12, Le92;->e:Landroid/content/Context;

    .line 100
    .line 101
    invoke-static {v12}, Lbh;->h(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    sget-object v12, Le92;->e:Landroid/content/Context;

    .line 105
    .line 106
    new-instance v13, Lkr0;

    .line 107
    .line 108
    invoke-direct {v13, v12}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v13}, Lkr0;->G(Landroid/os/IBinder;)Lid0;

    .line 112
    .line 113
    .line 114
    move-result-object v12

    .line 115
    invoke-static {v12}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    check-cast v12, Landroid/content/Context;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 120
    .line 121
    :try_start_4
    sget-object v13, Le92;->c:Lep1;

    .line 122
    .line 123
    check-cast v13, Lwn1;

    .line 124
    .line 125
    invoke-virtual {v13}, Lfl1;->F()Landroid/os/Parcel;

    .line 126
    .line 127
    .line 128
    move-result-object v14

    .line 129
    sget v15, Lev1;->a:I

    .line 130
    .line 131
    invoke-virtual {v14, v11}, Landroid/os/Parcel;->writeInt(I)V

    .line 132
    .line 133
    .line 134
    const/16 v15, 0x4f45

    .line 135
    .line 136
    invoke-static {v14, v15}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 137
    .line 138
    .line 139
    move-result v15

    .line 140
    invoke-static {v14, v11, v8}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const/4 v5, 0x4

    .line 144
    invoke-static {v14, v10, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v14, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 148
    .line 149
    .line 150
    invoke-static {v14, v3, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v14, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Lkr0;

    .line 157
    .line 158
    invoke-direct {v0, v12}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v14, v5, v0}, Lbe2;->C(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 162
    .line 163
    .line 164
    const/4 v0, 0x5

    .line 165
    invoke-static {v14, v0, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v14, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 169
    .line 170
    .line 171
    const/4 v0, 0x6

    .line 172
    invoke-static {v14, v0, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v14, v11}, Landroid/os/Parcel;->writeInt(I)V

    .line 176
    .line 177
    .line 178
    const/16 v10, 0x8

    .line 179
    .line 180
    invoke-static {v14, v10, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v14, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 184
    .line 185
    .line 186
    invoke-static {v14, v15}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v13, v14, v0}, Lfl1;->a(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    sget-object v10, Lcc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 194
    .line 195
    invoke-static {v0, v10}, Lev1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    check-cast v10, Lcc2;

    .line 200
    .line 201
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 202
    .line 203
    .line 204
    :try_start_5
    iget-boolean v0, v10, Lcc2;->j:Z

    .line 205
    .line 206
    if-eqz v0, :cond_2

    .line 207
    .line 208
    iget v0, v10, Lcc2;->m:I

    .line 209
    .line 210
    invoke-static {v0}, Lju1;->y(I)I

    .line 211
    .line 212
    .line 213
    new-instance v0, Lke2;

    .line 214
    .line 215
    const/4 v13, 0x0

    .line 216
    invoke-direct {v0, v11, v13, v13}, Lke2;-><init>(ZLjava/lang/String;Ljava/lang/Exception;)V

    .line 217
    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_2
    const/4 v13, 0x0

    .line 221
    iget-object v0, v10, Lcc2;->k:Ljava/lang/String;

    .line 222
    .line 223
    iget v11, v10, Lcc2;->l:I

    .line 224
    .line 225
    invoke-static {v11}, Lkp1;->k(I)I

    .line 226
    .line 227
    .line 228
    move-result v11

    .line 229
    if-ne v11, v5, :cond_3

    .line 230
    .line 231
    new-instance v5, Landroid/content/pm/PackageManager$NameNotFoundException;

    .line 232
    .line 233
    invoke-direct {v5}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>()V

    .line 234
    .line 235
    .line 236
    goto :goto_1

    .line 237
    :catchall_0
    move-exception v0

    .line 238
    goto :goto_3

    .line 239
    :cond_3
    move-object v5, v13

    .line 240
    :goto_1
    const-string v11, "error checking package certificate"

    .line 241
    .line 242
    if-nez v0, :cond_4

    .line 243
    .line 244
    move-object v0, v11

    .line 245
    :cond_4
    iget v11, v10, Lcc2;->m:I

    .line 246
    .line 247
    invoke-static {v11}, Lju1;->y(I)I

    .line 248
    .line 249
    .line 250
    iget v10, v10, Lcc2;->l:I

    .line 251
    .line 252
    invoke-static {v10}, Lkp1;->k(I)I

    .line 253
    .line 254
    .line 255
    new-instance v10, Lke2;

    .line 256
    .line 257
    invoke-direct {v10, v6, v0, v5}, Lke2;-><init>(ZLjava/lang/String;Ljava/lang/Exception;)V

    .line 258
    .line 259
    .line 260
    move-object v0, v10

    .line 261
    goto :goto_2

    .line 262
    :catch_0
    move-exception v0

    .line 263
    const/4 v13, 0x0

    .line 264
    const-string v5, "module call"

    .line 265
    .line 266
    invoke-static {v5, v0}, Lke2;->i(Ljava/lang/String;Ljava/lang/Exception;)Lke2;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    goto :goto_2

    .line 271
    :catch_1
    move-exception v0

    .line 272
    const/4 v13, 0x0

    .line 273
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    invoke-virtual {v12, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-static {v5, v0}, Lke2;->i(Ljava/lang/String;Ljava/lang/Exception;)Lke2;

    .line 286
    .line 287
    .line 288
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 289
    :goto_2
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_9

    .line 293
    .line 294
    :goto_3
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 295
    .line 296
    .line 297
    throw v0

    .line 298
    :cond_5
    const/4 v13, 0x0

    .line 299
    goto :goto_6

    .line 300
    :catchall_1
    move-exception v0

    .line 301
    goto :goto_4

    .line 302
    :catch_2
    const/4 v13, 0x0

    .line 303
    goto :goto_5

    .line 304
    :goto_4
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 305
    .line 306
    .line 307
    throw v0

    .line 308
    :goto_5
    invoke-static {v9}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 309
    .line 310
    .line 311
    :goto_6
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 312
    .line 313
    const/16 v9, 0x1c

    .line 314
    .line 315
    if-lt v5, v9, :cond_6

    .line 316
    .line 317
    const v5, 0x8000040

    .line 318
    .line 319
    .line 320
    goto :goto_7

    .line 321
    :cond_6
    const/16 v5, 0x40

    .line 322
    .line 323
    :goto_7
    :try_start_6
    iget-object v9, v1, Lcb0;->a:Ljava/lang/Object;

    .line 324
    .line 325
    check-cast v9, Landroid/content/Context;

    .line 326
    .line 327
    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 328
    .line 329
    .line 330
    move-result-object v9

    .line 331
    invoke-virtual {v9, v8, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 332
    .line 333
    .line 334
    move-result-object v5
    :try_end_6
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_6} :catch_3

    .line 335
    iget-object v9, v1, Lcb0;->a:Ljava/lang/Object;

    .line 336
    .line 337
    check-cast v9, Landroid/content/Context;

    .line 338
    .line 339
    invoke-static {v9}, Lbb0;->a(Landroid/content/Context;)Z

    .line 340
    .line 341
    .line 342
    move-result v9

    .line 343
    if-nez v5, :cond_7

    .line 344
    .line 345
    invoke-static {v0}, Lke2;->h(Ljava/lang/String;)Lke2;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    goto :goto_9

    .line 350
    :cond_7
    iget-object v0, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 351
    .line 352
    if-eqz v0, :cond_a

    .line 353
    .line 354
    array-length v0, v0

    .line 355
    if-eq v0, v11, :cond_8

    .line 356
    .line 357
    goto :goto_8

    .line 358
    :cond_8
    new-instance v0, Ll32;

    .line 359
    .line 360
    iget-object v12, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 361
    .line 362
    aget-object v12, v12, v6

    .line 363
    .line 364
    invoke-virtual {v12}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 365
    .line 366
    .line 367
    move-result-object v12

    .line 368
    invoke-direct {v0, v12}, Ll32;-><init>([B)V

    .line 369
    .line 370
    .line 371
    iget-object v12, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 372
    .line 373
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 374
    .line 375
    .line 376
    move-result-object v14

    .line 377
    :try_start_7
    invoke-static {v12, v0, v9, v6}, Le92;->b(Ljava/lang/String;Ll32;ZZ)Lke2;

    .line 378
    .line 379
    .line 380
    move-result-object v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 381
    invoke-static {v14}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 382
    .line 383
    .line 384
    iget-boolean v14, v9, Lke2;->j:Z

    .line 385
    .line 386
    if-eqz v14, :cond_9

    .line 387
    .line 388
    iget-object v5, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 389
    .line 390
    if-eqz v5, :cond_9

    .line 391
    .line 392
    iget v5, v5, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 393
    .line 394
    and-int/2addr v5, v10

    .line 395
    if-eqz v5, :cond_9

    .line 396
    .line 397
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 398
    .line 399
    .line 400
    move-result-object v5

    .line 401
    :try_start_8
    invoke-static {v12, v0, v6, v11}, Le92;->b(Ljava/lang/String;Ll32;ZZ)Lke2;

    .line 402
    .line 403
    .line 404
    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 405
    invoke-static {v5}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 406
    .line 407
    .line 408
    iget-boolean v0, v0, Lke2;->j:Z

    .line 409
    .line 410
    if-eqz v0, :cond_9

    .line 411
    .line 412
    const-string v0, "debuggable release cert app rejected"

    .line 413
    .line 414
    invoke-static {v0}, Lke2;->h(Ljava/lang/String;)Lke2;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    goto :goto_9

    .line 419
    :catchall_2
    move-exception v0

    .line 420
    invoke-static {v5}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 421
    .line 422
    .line 423
    throw v0

    .line 424
    :cond_9
    move-object v0, v9

    .line 425
    goto :goto_9

    .line 426
    :catchall_3
    move-exception v0

    .line 427
    invoke-static {v14}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 428
    .line 429
    .line 430
    throw v0

    .line 431
    :cond_a
    :goto_8
    const-string v0, "single cert required"

    .line 432
    .line 433
    invoke-static {v0}, Lke2;->h(Ljava/lang/String;)Lke2;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    :goto_9
    iget-boolean v5, v0, Lke2;->j:Z

    .line 438
    .line 439
    if-eqz v5, :cond_c

    .line 440
    .line 441
    iput-object v8, v1, Lcb0;->b:Ljava/lang/Object;

    .line 442
    .line 443
    goto :goto_a

    .line 444
    :catch_3
    move-exception v0

    .line 445
    const-string v5, "no pkg "

    .line 446
    .line 447
    invoke-virtual {v5, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v5

    .line 451
    invoke-static {v5, v0}, Lke2;->i(Ljava/lang/String;Ljava/lang/Exception;)Lke2;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    goto :goto_a

    .line 456
    :cond_b
    const/4 v13, 0x0

    .line 457
    sget-object v0, Lke2;->l:Lke2;

    .line 458
    .line 459
    :cond_c
    :goto_a
    iget-boolean v5, v0, Lke2;->j:Z

    .line 460
    .line 461
    if-eqz v5, :cond_d

    .line 462
    .line 463
    goto :goto_c

    .line 464
    :cond_d
    add-int/lit8 v7, v7, 0x1

    .line 465
    .line 466
    goto/16 :goto_0

    .line 467
    .line 468
    :cond_e
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 469
    .line 470
    .line 471
    goto :goto_c

    .line 472
    :cond_f
    :goto_b
    const-string v0, "no pkgs"

    .line 473
    .line 474
    invoke-static {v0}, Lke2;->h(Ljava/lang/String;)Lke2;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    :goto_c
    iget-boolean v1, v0, Lke2;->j:Z

    .line 479
    .line 480
    if-nez v1, :cond_11

    .line 481
    .line 482
    const-string v1, "GoogleCertificatesRslt"

    .line 483
    .line 484
    invoke-static {v1, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    if-eqz v1, :cond_11

    .line 489
    .line 490
    iget-object v1, v0, Lke2;->k:Ljava/lang/Object;

    .line 491
    .line 492
    check-cast v1, Ljava/lang/Throwable;

    .line 493
    .line 494
    if-eqz v1, :cond_10

    .line 495
    .line 496
    invoke-virtual {v0}, Lke2;->g()V

    .line 497
    .line 498
    .line 499
    goto :goto_d

    .line 500
    :cond_10
    invoke-virtual {v0}, Lke2;->g()V

    .line 501
    .line 502
    .line 503
    :cond_11
    :goto_d
    iget-boolean v0, v0, Lke2;->j:Z

    .line 504
    .line 505
    return v0
.end method

.method public c(Le52;)Lta2;
    .locals 8

    .line 1
    iget-object v0, p0, Lcb0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lu92;

    .line 4
    .line 5
    sget-object v1, Lta2;->i:Lu92;

    .line 6
    .line 7
    if-eq v0, v1, :cond_5

    .line 8
    .line 9
    sget-object v2, Lta2;->h:Lny0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v3, Ls72;

    .line 15
    .line 16
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    iput-boolean v4, v3, Ls72;->a:Z

    .line 21
    .line 22
    iget-object v5, v2, Lny0;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v5, Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    iget-object v6, p1, Le52;->b:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v7, v0, Lu92;->d:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v7, :cond_0

    .line 31
    .line 32
    iget-object v7, v0, Lu92;->a:Ln90;

    .line 33
    .line 34
    invoke-interface {v7, v6}, Ln90;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    move-object v7, v6

    .line 39
    check-cast v7, Ljava/lang/String;

    .line 40
    .line 41
    iput-object v7, v0, Lu92;->d:Ljava/lang/String;

    .line 42
    .line 43
    :cond_0
    new-instance v6, Loa2;

    .line 44
    .line 45
    invoke-direct {v6, p1, v0, v3}, Loa2;-><init>(Le52;Lu92;Ls72;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v7, v6}, Ljava/util/concurrent/ConcurrentHashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lw92;

    .line 53
    .line 54
    iget-boolean v3, v3, Ls72;->a:Z

    .line 55
    .line 56
    if-eqz v3, :cond_4

    .line 57
    .line 58
    iget-object p1, p1, Le52;->b:Landroid/content/Context;

    .line 59
    .line 60
    new-instance v3, Lny0;

    .line 61
    .line 62
    const/16 v5, 0x1b

    .line 63
    .line 64
    invoke-direct {v3, v5, v2}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    sget-object v2, Lub2;->b:Lny0;

    .line 68
    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    const-class v2, Lub2;

    .line 72
    .line 73
    monitor-enter v2

    .line 74
    :try_start_0
    sget-object v5, Lub2;->b:Lny0;

    .line 75
    .line 76
    if-nez v5, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    const-string v6, "com.google.android.gms"

    .line 83
    .line 84
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-nez v5, :cond_2

    .line 89
    .line 90
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 91
    .line 92
    const/16 v6, 0x21

    .line 93
    .line 94
    if-lt v5, v6, :cond_1

    .line 95
    .line 96
    new-instance v5, Lub2;

    .line 97
    .line 98
    invoke-direct {v5, v4}, Lub2;-><init>(I)V

    .line 99
    .line 100
    .line 101
    new-instance v4, Landroid/content/IntentFilter;

    .line 102
    .line 103
    const-string v6, "com.google.android.gms.phenotype.UPDATE"

    .line 104
    .line 105
    invoke-direct {v4, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v5, v4}, Lxi1;->b(Landroid/content/Context;Lub2;Landroid/content/IntentFilter;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    goto :goto_1

    .line 114
    :cond_1
    new-instance v5, Lub2;

    .line 115
    .line 116
    invoke-direct {v5, v4}, Lub2;-><init>(I)V

    .line 117
    .line 118
    .line 119
    new-instance v4, Landroid/content/IntentFilter;

    .line 120
    .line 121
    const-string v6, "com.google.android.gms.phenotype.UPDATE"

    .line 122
    .line 123
    invoke-direct {v4, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v5, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 127
    .line 128
    .line 129
    :cond_2
    :goto_0
    sput-object v3, Lub2;->b:Lny0;

    .line 130
    .line 131
    :cond_3
    monitor-exit v2

    .line 132
    goto :goto_2

    .line 133
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    throw p0

    .line 135
    :cond_4
    :goto_2
    iget-object p1, v0, Lw92;->a:Lta2;

    .line 136
    .line 137
    iput-object p1, p0, Lcb0;->a:Ljava/lang/Object;

    .line 138
    .line 139
    iput-object v1, p0, Lcb0;->b:Ljava/lang/Object;

    .line 140
    .line 141
    :cond_5
    iget-object p0, p0, Lcb0;->a:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p0, Lta2;

    .line 144
    .line 145
    return-object p0
.end method
