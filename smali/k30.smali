.class public final Lk30;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lqk;


# instance fields
.field public final a:Ljava/io/File;

.field public final b:Lm41;

.field public final c:Lef0;

.field public final d:Lg30;

.field public final e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final f:Lzo0;


# direct methods
.method public constructor <init>(Ljava/io/File;Lm41;Lef0;Lg30;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lk30;->a:Ljava/io/File;

    .line 11
    .line 12
    iput-object p2, p0, Lk30;->b:Lm41;

    .line 13
    .line 14
    iput-object p3, p0, Lk30;->c:Lef0;

    .line 15
    .line 16
    iput-object p4, p0, Lk30;->d:Lg30;

    .line 17
    .line 18
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lk30;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    invoke-static {}, Lbv;->a()Lzo0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lk30;->f:Lzo0;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(Lhu;Lkq;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p2, Li30;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Li30;

    .line 7
    .line 8
    iget v1, v0, Li30;->r:I

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
    iput v1, v0, Li30;->r:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Li30;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Li30;-><init>(Lk30;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Li30;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Li30;->r:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-boolean p0, v0, Li30;->o:Z

    .line 36
    .line 37
    iget-object p1, v0, Li30;->n:Le30;

    .line 38
    .line 39
    iget-object v0, v0, Li30;->m:Lk30;

    .line 40
    .line 41
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catchall_0
    move-exception p2

    .line 46
    move-object v6, p2

    .line 47
    move p2, p0

    .line 48
    move-object p0, v0

    .line 49
    move-object v0, v6

    .line 50
    goto :goto_3

    .line 51
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 52
    .line 53
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v3

    .line 57
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lk30;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_7

    .line 67
    .line 68
    iget-object p2, p0, Lk30;->f:Lzo0;

    .line 69
    .line 70
    invoke-virtual {p2}, Lzo0;->e()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    :try_start_1
    new-instance v1, Le30;

    .line 75
    .line 76
    iget-object v4, p0, Lk30;->a:Ljava/io/File;

    .line 77
    .line 78
    iget-object v5, p0, Lk30;->b:Lm41;

    .line 79
    .line 80
    invoke-direct {v1, v4, v5}, Le30;-><init>(Ljava/io/File;Lm41;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 81
    .line 82
    .line 83
    :try_start_2
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iput-object p0, v0, Li30;->m:Lk30;

    .line 88
    .line 89
    iput-object v1, v0, Li30;->n:Le30;

    .line 90
    .line 91
    iput-boolean p2, v0, Li30;->o:Z

    .line 92
    .line 93
    iput v2, v0, Li30;->r:I

    .line 94
    .line 95
    invoke-virtual {p1, v1, v4, v0}, Lhu;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 99
    sget-object v0, Lar;->j:Lar;

    .line 100
    .line 101
    if-ne p1, v0, :cond_3

    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_3
    move-object v0, p0

    .line 105
    move p0, p2

    .line 106
    move-object p2, p1

    .line 107
    move-object p1, v1

    .line 108
    :goto_1
    :try_start_3
    invoke-interface {p1}, Lqk;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 109
    .line 110
    .line 111
    move-object p1, v3

    .line 112
    goto :goto_2

    .line 113
    :catchall_1
    move-exception p1

    .line 114
    :goto_2
    if-nez p1, :cond_5

    .line 115
    .line 116
    if-eqz p0, :cond_4

    .line 117
    .line 118
    iget-object p0, v0, Lk30;->f:Lzo0;

    .line 119
    .line 120
    invoke-virtual {p0, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_4
    return-object p2

    .line 124
    :cond_5
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 125
    :catchall_2
    move-exception p1

    .line 126
    move p2, p0

    .line 127
    move-object p0, v0

    .line 128
    goto :goto_5

    .line 129
    :catchall_3
    move-exception p1

    .line 130
    move-object v0, p1

    .line 131
    move-object p1, v1

    .line 132
    :goto_3
    :try_start_5
    invoke-interface {p1}, Lqk;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :catchall_4
    move-exception p1

    .line 137
    :try_start_6
    invoke-static {v0, p1}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    :goto_4
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 141
    :catchall_5
    move-exception p1

    .line 142
    :goto_5
    if-eqz p2, :cond_6

    .line 143
    .line 144
    iget-object p0, p0, Lk30;->f:Lzo0;

    .line 145
    .line 146
    invoke-virtual {p0, v3}, Lzo0;->f(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    throw p1

    .line 150
    :cond_7
    const-string p0, "StorageConnection has already been disposed."

    .line 151
    .line 152
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return-object v3
.end method

.method public final b(Lvu;Lkq;)Ljava/lang/Object;
    .locals 9

    .line 1
    const-string v0, "Unable to rename "

    .line 2
    .line 3
    instance-of v1, p2, Lj30;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    move-object v1, p2

    .line 8
    check-cast v1, Lj30;

    .line 9
    .line 10
    iget v2, v1, Lj30;->s:I

    .line 11
    .line 12
    const/high16 v3, -0x80000000

    .line 13
    .line 14
    and-int v4, v2, v3

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    sub-int/2addr v2, v3

    .line 19
    iput v2, v1, Lj30;->s:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v1, Lj30;

    .line 23
    .line 24
    invoke-direct {v1, p0, p2}, Lj30;-><init>(Lk30;Lkq;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p2, v1, Lj30;->q:Ljava/lang/Object;

    .line 28
    .line 29
    iget v2, v1, Lj30;->s:I

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x0

    .line 34
    sget-object v6, Lar;->j:Lar;

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    if-eq v2, v4, :cond_2

    .line 39
    .line 40
    if-ne v2, v3, :cond_1

    .line 41
    .line 42
    iget-object p0, v1, Lj30;->p:Lo30;

    .line 43
    .line 44
    iget-object p1, v1, Lj30;->o:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, Ljava/io/File;

    .line 47
    .line 48
    iget-object v2, v1, Lj30;->n:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v2, Lzo0;

    .line 51
    .line 52
    iget-object v1, v1, Lj30;->m:Lk30;

    .line 53
    .line 54
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    goto/16 :goto_4

    .line 58
    .line 59
    :catchall_0
    move-exception p2

    .line 60
    goto/16 :goto_8

    .line 61
    .line 62
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 63
    .line 64
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-object v5

    .line 68
    :cond_2
    iget-object p0, v1, Lj30;->o:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p0, Lzo0;

    .line 71
    .line 72
    iget-object p1, v1, Lj30;->n:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p1, Lf90;

    .line 75
    .line 76
    iget-object v2, v1, Lj30;->m:Lk30;

    .line 77
    .line 78
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    move-object v8, v2

    .line 82
    move-object v2, p0

    .line 83
    move-object p0, v8

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lk30;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-nez p2, :cond_d

    .line 95
    .line 96
    iget-object p2, p0, Lk30;->a:Ljava/io/File;

    .line 97
    .line 98
    invoke-virtual {p2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    if-eqz v2, :cond_5

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_4

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    const-string p0, "Unable to create parent directories of "

    .line 119
    .line 120
    invoke-static {p2, p0}, Lz0;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-object v5

    .line 124
    :cond_5
    :goto_1
    iput-object p0, v1, Lj30;->m:Lk30;

    .line 125
    .line 126
    iput-object p1, v1, Lj30;->n:Ljava/lang/Object;

    .line 127
    .line 128
    iget-object p2, p0, Lk30;->f:Lzo0;

    .line 129
    .line 130
    iput-object p2, v1, Lj30;->o:Ljava/lang/Object;

    .line 131
    .line 132
    iput v4, v1, Lj30;->s:I

    .line 133
    .line 134
    invoke-virtual {p2, v1}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    if-ne v2, v6, :cond_6

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_6
    move-object v2, p2

    .line 142
    :goto_2
    :try_start_1
    new-instance p2, Ljava/io/File;

    .line 143
    .line 144
    new-instance v4, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    iget-object v7, p0, Lk30;->a:Ljava/io/File;

    .line 150
    .line 151
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v7, ".tmp"

    .line 159
    .line 160
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-direct {p2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 168
    .line 169
    .line 170
    :try_start_2
    new-instance v4, Lo30;

    .line 171
    .line 172
    iget-object v7, p0, Lk30;->b:Lm41;

    .line 173
    .line 174
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    invoke-direct {v4, p2, v7}, Le30;-><init>(Ljava/io/File;Lm41;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 178
    .line 179
    .line 180
    :try_start_3
    iput-object p0, v1, Lj30;->m:Lk30;

    .line 181
    .line 182
    iput-object v2, v1, Lj30;->n:Ljava/lang/Object;

    .line 183
    .line 184
    iput-object p2, v1, Lj30;->o:Ljava/lang/Object;

    .line 185
    .line 186
    iput-object v4, v1, Lj30;->p:Lo30;

    .line 187
    .line 188
    iput v3, v1, Lj30;->s:I

    .line 189
    .line 190
    invoke-interface {p1, v4, v1}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 194
    if-ne p1, v6, :cond_7

    .line 195
    .line 196
    :goto_3
    return-object v6

    .line 197
    :cond_7
    move-object v1, p0

    .line 198
    move-object p1, p2

    .line 199
    move-object p0, v4

    .line 200
    :goto_4
    :try_start_4
    invoke-interface {p0}, Lqk;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 201
    .line 202
    .line 203
    move-object p0, v5

    .line 204
    goto :goto_5

    .line 205
    :catchall_1
    move-exception p0

    .line 206
    :goto_5
    if-nez p0, :cond_b

    .line 207
    .line 208
    :try_start_5
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    if-eqz p0, :cond_a

    .line 213
    .line 214
    iget-object p0, v1, Lk30;->a:Ljava/io/File;

    .line 215
    .line 216
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 217
    .line 218
    const/16 v3, 0x1a

    .line 219
    .line 220
    if-lt p2, v3, :cond_8

    .line 221
    .line 222
    invoke-static {p1, p0}, Lv5;->a(Ljava/io/File;Ljava/io/File;)Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    goto :goto_6

    .line 227
    :cond_8
    invoke-virtual {p1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    :goto_6
    if-eqz p0, :cond_9

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_9
    new-instance p0, Ljava/io/IOException;

    .line 235
    .line 236
    new-instance p2, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v0, " to "

    .line 245
    .line 246
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    iget-object v0, v1, Lk30;->a:Ljava/io/File;

    .line 250
    .line 251
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    const-string v0, ". This likely means that there are multiple instances of DataStore for this file. Ensure that you are only creating a single instance of datastore for this file."

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    throw p0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 267
    :catchall_2
    move-exception p0

    .line 268
    goto :goto_b

    .line 269
    :catch_0
    move-exception p0

    .line 270
    move-object p2, p1

    .line 271
    goto :goto_a

    .line 272
    :cond_a
    :goto_7
    invoke-virtual {v2, v5}, Lzo0;->f(Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    sget-object p0, Lwe1;->a:Lwe1;

    .line 276
    .line 277
    return-object p0

    .line 278
    :cond_b
    :try_start_6
    throw p0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 279
    :catchall_3
    move-exception p0

    .line 280
    move-object p1, p2

    .line 281
    move-object p2, p0

    .line 282
    move-object p0, v4

    .line 283
    :goto_8
    :try_start_7
    invoke-interface {p0}, Lqk;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 284
    .line 285
    .line 286
    goto :goto_9

    .line 287
    :catchall_4
    move-exception p0

    .line 288
    :try_start_8
    invoke-static {p2, p0}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 289
    .line 290
    .line 291
    :goto_9
    throw p2
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 292
    :catch_1
    move-exception p0

    .line 293
    :goto_a
    :try_start_9
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 294
    .line 295
    .line 296
    move-result p1

    .line 297
    if-eqz p1, :cond_c

    .line 298
    .line 299
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 300
    .line 301
    .line 302
    :cond_c
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 303
    :goto_b
    invoke-virtual {v2, v5}, Lzo0;->f(Ljava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    throw p0

    .line 307
    :cond_d
    const-string p0, "StorageConnection has already been disposed."

    .line 308
    .line 309
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    return-object v5
.end method

.method public final close()V
    .locals 2

    .line 1
    iget-object v0, p0, Lk30;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lk30;->d:Lg30;

    .line 8
    .line 9
    invoke-virtual {p0}, Lg30;->a()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method
