.class public final Ljz;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Llv1;

.field public static final c:Lnv1;

.field public static final d:Lkv1;

.field public static e:Ljava/lang/Boolean; = null

.field public static f:Ljava/lang/String; = null

.field public static g:Z = false

.field public static h:I = -0x1

.field public static i:Ljava/lang/Boolean;

.field public static final j:Ljava/lang/ThreadLocal;

.field public static final k:Lyu;

.field public static final l:Lmv1;

.field public static m:Lja2;

.field public static n:Ljb2;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Lyu;

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    invoke-direct {v0, v1}, Lyu;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ljz;->k:Lyu;

    .line 15
    .line 16
    new-instance v0, Lmv1;

    .line 17
    .line 18
    const/16 v1, 0x13

    .line 19
    .line 20
    invoke-direct {v0, v1}, Lmv1;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ljz;->l:Lmv1;

    .line 24
    .line 25
    new-instance v0, Llv1;

    .line 26
    .line 27
    const/16 v1, 0x19

    .line 28
    .line 29
    invoke-direct {v0, v1}, Llv1;-><init>(I)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ljz;->b:Llv1;

    .line 33
    .line 34
    new-instance v0, Lnv1;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Lnv1;-><init>(I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Ljz;->c:Lnv1;

    .line 40
    .line 41
    new-instance v0, Lkv1;

    .line 42
    .line 43
    const/16 v1, 0x1a

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lkv1;-><init>(I)V

    .line 46
    .line 47
    .line 48
    sput-object v0, Ljz;->d:Lkv1;

    .line 49
    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ljz;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)I
    .locals 5

    .line 1
    const-string v0, ".ModuleDescriptor"

    .line 2
    .line 3
    const-string v1, "com.google.android.gms.dynamite.descriptors."

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    add-int/lit8 v3, v3, 0x3d

    .line 19
    .line 20
    new-instance v4, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "MODULE_ID"

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "MODULE_VERSION"

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3, p1}, Lkp1;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/lit8 p0, p0, 0x32

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    add-int/lit8 p0, p0, 0x1

    .line 85
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 89
    .line 90
    .line 91
    return v2

    .line 92
    :catch_0
    move-exception p0

    .line 93
    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 95
    .line 96
    .line 97
    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    return p0

    .line 99
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "Failed to load module descriptor class: "

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :catch_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    new-instance p1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    add-int/lit8 p0, p0, 0x2d

    .line 120
    .line 121
    invoke-direct {p1, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 122
    .line 123
    .line 124
    :goto_1
    return v2
.end method

.method public static c(Landroid/content/Context;Liz;Ljava/lang/String;)Ljz;
    .locals 23

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
    const-string v0, "VersionPolicy returned invalid code:"

    .line 8
    .line 9
    const-string v4, "."

    .line 10
    .line 11
    const-string v5, " and remote version is "

    .line 12
    .line 13
    const-string v6, " found. Local version is "

    .line 14
    .line 15
    const-string v7, "No acceptable module "

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v8

    .line 21
    if-eqz v8, :cond_19

    .line 22
    .line 23
    sget-object v9, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 24
    .line 25
    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v10

    .line 29
    check-cast v10, Ln72;

    .line 30
    .line 31
    new-instance v11, Ln72;

    .line 32
    .line 33
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v9, v11}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    sget-object v12, Ljz;->k:Lyu;

    .line 40
    .line 41
    invoke-virtual {v12}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v13

    .line 45
    check-cast v13, Ljava/lang/Long;

    .line 46
    .line 47
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 48
    .line 49
    .line 50
    move-result-wide v14

    .line 51
    const-wide/16 v16, 0x0

    .line 52
    .line 53
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v18
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 57
    move-wide/from16 v20, v14

    .line 58
    .line 59
    :try_start_1
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v14

    .line 63
    invoke-virtual {v12, v14}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    sget-object v14, Ljz;->l:Lmv1;

    .line 67
    .line 68
    invoke-interface {v2, v1, v3, v14}, Liz;->b(Landroid/content/Context;Ljava/lang/String;Lgz;)Lhz;

    .line 69
    .line 70
    .line 71
    move-result-object v14

    .line 72
    iget v15, v14, Lhz;->a:I

    .line 73
    .line 74
    move/from16 v18, v15

    .line 75
    .line 76
    iget v15, v14, Lhz;->b:I

    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result v19

    .line 82
    add-int/lit8 v19, v19, 0x1a

    .line 83
    .line 84
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v18

    .line 88
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v18

    .line 92
    add-int v19, v19, v18

    .line 93
    .line 94
    add-int/lit8 v19, v19, 0x13

    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 97
    .line 98
    .line 99
    move-result v18

    .line 100
    add-int v19, v19, v18

    .line 101
    .line 102
    move/from16 v18, v15

    .line 103
    .line 104
    const/4 v15, 0x1

    .line 105
    add-int/lit8 v19, v19, 0x1

    .line 106
    .line 107
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v18

    .line 111
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    .line 112
    .line 113
    .line 114
    move-result v18

    .line 115
    add-int v15, v19, v18

    .line 116
    .line 117
    move-object/from16 v18, v4

    .line 118
    .line 119
    new-instance v4, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v4, v15}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 122
    .line 123
    .line 124
    iget v4, v14, Lhz;->c:I

    .line 125
    .line 126
    if-eqz v4, :cond_16

    .line 127
    .line 128
    const/4 v15, -0x1

    .line 129
    if-ne v4, v15, :cond_0

    .line 130
    .line 131
    iget v4, v14, Lhz;->a:I

    .line 132
    .line 133
    if-eqz v4, :cond_16

    .line 134
    .line 135
    move v4, v15

    .line 136
    :cond_0
    const/4 v15, 0x1

    .line 137
    goto :goto_0

    .line 138
    :catchall_0
    move-exception v0

    .line 139
    goto/16 :goto_c

    .line 140
    .line 141
    :goto_0
    if-ne v4, v15, :cond_1

    .line 142
    .line 143
    iget v15, v14, Lhz;->b:I

    .line 144
    .line 145
    if-eqz v15, :cond_16

    .line 146
    .line 147
    :cond_1
    const/4 v5, -0x1

    .line 148
    if-ne v4, v5, :cond_4

    .line 149
    .line 150
    const-string v0, "Selected local version of "

    .line 151
    .line 152
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    new-instance v0, Ljz;

    .line 156
    .line 157
    invoke-direct {v0, v8}, Ljz;-><init>(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    .line 159
    .line 160
    cmp-long v1, v20, v16

    .line 161
    .line 162
    if-nez v1, :cond_2

    .line 163
    .line 164
    invoke-virtual {v12}, Ljava/lang/ThreadLocal;->remove()V

    .line 165
    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_2
    invoke-virtual {v12, v13}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    :goto_1
    iget-object v1, v11, Ln72;->a:Landroid/database/Cursor;

    .line 172
    .line 173
    if-eqz v1, :cond_3

    .line 174
    .line 175
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 176
    .line 177
    .line 178
    :cond_3
    invoke-virtual {v9, v10}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    return-object v0

    .line 182
    :cond_4
    const/4 v15, 0x1

    .line 183
    if-ne v4, v15, :cond_15

    .line 184
    .line 185
    :try_start_2
    iget v0, v14, Lhz;->b:I
    :try_end_2
    .catch Lfz; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 186
    .line 187
    :try_start_3
    const-class v4, Ljz;

    .line 188
    .line 189
    monitor-enter v4
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lfz; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 190
    :try_start_4
    invoke-static {v1}, Ljz;->e(Landroid/content/Context;)Z

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    if-eqz v5, :cond_11

    .line 195
    .line 196
    sget-object v5, Ljz;->e:Ljava/lang/Boolean;

    .line 197
    .line 198
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 199
    if-eqz v5, :cond_10

    .line 200
    .line 201
    :try_start_5
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    const/4 v6, 0x2

    .line 206
    if-eqz v5, :cond_a

    .line 207
    .line 208
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    add-int/lit8 v5, v5, 0x28

    .line 213
    .line 214
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    add-int/2addr v5, v7

    .line 223
    new-instance v7, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 226
    .line 227
    .line 228
    monitor-enter v4
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lfz; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 229
    :try_start_6
    sget-object v5, Ljz;->n:Ljb2;

    .line 230
    .line 231
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 232
    if-eqz v5, :cond_9

    .line 233
    .line 234
    :try_start_7
    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    check-cast v7, Ln72;

    .line 239
    .line 240
    if-eqz v7, :cond_8

    .line 241
    .line 242
    iget-object v9, v7, Ln72;->a:Landroid/database/Cursor;

    .line 243
    .line 244
    if-eqz v9, :cond_8

    .line 245
    .line 246
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    iget-object v7, v7, Ln72;->a:Landroid/database/Cursor;

    .line 251
    .line 252
    new-instance v12, Lkr0;

    .line 253
    .line 254
    const/4 v15, 0x0

    .line 255
    invoke-direct {v12, v15}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    monitor-enter v4
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Lfz; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 259
    :try_start_8
    sget v12, Ljz;->h:I

    .line 260
    .line 261
    if-lt v12, v6, :cond_5

    .line 262
    .line 263
    const/4 v15, 0x1

    .line 264
    goto :goto_2

    .line 265
    :cond_5
    const/4 v15, 0x0

    .line 266
    :goto_2
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 267
    if-eqz v15, :cond_6

    .line 268
    .line 269
    :try_start_9
    new-instance v4, Lkr0;

    .line 270
    .line 271
    invoke-direct {v4, v9}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    new-instance v6, Lkr0;

    .line 275
    .line 276
    invoke-direct {v6, v7}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v5, v4, v3, v0, v6}, Ljb2;->J(Lkr0;Ljava/lang/String;ILkr0;)Lid0;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    goto :goto_3

    .line 284
    :catchall_1
    move-exception v0

    .line 285
    goto/16 :goto_6

    .line 286
    .line 287
    :catch_0
    move-exception v0

    .line 288
    goto/16 :goto_7

    .line 289
    .line 290
    :catch_1
    move-exception v0

    .line 291
    goto/16 :goto_8

    .line 292
    .line 293
    :cond_6
    new-instance v4, Lkr0;

    .line 294
    .line 295
    invoke-direct {v4, v9}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 296
    .line 297
    .line 298
    new-instance v6, Lkr0;

    .line 299
    .line 300
    invoke-direct {v6, v7}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v5, v4, v3, v0, v6}, Ljb2;->I(Lkr0;Ljava/lang/String;ILkr0;)Lid0;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    :goto_3
    invoke-static {v0}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Landroid/content/Context;

    .line 312
    .line 313
    if-eqz v0, :cond_7

    .line 314
    .line 315
    new-instance v4, Ljz;

    .line 316
    .line 317
    invoke-direct {v4, v0}, Ljz;-><init>(Landroid/content/Context;)V

    .line 318
    .line 319
    .line 320
    goto/16 :goto_a

    .line 321
    .line 322
    :cond_7
    new-instance v0, Lfz;

    .line 323
    .line 324
    const-string v4, "Failed to get module context"

    .line 325
    .line 326
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    throw v0
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Lfz; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 330
    :catchall_2
    move-exception v0

    .line 331
    :try_start_a
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 332
    :try_start_b
    throw v0

    .line 333
    :cond_8
    new-instance v0, Lfz;

    .line 334
    .line 335
    const-string v4, "No result cursor"

    .line 336
    .line 337
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    throw v0

    .line 341
    :cond_9
    new-instance v0, Lfz;

    .line 342
    .line 343
    const-string v4, "DynamiteLoaderV2 was not cached."

    .line 344
    .line 345
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    throw v0
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_b} :catch_1
    .catch Lfz; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 349
    :catchall_3
    move-exception v0

    .line 350
    :try_start_c
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 351
    :try_start_d
    throw v0

    .line 352
    :cond_a
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 353
    .line 354
    .line 355
    move-result v4

    .line 356
    add-int/lit8 v4, v4, 0x28

    .line 357
    .line 358
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v5

    .line 362
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    add-int/2addr v4, v5

    .line 367
    new-instance v5, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 370
    .line 371
    .line 372
    invoke-static {v1}, Ljz;->h(Landroid/content/Context;)Lja2;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    if-eqz v4, :cond_f

    .line 377
    .line 378
    invoke-virtual {v4}, Lfl1;->F()Landroid/os/Parcel;

    .line 379
    .line 380
    .line 381
    move-result-object v5

    .line 382
    const/4 v7, 0x6

    .line 383
    invoke-virtual {v4, v5, v7}, Lfl1;->a(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-virtual {v5}, Landroid/os/Parcel;->readInt()I

    .line 388
    .line 389
    .line 390
    move-result v7

    .line 391
    invoke-virtual {v5}, Landroid/os/Parcel;->recycle()V

    .line 392
    .line 393
    .line 394
    const/4 v5, 0x3

    .line 395
    if-lt v7, v5, :cond_c

    .line 396
    .line 397
    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v5

    .line 401
    check-cast v5, Ln72;

    .line 402
    .line 403
    if-eqz v5, :cond_b

    .line 404
    .line 405
    new-instance v6, Lkr0;

    .line 406
    .line 407
    invoke-direct {v6, v1}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 408
    .line 409
    .line 410
    iget-object v5, v5, Ln72;->a:Landroid/database/Cursor;

    .line 411
    .line 412
    new-instance v7, Lkr0;

    .line 413
    .line 414
    invoke-direct {v7, v5}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 415
    .line 416
    .line 417
    invoke-virtual {v4, v6, v3, v0, v7}, Lja2;->L(Lkr0;Ljava/lang/String;ILkr0;)Lid0;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    goto :goto_4

    .line 422
    :cond_b
    new-instance v0, Lfz;

    .line 423
    .line 424
    const-string v4, "No cached result cursor holder"

    .line 425
    .line 426
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    throw v0

    .line 430
    :cond_c
    if-ne v7, v6, :cond_d

    .line 431
    .line 432
    new-instance v5, Lkr0;

    .line 433
    .line 434
    invoke-direct {v5, v1}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v4, v5, v3, v0}, Lja2;->J(Lkr0;Ljava/lang/String;I)Lid0;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    goto :goto_4

    .line 442
    :cond_d
    new-instance v5, Lkr0;

    .line 443
    .line 444
    invoke-direct {v5, v1}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {v4, v5, v3, v0}, Lja2;->I(Lkr0;Ljava/lang/String;I)Lid0;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    :goto_4
    invoke-static {v0}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    if-eqz v0, :cond_e

    .line 456
    .line 457
    new-instance v4, Ljz;

    .line 458
    .line 459
    check-cast v0, Landroid/content/Context;

    .line 460
    .line 461
    invoke-direct {v4, v0}, Ljz;-><init>(Landroid/content/Context;)V

    .line 462
    .line 463
    .line 464
    goto :goto_a

    .line 465
    :cond_e
    new-instance v0, Lfz;

    .line 466
    .line 467
    const-string v4, "Failed to load remote module."

    .line 468
    .line 469
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    throw v0

    .line 473
    :cond_f
    new-instance v0, Lfz;

    .line 474
    .line 475
    const-string v4, "Failed to create IDynamiteLoader."

    .line 476
    .line 477
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    throw v0

    .line 481
    :cond_10
    new-instance v0, Lfz;

    .line 482
    .line 483
    const-string v4, "Failed to determine which loading route to use."

    .line 484
    .line 485
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    throw v0
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_1
    .catch Lfz; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 489
    :catchall_4
    move-exception v0

    .line 490
    goto :goto_5

    .line 491
    :cond_11
    :try_start_e
    new-instance v0, Lfz;

    .line 492
    .line 493
    const-string v5, "Remote loading disabled"

    .line 494
    .line 495
    invoke-direct {v0, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    throw v0

    .line 499
    :goto_5
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 500
    :try_start_f
    throw v0
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_f} :catch_1
    .catch Lfz; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 501
    :goto_6
    :try_start_10
    new-instance v4, Lfz;

    .line 502
    .line 503
    const-string v5, "Failed to load remote module."

    .line 504
    .line 505
    invoke-direct {v4, v5, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 506
    .line 507
    .line 508
    throw v4

    .line 509
    :catch_2
    move-exception v0

    .line 510
    goto :goto_9

    .line 511
    :goto_7
    throw v0

    .line 512
    :goto_8
    new-instance v4, Lfz;

    .line 513
    .line 514
    const-string v5, "Failed to load remote module."

    .line 515
    .line 516
    invoke-direct {v4, v5, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 517
    .line 518
    .line 519
    throw v4
    :try_end_10
    .catch Lfz; {:try_start_10 .. :try_end_10} :catch_2
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 520
    :goto_9
    :try_start_11
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object v4

    .line 524
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v4

    .line 528
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 529
    .line 530
    .line 531
    move-result v4

    .line 532
    add-int/lit8 v4, v4, 0x1e

    .line 533
    .line 534
    new-instance v5, Ljava/lang/StringBuilder;

    .line 535
    .line 536
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 537
    .line 538
    .line 539
    iget v4, v14, Lhz;->a:I

    .line 540
    .line 541
    if-eqz v4, :cond_14

    .line 542
    .line 543
    new-instance v5, Lz40;

    .line 544
    .line 545
    invoke-direct {v5, v4}, Lz40;-><init>(I)V

    .line 546
    .line 547
    .line 548
    invoke-interface {v2, v1, v3, v5}, Liz;->b(Landroid/content/Context;Ljava/lang/String;Lgz;)Lhz;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    iget v1, v1, Lhz;->c:I

    .line 553
    .line 554
    const/4 v5, -0x1

    .line 555
    if-ne v1, v5, :cond_14

    .line 556
    .line 557
    const-string v0, "Selected local version of "

    .line 558
    .line 559
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    new-instance v4, Ljz;

    .line 563
    .line 564
    invoke-direct {v4, v8}, Ljz;-><init>(Landroid/content/Context;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 565
    .line 566
    .line 567
    :goto_a
    cmp-long v0, v20, v16

    .line 568
    .line 569
    if-nez v0, :cond_12

    .line 570
    .line 571
    sget-object v0, Ljz;->k:Lyu;

    .line 572
    .line 573
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 574
    .line 575
    .line 576
    goto :goto_b

    .line 577
    :cond_12
    sget-object v0, Ljz;->k:Lyu;

    .line 578
    .line 579
    invoke-virtual {v0, v13}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 580
    .line 581
    .line 582
    :goto_b
    iget-object v0, v11, Ln72;->a:Landroid/database/Cursor;

    .line 583
    .line 584
    if-eqz v0, :cond_13

    .line 585
    .line 586
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 587
    .line 588
    .line 589
    :cond_13
    sget-object v0, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 590
    .line 591
    invoke-virtual {v0, v10}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 592
    .line 593
    .line 594
    return-object v4

    .line 595
    :cond_14
    :try_start_12
    new-instance v1, Lfz;

    .line 596
    .line 597
    const-string v2, "Remote load failed. No local fallback found."

    .line 598
    .line 599
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 600
    .line 601
    .line 602
    throw v1

    .line 603
    :cond_15
    new-instance v1, Lfz;

    .line 604
    .line 605
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v2

    .line 609
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 610
    .line 611
    .line 612
    move-result v2

    .line 613
    add-int/lit8 v2, v2, 0x24

    .line 614
    .line 615
    new-instance v3, Ljava/lang/StringBuilder;

    .line 616
    .line 617
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 618
    .line 619
    .line 620
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    throw v1

    .line 634
    :cond_16
    new-instance v0, Lfz;

    .line 635
    .line 636
    iget v1, v14, Lhz;->a:I

    .line 637
    .line 638
    iget v2, v14, Lhz;->b:I

    .line 639
    .line 640
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 641
    .line 642
    .line 643
    move-result v4

    .line 644
    add-int/lit8 v4, v4, 0x2e

    .line 645
    .line 646
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v8

    .line 650
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 651
    .line 652
    .line 653
    move-result v8

    .line 654
    add-int/2addr v4, v8

    .line 655
    add-int/lit8 v4, v4, 0x17

    .line 656
    .line 657
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object v8

    .line 661
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 662
    .line 663
    .line 664
    move-result v8

    .line 665
    add-int/2addr v4, v8

    .line 666
    const/16 v22, 0x1

    .line 667
    .line 668
    add-int/lit8 v4, v4, 0x1

    .line 669
    .line 670
    new-instance v8, Ljava/lang/StringBuilder;

    .line 671
    .line 672
    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 673
    .line 674
    .line 675
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 679
    .line 680
    .line 681
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 688
    .line 689
    .line 690
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    move-object/from16 v1, v18

    .line 694
    .line 695
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 703
    .line 704
    .line 705
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 706
    :catchall_5
    move-exception v0

    .line 707
    move-wide/from16 v20, v14

    .line 708
    .line 709
    :goto_c
    cmp-long v1, v20, v16

    .line 710
    .line 711
    if-nez v1, :cond_17

    .line 712
    .line 713
    sget-object v1, Ljz;->k:Lyu;

    .line 714
    .line 715
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 716
    .line 717
    .line 718
    goto :goto_d

    .line 719
    :cond_17
    sget-object v1, Ljz;->k:Lyu;

    .line 720
    .line 721
    invoke-virtual {v1, v13}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 722
    .line 723
    .line 724
    :goto_d
    iget-object v1, v11, Ln72;->a:Landroid/database/Cursor;

    .line 725
    .line 726
    if-eqz v1, :cond_18

    .line 727
    .line 728
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 729
    .line 730
    .line 731
    :cond_18
    sget-object v1, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 732
    .line 733
    invoke-virtual {v1, v10}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 734
    .line 735
    .line 736
    throw v0

    .line 737
    :cond_19
    new-instance v0, Lfz;

    .line 738
    .line 739
    const-string v1, "null application Context"

    .line 740
    .line 741
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 742
    .line 743
    .line 744
    throw v0
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;Z)I
    .locals 11

    .line 1
    :try_start_0
    const-class v1, Ljz;

    .line 2
    .line 3
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 4
    :try_start_1
    sget-object v0, Ljz;->e:Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    if-nez v0, :cond_9

    .line 10
    .line 11
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-class v5, Lcom/google/android/gms/dynamite/DynamiteModule$DynamiteLoaderClassLoader;

    .line 20
    .line 21
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-virtual {v0, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v5, "sClassLoader"

    .line 30
    .line 31
    invoke-virtual {v0, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    monitor-enter v5
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 40
    :try_start_3
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Ljava/lang/ClassLoader;

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    if-ne v6, v7, :cond_0

    .line 51
    .line 52
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 53
    .line 54
    goto/16 :goto_3

    .line 55
    .line 56
    :catchall_0
    move-exception v0

    .line 57
    goto/16 :goto_4

    .line 58
    .line 59
    :cond_0
    if-eqz v6, :cond_1

    .line 60
    .line 61
    :try_start_4
    invoke-static {v6}, Ljz;->g(Ljava/lang/ClassLoader;)V
    :try_end_4
    .catch Lfz; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    .line 63
    .line 64
    :catch_0
    :try_start_5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 65
    .line 66
    goto/16 :goto_3

    .line 67
    .line 68
    :cond_1
    invoke-static {p0}, Ljz;->e(Landroid/content/Context;)Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-nez v6, :cond_2

    .line 73
    .line 74
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 75
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 76
    return v4

    .line 77
    :catchall_1
    move-exception v0

    .line 78
    move-object p1, v0

    .line 79
    goto/16 :goto_12

    .line 80
    .line 81
    :cond_2
    :try_start_7
    sget-boolean v6, Ljz;->g:Z

    .line 82
    .line 83
    if-nez v6, :cond_8

    .line 84
    .line 85
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {v6, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 91
    if-eqz v7, :cond_3

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    :try_start_8
    invoke-static {p0, p1, p2, v2}, Ljz;->f(Landroid/content/Context;Ljava/lang/String;ZZ)I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    sget-object v8, Ljz;->f:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v8, :cond_7

    .line 101
    .line 102
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-eqz v8, :cond_4

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    invoke-static {}, Lju1;->z()Ljava/lang/ClassLoader;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    if-eqz v8, :cond_5

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 117
    .line 118
    const/16 v9, 0x1d

    .line 119
    .line 120
    if-lt v8, v9, :cond_6

    .line 121
    .line 122
    invoke-static {}, Lez;->b()V

    .line 123
    .line 124
    .line 125
    sget-object v8, Ljz;->f:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v8}, Lbh;->h(Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    invoke-static {v9, v8}, Lez;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Ldalvik/system/DelegateLastClassLoader;

    .line 135
    .line 136
    .line 137
    move-result-object v8

    .line 138
    goto :goto_0

    .line 139
    :cond_6
    new-instance v8, Lcw1;

    .line 140
    .line 141
    sget-object v9, Ljz;->f:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v9}, Lbh;->h(Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 147
    .line 148
    .line 149
    move-result-object v10

    .line 150
    invoke-direct {v8, v9, v10}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 151
    .line 152
    .line 153
    :goto_0
    invoke-static {v8}, Ljz;->g(Ljava/lang/ClassLoader;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v3, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    sput-object v6, Ljz;->e:Ljava/lang/Boolean;
    :try_end_8
    .catch Lfz; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 160
    .line 161
    :try_start_9
    monitor-exit v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 162
    :try_start_a
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 163
    return v7

    .line 164
    :cond_7
    :goto_1
    :try_start_b
    monitor-exit v5
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 165
    :try_start_c
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 166
    return v7

    .line 167
    :catch_1
    :try_start_d
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    invoke-virtual {v0, v3, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_8
    :goto_2
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {v0, v3, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 185
    .line 186
    :goto_3
    monitor-exit v5

    .line 187
    goto :goto_6

    .line 188
    :goto_4
    monitor-exit v5
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 189
    :try_start_e
    throw v0
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_e} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_e .. :try_end_e} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 190
    :catch_2
    move-exception v0

    .line 191
    goto :goto_5

    .line 192
    :catch_3
    move-exception v0

    .line 193
    goto :goto_5

    .line 194
    :catch_4
    move-exception v0

    .line 195
    :goto_5
    :try_start_f
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    add-int/lit8 v0, v0, 0x1e

    .line 204
    .line 205
    new-instance v5, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 208
    .line 209
    .line 210
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 211
    .line 212
    :goto_6
    sput-object v0, Ljz;->e:Ljava/lang/Boolean;

    .line 213
    .line 214
    :cond_9
    monitor-exit v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 215
    :try_start_10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 216
    .line 217
    .line 218
    move-result v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 219
    if-eqz v0, :cond_a

    .line 220
    .line 221
    :try_start_11
    invoke-static {p0, p1, p2, v4}, Ljz;->f(Landroid/content/Context;Ljava/lang/String;ZZ)I

    .line 222
    .line 223
    .line 224
    move-result p0
    :try_end_11
    .catch Lfz; {:try_start_11 .. :try_end_11} :catch_5
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 225
    return p0

    .line 226
    :catchall_2
    move-exception v0

    .line 227
    move-object p1, v0

    .line 228
    goto/16 :goto_13

    .line 229
    .line 230
    :catch_5
    move-exception v0

    .line 231
    move-object p1, v0

    .line 232
    :try_start_12
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    add-int/lit8 p1, p1, 0x2a

    .line 245
    .line 246
    new-instance p2, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 249
    .line 250
    .line 251
    return v4

    .line 252
    :cond_a
    invoke-static {p0}, Ljz;->h(Landroid/content/Context;)Lja2;

    .line 253
    .line 254
    .line 255
    move-result-object v5
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 256
    if-nez v5, :cond_b

    .line 257
    .line 258
    goto/16 :goto_10

    .line 259
    .line 260
    :cond_b
    :try_start_13
    invoke-virtual {v5}, Lfl1;->F()Landroid/os/Parcel;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    const/4 v1, 0x6

    .line 265
    invoke-virtual {v5, v0, v1}, Lfl1;->a(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 274
    .line 275
    .line 276
    const/4 v0, 0x3

    .line 277
    if-lt v1, v0, :cond_12

    .line 278
    .line 279
    sget-object v0, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    check-cast v1, Ln72;

    .line 286
    .line 287
    if-eqz v1, :cond_c

    .line 288
    .line 289
    iget-object v1, v1, Ln72;->a:Landroid/database/Cursor;

    .line 290
    .line 291
    if-eqz v1, :cond_c

    .line 292
    .line 293
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 294
    .line 295
    .line 296
    move-result v4

    .line 297
    goto/16 :goto_10

    .line 298
    .line 299
    :catch_6
    move-exception v0

    .line 300
    move-object p1, v0

    .line 301
    goto/16 :goto_e

    .line 302
    .line 303
    :cond_c
    new-instance v6, Lkr0;

    .line 304
    .line 305
    invoke-direct {v6, p0}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    sget-object v1, Ljz;->k:Lyu;

    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    check-cast v1, Ljava/lang/Long;

    .line 315
    .line 316
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 317
    .line 318
    .line 319
    move-result-wide v9

    .line 320
    move-object v7, p1

    .line 321
    move v8, p2

    .line 322
    invoke-virtual/range {v5 .. v10}, Lja2;->K(Lkr0;Ljava/lang/String;ZJ)Lid0;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    check-cast p1, Landroid/database/Cursor;
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_13} :catch_6
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    .line 331
    .line 332
    if-eqz p1, :cond_11

    .line 333
    .line 334
    :try_start_14
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 335
    .line 336
    .line 337
    move-result p2

    .line 338
    if-nez p2, :cond_d

    .line 339
    .line 340
    goto :goto_c

    .line 341
    :cond_d
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 342
    .line 343
    .line 344
    move-result p2

    .line 345
    if-lez p2, :cond_f

    .line 346
    .line 347
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    check-cast v0, Ln72;

    .line 352
    .line 353
    if-eqz v0, :cond_e

    .line 354
    .line 355
    iget-object v1, v0, Ln72;->a:Landroid/database/Cursor;

    .line 356
    .line 357
    if-nez v1, :cond_e

    .line 358
    .line 359
    iput-object p1, v0, Ln72;->a:Landroid/database/Cursor;
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_14} :catch_7
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    .line 360
    .line 361
    goto :goto_7

    .line 362
    :cond_e
    move v2, v4

    .line 363
    :goto_7
    if-eqz v2, :cond_f

    .line 364
    .line 365
    goto :goto_8

    .line 366
    :cond_f
    move-object v3, p1

    .line 367
    :goto_8
    if-eqz v3, :cond_10

    .line 368
    .line 369
    :try_start_15
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 370
    .line 371
    .line 372
    :cond_10
    :goto_9
    move v4, p2

    .line 373
    goto/16 :goto_10

    .line 374
    .line 375
    :catchall_3
    move-exception v0

    .line 376
    move-object p2, v0

    .line 377
    goto :goto_a

    .line 378
    :catch_7
    move-exception v0

    .line 379
    move-object p2, v0

    .line 380
    goto :goto_b

    .line 381
    :goto_a
    move-object v3, p1

    .line 382
    goto/16 :goto_11

    .line 383
    .line 384
    :goto_b
    move-object v3, p1

    .line 385
    goto :goto_f

    .line 386
    :cond_11
    :goto_c
    if-eqz p1, :cond_14

    .line 387
    .line 388
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    .line 389
    .line 390
    .line 391
    goto :goto_10

    .line 392
    :cond_12
    move-object v7, p1

    .line 393
    move v8, p2

    .line 394
    const/4 p1, 0x2

    .line 395
    if-ne v1, p1, :cond_13

    .line 396
    .line 397
    :try_start_16
    new-instance p1, Lkr0;

    .line 398
    .line 399
    invoke-direct {p1, p0}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v5}, Lfl1;->F()Landroid/os/Parcel;

    .line 403
    .line 404
    .line 405
    move-result-object p2

    .line 406
    invoke-static {p2, p1}, Lev1;->b(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p2, v7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {p2, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 413
    .line 414
    .line 415
    const/4 p1, 0x5

    .line 416
    invoke-virtual {v5, p2, p1}, Lfl1;->a(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 421
    .line 422
    .line 423
    move-result p2

    .line 424
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 425
    .line 426
    .line 427
    goto :goto_9

    .line 428
    :cond_13
    new-instance p1, Lkr0;

    .line 429
    .line 430
    invoke-direct {p1, p0}, Lkr0;-><init>(Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v5}, Lfl1;->F()Landroid/os/Parcel;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    invoke-static {p2, p1}, Lev1;->b(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p2, v7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {p2, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 444
    .line 445
    .line 446
    invoke-virtual {v5, p2, v0}, Lfl1;->a(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 451
    .line 452
    .line 453
    move-result p2

    .line 454
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_16 .. :try_end_16} :catch_6
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    .line 455
    .line 456
    .line 457
    goto :goto_9

    .line 458
    :goto_d
    move-object p2, p1

    .line 459
    goto :goto_11

    .line 460
    :goto_e
    move-object p2, p1

    .line 461
    :goto_f
    :try_start_17
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 470
    .line 471
    .line 472
    move-result p1

    .line 473
    add-int/lit8 p1, p1, 0x2a

    .line 474
    .line 475
    new-instance p2, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(I)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_4

    .line 478
    .line 479
    .line 480
    if-eqz v3, :cond_14

    .line 481
    .line 482
    :try_start_18
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 483
    .line 484
    .line 485
    :cond_14
    :goto_10
    return v4

    .line 486
    :catchall_4
    move-exception v0

    .line 487
    move-object p1, v0

    .line 488
    goto :goto_d

    .line 489
    :goto_11
    if-eqz v3, :cond_15

    .line 490
    .line 491
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 492
    .line 493
    .line 494
    :cond_15
    throw p2
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_2

    .line 495
    :goto_12
    :try_start_19
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_1

    .line 496
    :try_start_1a
    throw p1
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_2

    .line 497
    :goto_13
    :try_start_1b
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_8

    .line 498
    .line 499
    .line 500
    :catch_8
    throw p1
.end method

.method public static e(Landroid/content/Context;)Z
    .locals 5

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v1, Ljz;->i:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :goto_0
    return v2

    .line 21
    :cond_1
    sget-object v0, Ljz;->i:Ljava/lang/Boolean;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-nez v0, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    const/16 v4, 0x1d

    .line 33
    .line 34
    if-lt v3, v4, :cond_2

    .line 35
    .line 36
    const/high16 v3, 0x10000000

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    move v3, v1

    .line 40
    :goto_1
    const-string v4, "com.google.android.gms.chimera"

    .line 41
    .line 42
    invoke-virtual {v0, v4, v3}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v3, Lwa0;->b:Lwa0;

    .line 47
    .line 48
    const v4, 0x989680

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, p0, v4}, Lwa0;->b(Landroid/content/Context;I)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    const-string p0, "com.google.android.gms"

    .line 60
    .line 61
    iget-object v3, v0, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    move v1, v2

    .line 70
    :cond_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sput-object p0, Ljz;->i:Ljava/lang/Boolean;

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    iget-object p0, v0, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 79
    .line 80
    if-eqz p0, :cond_4

    .line 81
    .line 82
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 83
    .line 84
    and-int/lit16 p0, p0, 0x81

    .line 85
    .line 86
    if-nez p0, :cond_4

    .line 87
    .line 88
    sput-boolean v2, Ljz;->g:Z

    .line 89
    .line 90
    :cond_4
    return v1
.end method

.method public static f(Landroid/content/Context;Ljava/lang/String;ZZ)I
    .locals 14

    .line 1
    const-string v1, "V2 version check failed: "

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    sget-object v0, Ljz;->k:Lyu;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Long;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    const-string v0, "api_force_staging"

    .line 17
    .line 18
    const-string v5, "api"

    .line 19
    .line 20
    const/4 v6, 0x1

    .line 21
    move/from16 v7, p2

    .line 22
    .line 23
    if-eq v6, v7, :cond_0

    .line 24
    .line 25
    move-object v0, v5

    .line 26
    :cond_0
    new-instance v5, Landroid/net/Uri$Builder;

    .line 27
    .line 28
    invoke-direct {v5}, Landroid/net/Uri$Builder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v7, "content"

    .line 32
    .line 33
    invoke-virtual {v5, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-string v7, "com.google.android.gms.chimera"

    .line 38
    .line 39
    invoke-virtual {v5, v7}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v5, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v5, "requestStartUptime"

    .line 52
    .line 53
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v0, v5, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v8}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 70
    .line 71
    .line 72
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 73
    const/4 p0, 0x2

    .line 74
    const/4 v3, 0x0

    .line 75
    if-nez v7, :cond_1

    .line 76
    .line 77
    :goto_0
    move-object v8, v2

    .line 78
    goto/16 :goto_7

    .line 79
    .line 80
    :cond_1
    const/4 v11, 0x0

    .line 81
    const/4 v12, 0x0

    .line 82
    const/4 v9, 0x0

    .line 83
    const/4 v10, 0x0

    .line 84
    :try_start_1
    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentProviderClient;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 85
    .line 86
    .line 87
    move-result-object v4
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    if-nez v4, :cond_2

    .line 89
    .line 90
    :catch_0
    :try_start_2
    invoke-virtual {v7}, Landroid/content/ContentProviderClient;->release()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    new-instance v8, Landroid/database/MatrixCursor;

    .line 103
    .line 104
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    invoke-direct {v8, v9, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    move v9, v3

    .line 112
    :goto_1
    if-ge v9, v0, :cond_a

    .line 113
    .line 114
    invoke-interface {v4, v9}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 115
    .line 116
    .line 117
    move-result v10

    .line 118
    if-eqz v10, :cond_9

    .line 119
    .line 120
    new-array v10, v5, [Ljava/lang/Object;

    .line 121
    .line 122
    move v11, v3

    .line 123
    :goto_2
    if-ge v11, v5, :cond_8

    .line 124
    .line 125
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getType(I)I

    .line 126
    .line 127
    .line 128
    move-result v12

    .line 129
    if-eqz v12, :cond_7

    .line 130
    .line 131
    if-eq v12, v6, :cond_6

    .line 132
    .line 133
    if-eq v12, p0, :cond_5

    .line 134
    .line 135
    const/4 v13, 0x3

    .line 136
    if-eq v12, v13, :cond_4

    .line 137
    .line 138
    const/4 v13, 0x4

    .line 139
    if-ne v12, v13, :cond_3

    .line 140
    .line 141
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getBlob(I)[B

    .line 142
    .line 143
    .line 144
    move-result-object v12

    .line 145
    aput-object v12, v10, v11

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :catchall_0
    move-exception v0

    .line 149
    move-object v5, v0

    .line 150
    goto :goto_4

    .line 151
    :cond_3
    new-instance v0, Landroid/os/RemoteException;

    .line 152
    .line 153
    const-string v5, "Unknown column type"

    .line 154
    .line 155
    invoke-direct {v0, v5}, Landroid/os/RemoteException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw v0

    .line 159
    :cond_4
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    aput-object v12, v10, v11

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_5
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getDouble(I)D

    .line 167
    .line 168
    .line 169
    move-result-wide v12

    .line 170
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 171
    .line 172
    .line 173
    move-result-object v12

    .line 174
    aput-object v12, v10, v11

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_6
    invoke-interface {v4, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 178
    .line 179
    .line 180
    move-result-wide v12

    .line 181
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 182
    .line 183
    .line 184
    move-result-object v12

    .line 185
    aput-object v12, v10, v11

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_7
    aput-object v2, v10, v11

    .line 189
    .line 190
    :goto_3
    add-int/lit8 v11, v11, 0x1

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_8
    invoke-virtual {v8, v10}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    add-int/lit8 v9, v9, 0x1

    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_9
    new-instance v0, Landroid/os/RemoteException;

    .line 200
    .line 201
    const-string v5, "Cursor read incomplete (ContentProvider dead?)"

    .line 202
    .line 203
    invoke-direct {v0, v5}, Landroid/os/RemoteException;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 207
    :cond_a
    :try_start_4
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 208
    .line 209
    .line 210
    :try_start_5
    invoke-virtual {v7}, Landroid/content/ContentProviderClient;->release()Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 211
    .line 212
    .line 213
    goto :goto_7

    .line 214
    :catchall_1
    move-exception v0

    .line 215
    move-object p0, v0

    .line 216
    goto :goto_6

    .line 217
    :goto_4
    :try_start_6
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 218
    .line 219
    .line 220
    goto :goto_5

    .line 221
    :catchall_2
    move-exception v0

    .line 222
    :try_start_7
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 223
    .line 224
    .line 225
    :goto_5
    throw v5
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 226
    :goto_6
    :try_start_8
    invoke-virtual {v7}, Landroid/content/ContentProviderClient;->release()Z

    .line 227
    .line 228
    .line 229
    throw p0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 230
    :goto_7
    if-eqz v8, :cond_13

    .line 231
    .line 232
    :try_start_9
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-eqz v0, :cond_13

    .line 237
    .line 238
    invoke-interface {v8, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-lez v0, :cond_f

    .line 243
    .line 244
    const-class v4, Ljz;

    .line 245
    .line 246
    monitor-enter v4
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 247
    :try_start_a
    invoke-interface {v8, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    sput-object p0, Ljz;->f:Ljava/lang/String;

    .line 252
    .line 253
    const-string p0, "loaderVersion"

    .line 254
    .line 255
    invoke-interface {v8, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-ltz p0, :cond_b

    .line 260
    .line 261
    invoke-interface {v8, p0}, Landroid/database/Cursor;->getInt(I)I

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    sput p0, Ljz;->h:I

    .line 266
    .line 267
    goto :goto_8

    .line 268
    :catchall_3
    move-exception v0

    .line 269
    move-object p0, v0

    .line 270
    goto :goto_c

    .line 271
    :cond_b
    :goto_8
    const-string p0, "disableStandaloneDynamiteLoader2"

    .line 272
    .line 273
    invoke-interface {v8, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    if-ltz p0, :cond_d

    .line 278
    .line 279
    invoke-interface {v8, p0}, Landroid/database/Cursor;->getInt(I)I

    .line 280
    .line 281
    .line 282
    move-result p0

    .line 283
    if-eqz p0, :cond_c

    .line 284
    .line 285
    move p0, v6

    .line 286
    goto :goto_9

    .line 287
    :cond_c
    move p0, v3

    .line 288
    :goto_9
    sput-boolean p0, Ljz;->g:Z

    .line 289
    .line 290
    goto :goto_a

    .line 291
    :cond_d
    move p0, v3

    .line 292
    :goto_a
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 293
    :try_start_b
    sget-object v4, Ljz;->j:Ljava/lang/ThreadLocal;

    .line 294
    .line 295
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    check-cast v4, Ln72;

    .line 300
    .line 301
    if-eqz v4, :cond_e

    .line 302
    .line 303
    iget-object v5, v4, Ln72;->a:Landroid/database/Cursor;

    .line 304
    .line 305
    if-nez v5, :cond_e

    .line 306
    .line 307
    iput-object v8, v4, Ln72;->a:Landroid/database/Cursor;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 308
    .line 309
    goto :goto_b

    .line 310
    :cond_e
    move v6, v3

    .line 311
    :goto_b
    move v3, p0

    .line 312
    if-eqz v6, :cond_f

    .line 313
    .line 314
    goto :goto_d

    .line 315
    :cond_f
    move-object v2, v8

    .line 316
    goto :goto_d

    .line 317
    :goto_c
    :try_start_c
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 318
    :try_start_d
    throw p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 319
    :catchall_4
    move-exception v0

    .line 320
    move-object p0, v0

    .line 321
    goto :goto_f

    .line 322
    :catch_1
    move-exception v0

    .line 323
    move-object p0, v0

    .line 324
    goto :goto_10

    .line 325
    :goto_d
    if-eqz p3, :cond_11

    .line 326
    .line 327
    if-nez v3, :cond_10

    .line 328
    .line 329
    goto :goto_e

    .line 330
    :cond_10
    :try_start_e
    new-instance p0, Lfz;

    .line 331
    .line 332
    const-string v0, "forcing fallback to container DynamiteLoader impl"

    .line 333
    .line 334
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    throw p0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 338
    :catchall_5
    move-exception v0

    .line 339
    move-object p0, v0

    .line 340
    goto :goto_12

    .line 341
    :catch_2
    move-exception v0

    .line 342
    move-object p0, v0

    .line 343
    goto :goto_11

    .line 344
    :cond_11
    :goto_e
    if-eqz v2, :cond_12

    .line 345
    .line 346
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 347
    .line 348
    .line 349
    :cond_12
    return v0

    .line 350
    :cond_13
    :try_start_f
    new-instance p0, Lfz;

    .line 351
    .line 352
    const-string v0, "Failed to connect to dynamite module ContentResolver."

    .line 353
    .line 354
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    throw p0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 358
    :goto_f
    move-object v2, v8

    .line 359
    goto :goto_12

    .line 360
    :goto_10
    move-object v2, v8

    .line 361
    :goto_11
    :try_start_10
    instance-of v0, p0, Lfz;

    .line 362
    .line 363
    if-nez v0, :cond_14

    .line 364
    .line 365
    new-instance v0, Lfz;

    .line 366
    .line 367
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v4

    .line 375
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 376
    .line 377
    .line 378
    move-result v4

    .line 379
    add-int/lit8 v4, v4, 0x19

    .line 380
    .line 381
    new-instance v5, Ljava/lang/StringBuilder;

    .line 382
    .line 383
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 397
    .line 398
    .line 399
    throw v0

    .line 400
    :cond_14
    throw p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    .line 401
    :goto_12
    if-eqz v2, :cond_15

    .line 402
    .line 403
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 404
    .line 405
    .line 406
    :cond_15
    throw p0
.end method

.method public static g(Ljava/lang/ClassLoader;)V
    .locals 3

    .line 1
    const-string v0, "com.google.android.gms.dynamite.IDynamiteLoaderV2"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "com.google.android.gms.dynamiteloader.DynamiteLoaderV2"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Landroid/os/IBinder;

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v2, v1, Ljb2;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    check-cast v1, Ljb2;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    new-instance v1, Ljb2;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-direct {v1, p0, v0, v2}, Lfl1;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    :goto_0
    sput-object v1, Ljz;->n:Ljb2;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    new-instance v0, Lfz;

    .line 45
    .line 46
    const-string v1, "Failed to instantiate dynamite loader"

    .line 47
    .line 48
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    throw v0
.end method

.method public static h(Landroid/content/Context;)Lja2;
    .locals 5

    .line 1
    const-class v0, Ljz;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ljz;->m:Lja2;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    return-object v1

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_2

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    :try_start_1
    const-string v2, "com.google.android.gms"

    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v2, "com.google.android.gms.chimera.container.DynamiteLoaderImpl"

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Landroid/os/IBinder;

    .line 35
    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    move-object v2, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const-string v2, "com.google.android.gms.dynamite.IDynamiteLoader"

    .line 41
    .line 42
    invoke-interface {p0, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    instance-of v3, v2, Lja2;

    .line 47
    .line 48
    if-eqz v3, :cond_2

    .line 49
    .line 50
    check-cast v2, Lja2;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    new-instance v2, Lja2;

    .line 56
    .line 57
    const-string v3, "com.google.android.gms.dynamite.IDynamiteLoader"

    .line 58
    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-direct {v2, p0, v3, v4}, Lfl1;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    :goto_0
    if-eqz v2, :cond_3

    .line 64
    .line 65
    sput-object v2, Ljz;->m:Lja2;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    :try_start_2
    monitor-exit v0

    .line 68
    return-object v2

    .line 69
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    add-int/lit8 p0, p0, 0x2d

    .line 82
    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 86
    .line 87
    .line 88
    :cond_3
    monitor-exit v0

    .line 89
    return-object v1

    .line 90
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    throw p0
.end method


# virtual methods
.method public final b(Ljava/lang/String;)Landroid/os/IBinder;
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Ljz;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/os/IBinder;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :catch_1
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :catch_2
    move-exception p0

    .line 23
    :goto_0
    new-instance v0, Lfz;

    .line 24
    .line 25
    const-string v1, "Failed to instantiate module class: "

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {v0, p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method
