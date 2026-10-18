.class public abstract Lc40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ljava/util/List;

.field public static b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v5, "google_spoof.js"

    .line 2
    .line 3
    const-string v6, "playlist_sort.js"

    .line 4
    .line 5
    const-string v0, "spotify_bridge.js"

    .line 6
    .line 7
    const-string v1, "css_hacks.css"

    .line 8
    .line 9
    const-string v2, "classic_login.js"

    .line 10
    .line 11
    const-string v3, "desktop_spoof.js"

    .line 12
    .line 13
    const-string v4, "facebook_consent.js"

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lc40;->a:Ljava/util/List;

    .line 24
    .line 25
    return-void
.end method

.method public static a(Landroid/content/ContextWrapper;)V
    .locals 12

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "hotfixes"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Lu30;->c()Lu30;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-class v1, Lyz0;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lyz0;

    .line 32
    .line 33
    const-string v1, "firebase"

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lyz0;->b(Ljava/lang/String;)Lv40;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    new-instance v1, Lez0;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v2, Lez0;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 50
    .line 51
    .line 52
    sget-object v3, Lc40;->a:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    :catch_0
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_9

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    const/4 v5, 0x6

    .line 74
    const-string v6, "."

    .line 75
    .line 76
    invoke-static {v4, v6, v5}, Lda1;->H(Ljava/lang/String;Ljava/lang/String;I)I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    const/4 v6, -0x1

    .line 81
    if-ne v5, v6, :cond_2

    .line 82
    .line 83
    move-object v5, v4

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const/4 v6, 0x0

    .line 86
    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    :goto_1
    const-string v6, "hotfix_"

    .line 91
    .line 92
    invoke-virtual {v6, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    iget-object v6, p0, Lv40;->f:Lfn;

    .line 97
    .line 98
    iget-object v7, v6, Lfn;->c:Lxm;

    .line 99
    .line 100
    invoke-static {v7, v5}, Lfn;->c(Lxm;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    const-string v9, ""

    .line 105
    .line 106
    if-eqz v8, :cond_3

    .line 107
    .line 108
    invoke-virtual {v7}, Lxm;->c()Lzm;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    invoke-virtual {v6, v5, v7}, Lfn;->a(Ljava/lang/String;Lzm;)V

    .line 113
    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_3
    iget-object v6, v6, Lfn;->d:Lxm;

    .line 117
    .line 118
    invoke-static {v6, v5}, Lfn;->c(Lxm;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    if-eqz v8, :cond_4

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_4
    move-object v8, v9

    .line 126
    :goto_2
    new-instance v5, Ljava/io/File;

    .line 127
    .line 128
    invoke-direct {v5, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    if-eqz v6, :cond_5

    .line 136
    .line 137
    sget-object v6, Lyj;->a:Ljava/nio/charset/Charset;

    .line 138
    .line 139
    invoke-static {v5, v6}, Ldl1;->n(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    :cond_5
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    const-string v7, ".js"

    .line 148
    .line 149
    const-string v10, ".css"

    .line 150
    .line 151
    const/4 v11, 0x1

    .line 152
    if-lez v6, :cond_7

    .line 153
    .line 154
    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    if-nez v6, :cond_1

    .line 159
    .line 160
    :try_start_0
    sget-object v6, Lyj;->a:Ljava/nio/charset/Charset;

    .line 161
    .line 162
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 163
    .line 164
    .line 165
    new-instance v9, Ljava/io/FileOutputStream;

    .line 166
    .line 167
    invoke-direct {v9, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    .line 170
    :try_start_1
    invoke-static {v9, v8, v6}, Ldl1;->s(Ljava/io/FileOutputStream;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    .line 172
    .line 173
    :try_start_2
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 174
    .line 175
    .line 176
    sget-object v5, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 177
    .line 178
    invoke-virtual {v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    if-eqz v5, :cond_6

    .line 186
    .line 187
    iput-boolean v11, v1, Lez0;->j:Z

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_6
    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    if-eqz v4, :cond_1

    .line 196
    .line 197
    iput-boolean v11, v2, Lez0;->j:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :catchall_0
    move-exception v4

    .line 202
    :try_start_3
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 203
    :catchall_1
    move-exception v5

    .line 204
    :try_start_4
    invoke-static {v9, v4}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    throw v5
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 208
    :cond_7
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 209
    .line 210
    .line 211
    move-result v6

    .line 212
    if-eqz v6, :cond_1

    .line 213
    .line 214
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 215
    .line 216
    .line 217
    sget-object v5, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 218
    .line 219
    invoke-virtual {v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v4, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result v5

    .line 226
    if-eqz v5, :cond_8

    .line 227
    .line 228
    iput-boolean v11, v1, Lez0;->j:Z

    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :cond_8
    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 233
    .line 234
    .line 235
    move-result v4

    .line 236
    if-eqz v4, :cond_1

    .line 237
    .line 238
    iput-boolean v11, v2, Lez0;->j:Z

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :cond_9
    iget-boolean p0, v1, Lez0;->j:Z

    .line 243
    .line 244
    if-nez p0, :cond_a

    .line 245
    .line 246
    iget-boolean p0, v2, Lez0;->j:Z

    .line 247
    .line 248
    if-eqz p0, :cond_b

    .line 249
    .line 250
    :cond_a
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 251
    .line 252
    if-eqz p0, :cond_b

    .line 253
    .line 254
    new-instance v0, Lo6;

    .line 255
    .line 256
    const/16 v3, 0x9

    .line 257
    .line 258
    invoke-direct {v0, v1, v3, v2}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 262
    .line 263
    .line 264
    :cond_b
    return-void
.end method

.method public static b(Landroid/content/ContextWrapper;)V
    .locals 6

    .line 1
    :try_start_0
    invoke-static {}, Lu30;->c()Lu30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lyz0;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lyz0;

    .line 12
    .line 13
    const-string v1, "firebase"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lyz0;->b(Ljava/lang/String;)Lv40;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    new-instance v1, Lc50;

    .line 23
    .line 24
    invoke-direct {v1}, Lc50;-><init>()V

    .line 25
    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    const-wide/16 v4, 0x7080

    .line 30
    .line 31
    cmp-long v2, v4, v2

    .line 32
    .line 33
    if-ltz v2, :cond_0

    .line 34
    .line 35
    iput-wide v4, v1, Lc50;->b:J

    .line 36
    .line 37
    new-instance v2, Lc50;

    .line 38
    .line 39
    invoke-direct {v2, v1}, Lc50;-><init>(Lc50;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, v0, Lv40;->b:Ljava/util/concurrent/Executor;

    .line 43
    .line 44
    new-instance v3, Lwm;

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    invoke-direct {v3, v0, v4, v2}, Lwm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v3}, Lbe2;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Ljd2;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Lkm;

    .line 55
    .line 56
    const/4 v3, 0x5

    .line 57
    invoke-direct {v2, v0, v3, p0}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljd2;->b(Lwr0;)V

    .line 61
    .line 62
    .line 63
    sget-boolean v1, Lc40;->b:Z

    .line 64
    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    new-instance v1, Lb40;

    .line 68
    .line 69
    invoke-direct {v1, v0, p0}, Lb40;-><init>(Lv40;Landroid/content/ContextWrapper;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, v0, Lv40;->h:Ls7;

    .line 73
    .line 74
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :try_start_1
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 78
    .line 79
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ls7;->e()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    .line 84
    .line 85
    :try_start_2
    monitor-exit p0

    .line 86
    sput-boolean v4, Lc40;->b:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 87
    .line 88
    return-void

    .line 89
    :catchall_0
    move-exception v0

    .line 90
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    :try_start_4
    throw v0

    .line 92
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 93
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v1, "Minimum interval between fetches has to be a non-negative number. "

    .line 97
    .line 98
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, " is an invalid argument"

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 117
    :catch_0
    :cond_1
    return-void
.end method
