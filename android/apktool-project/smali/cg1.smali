.class public final Lcg1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static volatile b:Lhs0;

.field public static final c:Ltb0;

.field public static final d:Ltb0;


# instance fields
.field public final synthetic a:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ltb0;

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ltb0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcg1;->c:Ltb0;

    .line 9
    .line 10
    new-instance v0, Ltb0;

    .line 11
    .line 12
    const/16 v1, 0x15

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ltb0;-><init>(I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcg1;->d:Ltb0;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcg1;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static A([BIJI)I
    .locals 2

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p4, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p4, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p2, p3}, Lmf1;->e([BJ)B

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    add-long/2addr p2, v0

    .line 16
    invoke-static {p0, p2, p3}, Lmf1;->e([BJ)B

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p1, p4, p0}, Lgg1;->c(III)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_1
    invoke-static {p0, p2, p3}, Lmf1;->e([BJ)B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p1, p0}, Lgg1;->b(II)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    sget-object p0, Lgg1;->a:Lcg1;

    .line 41
    .line 42
    const/16 p0, -0xc

    .line 43
    .line 44
    if-le p1, p0, :cond_3

    .line 45
    .line 46
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_3
    return p1
.end method

.method public static B(Landroid/os/Parcel;)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-char v2, v0

    .line 10
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/16 v4, 0x4f45

    .line 15
    .line 16
    if-ne v2, v4, :cond_1

    .line 17
    .line 18
    add-int/2addr v1, v3

    .line 19
    if-lt v1, v3, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/os/Parcel;->dataSize()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-gt v1, v0, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    new-instance v0, Ls21;

    .line 29
    .line 30
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    add-int/lit8 v2, v2, 0x20

    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    add-int/2addr v2, v4

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 52
    .line 53
    .line 54
    const-string v2, "Size read is invalid start="

    .line 55
    .line 56
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v2, " end="

    .line 63
    .line 64
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-direct {v0, v1, p0}, Ls21;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 75
    .line 76
    .line 77
    throw v0

    .line 78
    :cond_1
    new-instance v1, Ls21;

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v2, "Expected object header. Got 0x"

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-direct {v1, v0, p0}, Ls21;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 95
    .line 96
    .line 97
    throw v1
.end method

.method public static C(I)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p0, :cond_4

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v1, :cond_2

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    if-eq p0, v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x5

    .line 18
    return p0

    .line 19
    :cond_1
    return v1

    .line 20
    :cond_2
    return v0

    .line 21
    :cond_3
    return v1

    .line 22
    :cond_4
    return v0
.end method

.method public static D(Landroid/content/Context;)Lhs0;
    .locals 13

    .line 1
    sget-object v0, Lcg1;->b:Lhs0;

    .line 2
    .line 3
    if-nez v0, :cond_c

    .line 4
    .line 5
    const-class v1, Lcg1;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    sget-object v0, Lcg1;->b:Lhs0;

    .line 9
    .line 10
    if-nez v0, :cond_b

    .line 11
    .line 12
    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v2, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v3, Lz42;->a:Lda;

    .line 17
    .line 18
    const-string v3, "eng"

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    const-string v3, "userdebug"

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto/16 :goto_b

    .line 37
    .line 38
    :cond_0
    :goto_0
    const-string v0, "dev-keys"

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    const-string v0, "test-keys"

    .line 47
    .line 48
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    sget-object p0, Lh;->j:Lh;

    .line 56
    .line 57
    move-object v0, p0

    .line 58
    goto/16 :goto_8

    .line 59
    .line 60
    :cond_2
    :goto_1
    invoke-virtual {p0}, Landroid/content/Context;->isDeviceProtectedStorage()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    :cond_3
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    .line 71
    .line 72
    .line 73
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :try_start_1
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskWrites()Landroid/os/StrictMode$ThreadPolicy;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    :try_start_2
    new-instance v3, Ljava/io/File;

    .line 79
    .line 80
    const-string v4, "phenotype_hermetic"

    .line 81
    .line 82
    invoke-virtual {p0, v4, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    const-string v5, "overrides.txt"

    .line 87
    .line 88
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 89
    .line 90
    .line 91
    :try_start_3
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_4

    .line 96
    .line 97
    new-instance v4, Lxu0;

    .line 98
    .line 99
    invoke-direct {v4, v3}, Lxu0;-><init>(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    sget-object v4, Lh;->j:Lh;

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :catchall_1
    move-exception p0

    .line 107
    goto/16 :goto_9

    .line 108
    .line 109
    :catch_0
    sget-object v4, Lh;->j:Lh;

    .line 110
    .line 111
    :goto_2
    invoke-virtual {v4}, Lhs0;->b()Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_a

    .line 116
    .line 117
    invoke-virtual {v4}, Lhs0;->a()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Ljava/io/File;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 122
    .line 123
    :try_start_4
    new-instance v4, Ljava/io/BufferedReader;

    .line 124
    .line 125
    new-instance v5, Ljava/io/InputStreamReader;

    .line 126
    .line 127
    new-instance v6, Ljava/io/FileInputStream;

    .line 128
    .line 129
    invoke-direct {v6, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 130
    .line 131
    .line 132
    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 136
    .line 137
    .line 138
    :try_start_5
    new-instance v5, Lu71;

    .line 139
    .line 140
    invoke-direct {v5}, Lu71;-><init>()V

    .line 141
    .line 142
    .line 143
    new-instance v6, Ljava/util/HashMap;

    .line 144
    .line 145
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 146
    .line 147
    .line 148
    :goto_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    if-eqz v7, :cond_9

    .line 153
    .line 154
    const-string v8, " "

    .line 155
    .line 156
    const/4 v9, 0x3

    .line 157
    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v8

    .line 161
    array-length v10, v8

    .line 162
    if-eq v10, v9, :cond_5

    .line 163
    .line 164
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    add-int/lit8 v7, v7, 0x9

    .line 169
    .line 170
    new-instance v8, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :catchall_2
    move-exception p0

    .line 177
    goto/16 :goto_4

    .line 178
    .line 179
    :cond_5
    aget-object v7, v8, v2

    .line 180
    .line 181
    new-instance v9, Ljava/lang/String;

    .line 182
    .line 183
    invoke-direct {v9, v7}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    const/4 v7, 0x1

    .line 187
    aget-object v7, v8, v7

    .line 188
    .line 189
    new-instance v10, Ljava/lang/String;

    .line 190
    .line 191
    invoke-direct {v10, v7}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-static {v10}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    const/4 v10, 0x2

    .line 199
    aget-object v11, v8, v10

    .line 200
    .line 201
    invoke-virtual {v6, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v11

    .line 205
    check-cast v11, Ljava/lang/String;

    .line 206
    .line 207
    if-nez v11, :cond_7

    .line 208
    .line 209
    aget-object v8, v8, v10

    .line 210
    .line 211
    new-instance v10, Ljava/lang/String;

    .line 212
    .line 213
    invoke-direct {v10, v8}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v10}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v11

    .line 220
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 221
    .line 222
    .line 223
    move-result v8

    .line 224
    const/16 v12, 0x400

    .line 225
    .line 226
    if-lt v8, v12, :cond_6

    .line 227
    .line 228
    if-ne v11, v10, :cond_7

    .line 229
    .line 230
    :cond_6
    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    :cond_7
    const/4 v8, 0x0

    .line 234
    invoke-virtual {v5, v9, v8}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    check-cast v8, Lu71;

    .line 239
    .line 240
    if-nez v8, :cond_8

    .line 241
    .line 242
    new-instance v8, Lu71;

    .line 243
    .line 244
    invoke-direct {v8}, Lu71;-><init>()V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5, v9, v8}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    :cond_8
    invoke-virtual {v8, v7, v11}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_9
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    add-int/lit8 v2, v2, 0x1c

    .line 267
    .line 268
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    add-int/2addr v2, p0

    .line 277
    new-instance p0, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 280
    .line 281
    .line 282
    new-instance p0, Lw42;

    .line 283
    .line 284
    invoke-direct {p0, v5}, Lw42;-><init>(Lu71;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 285
    .line 286
    .line 287
    :try_start_6
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 288
    .line 289
    .line 290
    :try_start_7
    new-instance v2, Lxu0;

    .line 291
    .line 292
    invoke-direct {v2, p0}, Lxu0;-><init>(Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 293
    .line 294
    .line 295
    goto :goto_7

    .line 296
    :catch_1
    move-exception p0

    .line 297
    goto :goto_6

    .line 298
    :goto_4
    :try_start_8
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 299
    .line 300
    .line 301
    goto :goto_5

    .line 302
    :catchall_3
    move-exception v2

    .line 303
    :try_start_9
    invoke-virtual {p0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 304
    .line 305
    .line 306
    :goto_5
    throw p0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 307
    :goto_6
    :try_start_a
    new-instance v2, Ljava/lang/RuntimeException;

    .line 308
    .line 309
    invoke-direct {v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    throw v2

    .line 313
    :cond_a
    sget-object v2, Lh;->j:Lh;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 314
    .line 315
    :goto_7
    :try_start_b
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 316
    .line 317
    .line 318
    move-object v0, v2

    .line 319
    :goto_8
    sput-object v0, Lcg1;->b:Lhs0;

    .line 320
    .line 321
    goto :goto_a

    .line 322
    :goto_9
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 323
    .line 324
    .line 325
    throw p0

    .line 326
    :cond_b
    :goto_a
    monitor-exit v1

    .line 327
    return-object v0

    .line 328
    :goto_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 329
    throw p0

    .line 330
    :cond_c
    return-object v0
.end method

.method public static E(Landroid/os/Parcel;II)V
    .locals 5

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ls21;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    add-int/lit8 v2, v2, 0x13

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    add-int/2addr v2, v3

    .line 37
    add-int/lit8 v2, v2, 0x4

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v3, v2

    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 49
    .line 50
    .line 51
    const-string v3, "Expected size "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p2, " got "

    .line 60
    .line 61
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p1, " (0x"

    .line 68
    .line 69
    const-string p2, ")"

    .line 70
    .line 71
    invoke-static {v2, p1, v1, p2}, Loq;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {v0, p1, p0}, Ls21;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 76
    .line 77
    .line 78
    throw v0
.end method

.method public static F(Landroid/os/Parcel;II)V
    .locals 5

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ls21;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    add-int/lit8 v2, v2, 0x13

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    add-int/2addr v2, v3

    .line 33
    add-int/lit8 v2, v2, 0x4

    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    add-int/2addr v3, v2

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 45
    .line 46
    .line 47
    const-string v3, "Expected size "

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p2, " got "

    .line 56
    .line 57
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, " (0x"

    .line 64
    .line 65
    const-string p2, ")"

    .line 66
    .line 67
    invoke-static {v2, p1, v1, p2}, Loq;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {v0, p1, p0}, Ls21;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 72
    .line 73
    .line 74
    throw v0
.end method

.method public static final a(C)B
    .locals 1

    .line 1
    const/16 v0, 0x7e

    .line 2
    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lvj;->b:[B

    .line 6
    .line 7
    aget-byte p0, v0, p0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)I
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v3, -0x1

    .line 18
    if-ne v0, v3, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p1}, Lf9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    goto :goto_3

    .line 29
    :cond_1
    if-nez v2, :cond_4

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    array-length v4, v2

    .line 42
    if-gtz v4, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    aget-object v2, v2, v0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    :goto_0
    return v3

    .line 49
    :cond_4
    :goto_1
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-class v5, Landroid/app/AppOpsManager;

    .line 58
    .line 59
    if-ne v3, v1, :cond_7

    .line 60
    .line 61
    invoke-static {v4, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_7

    .line 66
    .line 67
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .line 69
    const/16 v4, 0x1d

    .line 70
    .line 71
    if-lt v3, v4, :cond_6

    .line 72
    .line 73
    invoke-static {p0}, Lg9;->c(Landroid/content/Context;)Landroid/app/AppOpsManager;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-static {v3, p1, v4, v2}, Lg9;->a(Landroid/app/AppOpsManager;Ljava/lang/String;ILjava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_5
    invoke-static {p0}, Lg9;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v3, p1, v1, p0}, Lg9;->a(Landroid/app/AppOpsManager;Ljava/lang/String;ILjava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    goto :goto_2

    .line 97
    :cond_6
    invoke-static {p0, v5}, Lf9;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Landroid/app/AppOpsManager;

    .line 102
    .line 103
    invoke-static {p0, p1, v2}, Lf9;->c(Landroid/app/AppOpsManager;Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    goto :goto_2

    .line 108
    :cond_7
    invoke-static {p0, v5}, Lf9;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Landroid/app/AppOpsManager;

    .line 113
    .line 114
    invoke-static {p0, p1, v2}, Lf9;->c(Landroid/app/AppOpsManager;Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    :goto_2
    if-nez v2, :cond_8

    .line 119
    .line 120
    :goto_3
    return v0

    .line 121
    :cond_8
    const/4 p0, -0x2

    .line 122
    return p0
.end method

.method public static c(Landroid/os/Parcel;I)Landroid/os/Bundle;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static d(Landroid/os/Parcel;I)[B
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static e(Landroid/os/Parcel;I)[[B
    .locals 5

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-array v2, v1, [[B

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_0
    if-ge v3, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    aput-object v4, v2, v3

    .line 27
    .line 28
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    add-int/2addr v0, p1

    .line 32
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 33
    .line 34
    .line 35
    return-object v2
.end method

.method public static f(Landroid/os/Parcel;I)[I
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createIntArray()[I

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static g(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-interface {p2, p0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Landroid/os/Parcelable;

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 21
    .line 22
    .line 23
    return-object p2
.end method

.method public static h(Landroid/os/Parcel;I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static i(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method public static j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method public static l(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ls21;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1a

    .line 21
    .line 22
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 23
    .line 24
    .line 25
    const-string v1, "Overread allowed size end="

    .line 26
    .line 27
    invoke-static {v2, v1, p1}, Lx81;->j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {v0, p1, p0}, Ls21;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public static m(Ljavax/net/ssl/SSLSession;)Lnb0;
    .locals 6

    .line 1
    sget-object v0, Lu00;->j:Lu00;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_6

    .line 9
    .line 10
    const-string v3, "TLS_NULL_WITH_NULL_NULL"

    .line 11
    .line 12
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, 0x1

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    move v3, v4

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v3, "SSL_NULL_WITH_NULL_NULL"

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    :goto_0
    if-nez v3, :cond_5

    .line 28
    .line 29
    sget-object v3, Lek;->b:Lt11;

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Lt11;->k(Ljava/lang/String;)Lek;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getProtocol()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_4

    .line 40
    .line 41
    const-string v5, "NONE"

    .line 42
    .line 43
    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-nez v5, :cond_3

    .line 48
    .line 49
    invoke-static {v3}, Lbv;->h(Ljava/lang/String;)Lsc1;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    :try_start_0
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    array-length v5, v3

    .line 60
    invoke-static {v3, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v3
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    goto :goto_1

    .line 69
    :catch_0
    :cond_1
    move-object v3, v0

    .line 70
    :goto_1
    new-instance v5, Lnb0;

    .line 71
    .line 72
    invoke-interface {p0}, Ljavax/net/ssl/SSLSession;->getLocalCertificates()[Ljava/security/cert/Certificate;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    array-length v0, p0

    .line 79
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p0}, Ljg1;->i([Ljava/lang/Object;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    :cond_2
    new-instance p0, Lmb0;

    .line 88
    .line 89
    invoke-direct {p0, v4, v3}, Lmb0;-><init>(ILjava/util/List;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {v5, v2, v1, v0, p0}, Lnb0;-><init>(Lsc1;Lek;Ljava/util/List;Lp80;)V

    .line 93
    .line 94
    .line 95
    return-object v5

    .line 96
    :cond_3
    const-string p0, "tlsVersion == NONE"

    .line 97
    .line 98
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-object v2

    .line 102
    :cond_4
    const-string p0, "tlsVersion == null"

    .line 103
    .line 104
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-object v2

    .line 108
    :cond_5
    const-string p0, "cipherSuite == "

    .line 109
    .line 110
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-object v2

    .line 118
    :cond_6
    const-string p0, "cipherSuite == null"

    .line 119
    .line 120
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-object v2
.end method

.method public static o(Landroid/os/Parcel;I)Z
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcg1;->E(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static final p(Ljava/io/InputStream;)[B
    .locals 4

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x2000

    .line 8
    .line 9
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-array v1, v2, [B

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    :goto_0
    if-ltz v2, :cond_0

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public static q(Landroid/os/Parcel;I)Landroid/os/IBinder;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    add-int/2addr v0, p1

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public static r(Landroid/os/Parcel;I)I
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {p0, p1, v0}, Lcg1;->E(Landroid/os/Parcel;II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static s(Landroid/os/Parcel;I)J
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lcg1;->E(Landroid/os/Parcel;II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/os/Parcel;->readLong()J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public static t(Landroid/os/Parcel;I)I
    .locals 2

    .line 1
    const/high16 v0, -0x10000

    .line 2
    .line 3
    and-int v1, p1, v0

    .line 4
    .line 5
    if-eq v1, v0, :cond_0

    .line 6
    .line 7
    shr-int/lit8 p0, p1, 0x10

    .line 8
    .line 9
    int-to-char p0, p0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static final u(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p0, Lql;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lql;

    .line 6
    .line 7
    iget-object p0, p0, Lql;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    invoke-static {p0}, Lk42;->c(Ljava/lang/Throwable;)Lj11;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    return-object p0
.end method

.method public static final v(Lvi;Liq;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lvi;->j()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lvi;->f(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance p0, Lj11;

    .line 12
    .line 13
    invoke-direct {p0, v1}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Lvi;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    if-eqz p2, :cond_6

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    check-cast p1, Lcy;

    .line 27
    .line 28
    iget-object p2, p1, Lcy;->n:Lkq;

    .line 29
    .line 30
    iget-object p1, p1, Lcy;->p:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0, p1}, Lbh;->E(Lsq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v1, Lbh;->c:Log0;

    .line 41
    .line 42
    if-eq p1, v1, :cond_1

    .line 43
    .line 44
    invoke-static {p2, v0, p1}, Ldl1;->q(Liq;Lsq;Ljava/lang/Object;)Lte1;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/4 v1, 0x0

    .line 50
    :goto_1
    :try_start_0
    invoke-virtual {p2, p0}, Lkq;->d(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lte1;->W()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_2
    return-void

    .line 63
    :cond_3
    :goto_2
    invoke-static {v0, p1}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    invoke-virtual {v1}, Lte1;->W()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_5

    .line 75
    .line 76
    :cond_4
    invoke-static {v0, p1}, Lbh;->A(Lsq;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    throw p0

    .line 80
    :cond_6
    invoke-interface {p1, p0}, Liq;->d(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static w(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    instance-of v0, p0, Lzd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lzd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lzd0;->q()Lzd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    instance-of v0, p0, Luj0;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p0, Luj0;

    .line 17
    .line 18
    iget-object p0, p0, Luj0;->j:Ljava/util/List;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    instance-of v0, p0, Ljava/util/RandomAccess;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    new-instance v0, Lsj0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Luj0;-><init>(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_2
    new-instance v0, Luj0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Luj0;-><init>(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public static x(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Llb1;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/common/api/Status;->j:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p2, Llb1;->a:Ljd2;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljd2;->l(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/Status;->l:Landroid/app/PendingIntent;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    new-instance p1, Lt01;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lx5;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    new-instance p1, Lx5;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lx5;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p2, Llb1;->a:Ljd2;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static y(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcg1;->t(Landroid/os/Parcel;I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr v0, p1

    .line 10
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final z(B)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const-string p0, "quotation mark \'\"\'"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_1

    .line 9
    .line 10
    const-string p0, "string escape sequence \'\\\'"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 v0, 0x4

    .line 14
    if-ne p0, v0, :cond_2

    .line 15
    .line 16
    const-string p0, "comma \',\'"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 v0, 0x5

    .line 20
    if-ne p0, v0, :cond_3

    .line 21
    .line 22
    const-string p0, "colon \':\'"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const/4 v0, 0x6

    .line 26
    if-ne p0, v0, :cond_4

    .line 27
    .line 28
    const-string p0, "start of the object \'{\'"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_4
    const/4 v0, 0x7

    .line 32
    if-ne p0, v0, :cond_5

    .line 33
    .line 34
    const-string p0, "end of the object \'}\'"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_5
    const/16 v0, 0x8

    .line 38
    .line 39
    if-ne p0, v0, :cond_6

    .line 40
    .line 41
    const-string p0, "start of the array \'[\'"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_6
    const/16 v0, 0x9

    .line 45
    .line 46
    if-ne p0, v0, :cond_7

    .line 47
    .line 48
    const-string p0, "end of the array \']\'"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_7
    const/16 v0, 0xa

    .line 52
    .line 53
    if-ne p0, v0, :cond_8

    .line 54
    .line 55
    const-string p0, "end of the input"

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_8
    const/16 v0, 0x7f

    .line 59
    .line 60
    if-ne p0, v0, :cond_9

    .line 61
    .line 62
    const-string p0, "invalid token"

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_9
    const-string p0, "valid token"

    .line 66
    .line 67
    return-object p0
.end method


# virtual methods
.method public final k(Ljava/lang/String;[BII)I
    .locals 25

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p0

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    iget v3, v3, Lcg1;->a:I

    .line 12
    .line 13
    const/16 v5, 0x800

    .line 14
    .line 15
    const/16 v7, 0x80

    .line 16
    .line 17
    const v8, 0xd800

    .line 18
    .line 19
    .line 20
    const-string v10, "Failed writing "

    .line 21
    .line 22
    const-string v11, " at index "

    .line 23
    .line 24
    packed-switch v3, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    int-to-long v12, v2

    .line 28
    int-to-long v14, v4

    .line 29
    add-long/2addr v14, v12

    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-gt v3, v4, :cond_c

    .line 35
    .line 36
    array-length v6, v1

    .line 37
    sub-int/2addr v6, v4

    .line 38
    if-lt v6, v2, :cond_c

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    :goto_0
    const-wide/16 v16, 0x1

    .line 42
    .line 43
    if-ge v6, v3, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v2, v7, :cond_0

    .line 50
    .line 51
    add-long v16, v12, v16

    .line 52
    .line 53
    int-to-byte v2, v2

    .line 54
    invoke-static {v1, v12, v13, v2}, Lmf1;->l([BJB)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v6, v6, 0x1

    .line 58
    .line 59
    move-wide/from16 v12, v16

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    if-ne v6, v3, :cond_2

    .line 63
    .line 64
    :cond_1
    long-to-int v0, v12

    .line 65
    goto/16 :goto_5

    .line 66
    .line 67
    :cond_2
    :goto_1
    if-ge v6, v3, :cond_1

    .line 68
    .line 69
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-ge v2, v7, :cond_3

    .line 74
    .line 75
    cmp-long v4, v12, v14

    .line 76
    .line 77
    if-gez v4, :cond_3

    .line 78
    .line 79
    add-long v18, v12, v16

    .line 80
    .line 81
    int-to-byte v2, v2

    .line 82
    invoke-static {v1, v12, v13, v2}, Lmf1;->l([BJB)V

    .line 83
    .line 84
    .line 85
    move-wide/from16 v12, v18

    .line 86
    .line 87
    goto/16 :goto_4

    .line 88
    .line 89
    :cond_3
    const-wide/16 v18, 0x2

    .line 90
    .line 91
    if-ge v2, v5, :cond_4

    .line 92
    .line 93
    sub-long v20, v14, v18

    .line 94
    .line 95
    cmp-long v4, v12, v20

    .line 96
    .line 97
    if-gtz v4, :cond_4

    .line 98
    .line 99
    move v4, v6

    .line 100
    add-long v5, v12, v16

    .line 101
    .line 102
    ushr-int/lit8 v9, v2, 0x6

    .line 103
    .line 104
    or-int/lit16 v9, v9, 0x3c0

    .line 105
    .line 106
    int-to-byte v9, v9

    .line 107
    invoke-static {v1, v12, v13, v9}, Lmf1;->l([BJB)V

    .line 108
    .line 109
    .line 110
    add-long v12, v12, v18

    .line 111
    .line 112
    and-int/lit8 v2, v2, 0x3f

    .line 113
    .line 114
    or-int/2addr v2, v7

    .line 115
    int-to-byte v2, v2

    .line 116
    invoke-static {v1, v5, v6, v2}, Lmf1;->l([BJB)V

    .line 117
    .line 118
    .line 119
    move v6, v4

    .line 120
    goto/16 :goto_4

    .line 121
    .line 122
    :cond_4
    move v4, v6

    .line 123
    const-wide/16 v5, 0x3

    .line 124
    .line 125
    if-lt v2, v8, :cond_6

    .line 126
    .line 127
    const v9, 0xdfff

    .line 128
    .line 129
    .line 130
    if-ge v9, v2, :cond_5

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_5
    move/from16 p0, v4

    .line 134
    .line 135
    move-wide/from16 p3, v5

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_6
    :goto_2
    sub-long v22, v14, v5

    .line 139
    .line 140
    cmp-long v9, v12, v22

    .line 141
    .line 142
    if-gtz v9, :cond_5

    .line 143
    .line 144
    move-wide/from16 p3, v5

    .line 145
    .line 146
    add-long v5, v12, v16

    .line 147
    .line 148
    ushr-int/lit8 v9, v2, 0xc

    .line 149
    .line 150
    or-int/lit16 v9, v9, 0x1e0

    .line 151
    .line 152
    int-to-byte v9, v9

    .line 153
    invoke-static {v1, v12, v13, v9}, Lmf1;->l([BJB)V

    .line 154
    .line 155
    .line 156
    add-long v8, v12, v18

    .line 157
    .line 158
    ushr-int/lit8 v18, v2, 0x6

    .line 159
    .line 160
    move/from16 p0, v4

    .line 161
    .line 162
    and-int/lit8 v4, v18, 0x3f

    .line 163
    .line 164
    or-int/2addr v4, v7

    .line 165
    int-to-byte v4, v4

    .line 166
    invoke-static {v1, v5, v6, v4}, Lmf1;->l([BJB)V

    .line 167
    .line 168
    .line 169
    add-long v12, v12, p3

    .line 170
    .line 171
    and-int/lit8 v2, v2, 0x3f

    .line 172
    .line 173
    or-int/2addr v2, v7

    .line 174
    int-to-byte v2, v2

    .line 175
    invoke-static {v1, v8, v9, v2}, Lmf1;->l([BJB)V

    .line 176
    .line 177
    .line 178
    move/from16 v6, p0

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :goto_3
    const-wide/16 v4, 0x4

    .line 182
    .line 183
    sub-long v8, v14, v4

    .line 184
    .line 185
    cmp-long v6, v12, v8

    .line 186
    .line 187
    if-gtz v6, :cond_9

    .line 188
    .line 189
    add-int/lit8 v6, p0, 0x1

    .line 190
    .line 191
    if-eq v6, v3, :cond_7

    .line 192
    .line 193
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 194
    .line 195
    .line 196
    move-result v8

    .line 197
    invoke-static {v2, v8}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    if-eqz v9, :cond_8

    .line 202
    .line 203
    invoke-static {v2, v8}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    add-long v8, v12, v16

    .line 208
    .line 209
    move-wide/from16 v23, v4

    .line 210
    .line 211
    ushr-int/lit8 v4, v2, 0x12

    .line 212
    .line 213
    or-int/lit16 v4, v4, 0xf0

    .line 214
    .line 215
    int-to-byte v4, v4

    .line 216
    invoke-static {v1, v12, v13, v4}, Lmf1;->l([BJB)V

    .line 217
    .line 218
    .line 219
    add-long v4, v12, v18

    .line 220
    .line 221
    ushr-int/lit8 v18, v2, 0xc

    .line 222
    .line 223
    move/from16 p0, v2

    .line 224
    .line 225
    and-int/lit8 v2, v18, 0x3f

    .line 226
    .line 227
    or-int/2addr v2, v7

    .line 228
    int-to-byte v2, v2

    .line 229
    invoke-static {v1, v8, v9, v2}, Lmf1;->l([BJB)V

    .line 230
    .line 231
    .line 232
    add-long v8, v12, p3

    .line 233
    .line 234
    ushr-int/lit8 v2, p0, 0x6

    .line 235
    .line 236
    and-int/lit8 v2, v2, 0x3f

    .line 237
    .line 238
    or-int/2addr v2, v7

    .line 239
    int-to-byte v2, v2

    .line 240
    invoke-static {v1, v4, v5, v2}, Lmf1;->l([BJB)V

    .line 241
    .line 242
    .line 243
    add-long v12, v12, v23

    .line 244
    .line 245
    and-int/lit8 v2, p0, 0x3f

    .line 246
    .line 247
    or-int/2addr v2, v7

    .line 248
    int-to-byte v2, v2

    .line 249
    invoke-static {v1, v8, v9, v2}, Lmf1;->l([BJB)V

    .line 250
    .line 251
    .line 252
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 253
    .line 254
    const/16 v5, 0x800

    .line 255
    .line 256
    const v8, 0xd800

    .line 257
    .line 258
    .line 259
    goto/16 :goto_1

    .line 260
    .line 261
    :cond_7
    move/from16 v6, p0

    .line 262
    .line 263
    :cond_8
    new-instance v0, Leg1;

    .line 264
    .line 265
    add-int/lit8 v6, v6, -0x1

    .line 266
    .line 267
    invoke-direct {v0, v6, v3}, Leg1;-><init>(II)V

    .line 268
    .line 269
    .line 270
    throw v0

    .line 271
    :cond_9
    const v1, 0xd800

    .line 272
    .line 273
    .line 274
    if-gt v1, v2, :cond_b

    .line 275
    .line 276
    const v9, 0xdfff

    .line 277
    .line 278
    .line 279
    if-gt v2, v9, :cond_b

    .line 280
    .line 281
    add-int/lit8 v6, p0, 0x1

    .line 282
    .line 283
    if-eq v6, v3, :cond_a

    .line 284
    .line 285
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    invoke-static {v2, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-nez v0, :cond_b

    .line 294
    .line 295
    :cond_a
    new-instance v0, Leg1;

    .line 296
    .line 297
    move/from16 v4, p0

    .line 298
    .line 299
    invoke-direct {v0, v4, v3}, Leg1;-><init>(II)V

    .line 300
    .line 301
    .line 302
    throw v0

    .line 303
    :cond_b
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 304
    .line 305
    new-instance v1, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    throw v0

    .line 327
    :goto_5
    return v0

    .line 328
    :cond_c
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 329
    .line 330
    add-int/lit8 v3, v3, -0x1

    .line 331
    .line 332
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    add-int/2addr v2, v4

    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-direct {v1, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    throw v1

    .line 359
    :pswitch_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    add-int/2addr v4, v2

    .line 364
    const/4 v6, 0x0

    .line 365
    :goto_6
    if-ge v6, v3, :cond_d

    .line 366
    .line 367
    add-int v5, v6, v2

    .line 368
    .line 369
    if-ge v5, v4, :cond_d

    .line 370
    .line 371
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 372
    .line 373
    .line 374
    move-result v8

    .line 375
    if-ge v8, v7, :cond_d

    .line 376
    .line 377
    int-to-byte v8, v8

    .line 378
    aput-byte v8, v1, v5

    .line 379
    .line 380
    add-int/lit8 v6, v6, 0x1

    .line 381
    .line 382
    goto :goto_6

    .line 383
    :cond_d
    if-ne v6, v3, :cond_e

    .line 384
    .line 385
    add-int v0, v2, v3

    .line 386
    .line 387
    goto/16 :goto_9

    .line 388
    .line 389
    :cond_e
    add-int/2addr v2, v6

    .line 390
    :goto_7
    if-ge v6, v3, :cond_18

    .line 391
    .line 392
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    .line 393
    .line 394
    .line 395
    move-result v5

    .line 396
    if-ge v5, v7, :cond_f

    .line 397
    .line 398
    if-ge v2, v4, :cond_f

    .line 399
    .line 400
    add-int/lit8 v8, v2, 0x1

    .line 401
    .line 402
    int-to-byte v5, v5

    .line 403
    aput-byte v5, v1, v2

    .line 404
    .line 405
    move v2, v8

    .line 406
    const/16 v8, 0x800

    .line 407
    .line 408
    goto/16 :goto_8

    .line 409
    .line 410
    :cond_f
    const/16 v8, 0x800

    .line 411
    .line 412
    if-ge v5, v8, :cond_10

    .line 413
    .line 414
    add-int/lit8 v9, v4, -0x2

    .line 415
    .line 416
    if-gt v2, v9, :cond_10

    .line 417
    .line 418
    add-int/lit8 v9, v2, 0x1

    .line 419
    .line 420
    ushr-int/lit8 v12, v5, 0x6

    .line 421
    .line 422
    or-int/lit16 v12, v12, 0x3c0

    .line 423
    .line 424
    int-to-byte v12, v12

    .line 425
    aput-byte v12, v1, v2

    .line 426
    .line 427
    add-int/lit8 v2, v2, 0x2

    .line 428
    .line 429
    and-int/lit8 v5, v5, 0x3f

    .line 430
    .line 431
    or-int/2addr v5, v7

    .line 432
    int-to-byte v5, v5

    .line 433
    aput-byte v5, v1, v9

    .line 434
    .line 435
    goto :goto_8

    .line 436
    :cond_10
    const v9, 0xd800

    .line 437
    .line 438
    .line 439
    if-lt v5, v9, :cond_11

    .line 440
    .line 441
    const v9, 0xdfff

    .line 442
    .line 443
    .line 444
    if-ge v9, v5, :cond_12

    .line 445
    .line 446
    :cond_11
    add-int/lit8 v9, v4, -0x3

    .line 447
    .line 448
    if-gt v2, v9, :cond_12

    .line 449
    .line 450
    add-int/lit8 v9, v2, 0x1

    .line 451
    .line 452
    ushr-int/lit8 v12, v5, 0xc

    .line 453
    .line 454
    or-int/lit16 v12, v12, 0x1e0

    .line 455
    .line 456
    int-to-byte v12, v12

    .line 457
    aput-byte v12, v1, v2

    .line 458
    .line 459
    add-int/lit8 v12, v2, 0x2

    .line 460
    .line 461
    ushr-int/lit8 v13, v5, 0x6

    .line 462
    .line 463
    and-int/lit8 v13, v13, 0x3f

    .line 464
    .line 465
    or-int/2addr v13, v7

    .line 466
    int-to-byte v13, v13

    .line 467
    aput-byte v13, v1, v9

    .line 468
    .line 469
    add-int/lit8 v2, v2, 0x3

    .line 470
    .line 471
    and-int/lit8 v5, v5, 0x3f

    .line 472
    .line 473
    or-int/2addr v5, v7

    .line 474
    int-to-byte v5, v5

    .line 475
    aput-byte v5, v1, v12

    .line 476
    .line 477
    goto :goto_8

    .line 478
    :cond_12
    add-int/lit8 v9, v4, -0x4

    .line 479
    .line 480
    if-gt v2, v9, :cond_15

    .line 481
    .line 482
    add-int/lit8 v9, v6, 0x1

    .line 483
    .line 484
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 485
    .line 486
    .line 487
    move-result v12

    .line 488
    if-eq v9, v12, :cond_14

    .line 489
    .line 490
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    .line 491
    .line 492
    .line 493
    move-result v6

    .line 494
    invoke-static {v5, v6}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 495
    .line 496
    .line 497
    move-result v12

    .line 498
    if-eqz v12, :cond_13

    .line 499
    .line 500
    invoke-static {v5, v6}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 501
    .line 502
    .line 503
    move-result v5

    .line 504
    add-int/lit8 v6, v2, 0x1

    .line 505
    .line 506
    ushr-int/lit8 v12, v5, 0x12

    .line 507
    .line 508
    or-int/lit16 v12, v12, 0xf0

    .line 509
    .line 510
    int-to-byte v12, v12

    .line 511
    aput-byte v12, v1, v2

    .line 512
    .line 513
    add-int/lit8 v12, v2, 0x2

    .line 514
    .line 515
    ushr-int/lit8 v13, v5, 0xc

    .line 516
    .line 517
    and-int/lit8 v13, v13, 0x3f

    .line 518
    .line 519
    or-int/2addr v13, v7

    .line 520
    int-to-byte v13, v13

    .line 521
    aput-byte v13, v1, v6

    .line 522
    .line 523
    add-int/lit8 v6, v2, 0x3

    .line 524
    .line 525
    ushr-int/lit8 v13, v5, 0x6

    .line 526
    .line 527
    and-int/lit8 v13, v13, 0x3f

    .line 528
    .line 529
    or-int/2addr v13, v7

    .line 530
    int-to-byte v13, v13

    .line 531
    aput-byte v13, v1, v12

    .line 532
    .line 533
    add-int/lit8 v2, v2, 0x4

    .line 534
    .line 535
    and-int/lit8 v5, v5, 0x3f

    .line 536
    .line 537
    or-int/2addr v5, v7

    .line 538
    int-to-byte v5, v5

    .line 539
    aput-byte v5, v1, v6

    .line 540
    .line 541
    move v6, v9

    .line 542
    :goto_8
    add-int/lit8 v6, v6, 0x1

    .line 543
    .line 544
    goto/16 :goto_7

    .line 545
    .line 546
    :cond_13
    move v6, v9

    .line 547
    :cond_14
    new-instance v0, Leg1;

    .line 548
    .line 549
    add-int/lit8 v6, v6, -0x1

    .line 550
    .line 551
    invoke-direct {v0, v6, v3}, Leg1;-><init>(II)V

    .line 552
    .line 553
    .line 554
    throw v0

    .line 555
    :cond_15
    const v1, 0xd800

    .line 556
    .line 557
    .line 558
    if-gt v1, v5, :cond_17

    .line 559
    .line 560
    const v9, 0xdfff

    .line 561
    .line 562
    .line 563
    if-gt v5, v9, :cond_17

    .line 564
    .line 565
    add-int/lit8 v1, v6, 0x1

    .line 566
    .line 567
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 568
    .line 569
    .line 570
    move-result v4

    .line 571
    if-eq v1, v4, :cond_16

    .line 572
    .line 573
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    .line 574
    .line 575
    .line 576
    move-result v0

    .line 577
    invoke-static {v5, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    .line 578
    .line 579
    .line 580
    move-result v0

    .line 581
    if-nez v0, :cond_17

    .line 582
    .line 583
    :cond_16
    new-instance v0, Leg1;

    .line 584
    .line 585
    invoke-direct {v0, v6, v3}, Leg1;-><init>(II)V

    .line 586
    .line 587
    .line 588
    throw v0

    .line 589
    :cond_17
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 590
    .line 591
    new-instance v1, Ljava/lang/StringBuilder;

    .line 592
    .line 593
    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    throw v0

    .line 613
    :cond_18
    move v0, v2

    .line 614
    :goto_9
    return v0

    .line 615
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final n([BII)I
    .locals 21

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p0

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    iget v2, v2, Lcg1;->a:I

    .line 10
    .line 11
    const/16 v4, -0x41

    .line 12
    .line 13
    const/4 v5, -0x1

    .line 14
    const/16 v6, -0x20

    .line 15
    .line 16
    const/16 v7, -0x60

    .line 17
    .line 18
    const/16 v8, -0x3e

    .line 19
    .line 20
    const/16 v9, -0x10

    .line 21
    .line 22
    const/16 v10, -0x13

    .line 23
    .line 24
    packed-switch v2, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    or-int v2, v1, v3

    .line 28
    .line 29
    array-length v12, v0

    .line 30
    sub-int/2addr v12, v3

    .line 31
    or-int/2addr v2, v12

    .line 32
    if-ltz v2, :cond_14

    .line 33
    .line 34
    int-to-long v1, v1

    .line 35
    int-to-long v12, v3

    .line 36
    sub-long/2addr v12, v1

    .line 37
    long-to-int v3, v12

    .line 38
    const/16 v12, 0x10

    .line 39
    .line 40
    if-ge v3, v12, :cond_0

    .line 41
    .line 42
    const-wide/16 p2, 0x1

    .line 43
    .line 44
    const/4 v15, 0x0

    .line 45
    goto :goto_3

    .line 46
    :cond_0
    long-to-int v12, v1

    .line 47
    and-int/lit8 v12, v12, 0x7

    .line 48
    .line 49
    rsub-int/lit8 v12, v12, 0x8

    .line 50
    .line 51
    move-wide v13, v1

    .line 52
    const-wide/16 p2, 0x1

    .line 53
    .line 54
    const/4 v15, 0x0

    .line 55
    :goto_0
    if-ge v15, v12, :cond_2

    .line 56
    .line 57
    add-long v16, v13, p2

    .line 58
    .line 59
    invoke-static {v0, v13, v14}, Lmf1;->e([BJ)B

    .line 60
    .line 61
    .line 62
    move-result v13

    .line 63
    if-gez v13, :cond_1

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_1
    add-int/lit8 v15, v15, 0x1

    .line 67
    .line 68
    move-wide/from16 v13, v16

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    :goto_1
    add-int/lit8 v12, v15, 0x8

    .line 72
    .line 73
    if-gt v12, v3, :cond_4

    .line 74
    .line 75
    sget-wide v16, Lmf1;->f:J

    .line 76
    .line 77
    move/from16 v18, v12

    .line 78
    .line 79
    add-long v11, v16, v13

    .line 80
    .line 81
    invoke-static {v11, v12, v0}, Lmf1;->i(JLjava/lang/Object;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v11

    .line 85
    const-wide v16, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    and-long v11, v11, v16

    .line 91
    .line 92
    const-wide/16 v16, 0x0

    .line 93
    .line 94
    cmp-long v11, v11, v16

    .line 95
    .line 96
    if-eqz v11, :cond_3

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    const-wide/16 v11, 0x8

    .line 100
    .line 101
    add-long/2addr v13, v11

    .line 102
    move/from16 v15, v18

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    :goto_2
    if-ge v15, v3, :cond_6

    .line 106
    .line 107
    add-long v11, v13, p2

    .line 108
    .line 109
    invoke-static {v0, v13, v14}, Lmf1;->e([BJ)B

    .line 110
    .line 111
    .line 112
    move-result v13

    .line 113
    if-gez v13, :cond_5

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_5
    add-int/lit8 v15, v15, 0x1

    .line 117
    .line 118
    move-wide v13, v11

    .line 119
    goto :goto_2

    .line 120
    :cond_6
    move v15, v3

    .line 121
    :goto_3
    sub-int/2addr v3, v15

    .line 122
    int-to-long v11, v15

    .line 123
    add-long/2addr v1, v11

    .line 124
    :cond_7
    :goto_4
    const/4 v11, 0x0

    .line 125
    :goto_5
    if-lez v3, :cond_9

    .line 126
    .line 127
    add-long v11, v1, p2

    .line 128
    .line 129
    invoke-static {v0, v1, v2}, Lmf1;->e([BJ)B

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-ltz v1, :cond_8

    .line 134
    .line 135
    add-int/lit8 v3, v3, -0x1

    .line 136
    .line 137
    move-wide/from16 v19, v11

    .line 138
    .line 139
    move v11, v1

    .line 140
    move-wide/from16 v1, v19

    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_8
    move-wide/from16 v19, v11

    .line 144
    .line 145
    move v11, v1

    .line 146
    move-wide/from16 v1, v19

    .line 147
    .line 148
    :cond_9
    if-nez v3, :cond_a

    .line 149
    .line 150
    const/4 v5, 0x0

    .line 151
    goto/16 :goto_6

    .line 152
    .line 153
    :cond_a
    add-int/lit8 v12, v3, -0x1

    .line 154
    .line 155
    if-ge v11, v6, :cond_d

    .line 156
    .line 157
    if-nez v12, :cond_b

    .line 158
    .line 159
    move v5, v11

    .line 160
    goto/16 :goto_6

    .line 161
    .line 162
    :cond_b
    add-int/lit8 v3, v3, -0x2

    .line 163
    .line 164
    if-lt v11, v8, :cond_13

    .line 165
    .line 166
    add-long v13, v1, p2

    .line 167
    .line 168
    invoke-static {v0, v1, v2}, Lmf1;->e([BJ)B

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-le v1, v4, :cond_c

    .line 173
    .line 174
    goto :goto_6

    .line 175
    :cond_c
    move-wide v1, v13

    .line 176
    goto :goto_4

    .line 177
    :cond_d
    if-ge v11, v9, :cond_11

    .line 178
    .line 179
    const/4 v15, 0x2

    .line 180
    if-ge v12, v15, :cond_e

    .line 181
    .line 182
    invoke-static {v0, v11, v1, v2, v12}, Lcg1;->A([BIJI)I

    .line 183
    .line 184
    .line 185
    move-result v5

    .line 186
    goto :goto_6

    .line 187
    :cond_e
    add-int/lit8 v3, v3, -0x3

    .line 188
    .line 189
    const-wide/16 v15, 0x2

    .line 190
    .line 191
    add-long v13, v1, p2

    .line 192
    .line 193
    invoke-static {v0, v1, v2}, Lmf1;->e([BJ)B

    .line 194
    .line 195
    .line 196
    move-result v12

    .line 197
    if-gt v12, v4, :cond_13

    .line 198
    .line 199
    if-ne v11, v6, :cond_f

    .line 200
    .line 201
    if-lt v12, v7, :cond_13

    .line 202
    .line 203
    :cond_f
    if-ne v11, v10, :cond_10

    .line 204
    .line 205
    if-ge v12, v7, :cond_13

    .line 206
    .line 207
    :cond_10
    add-long/2addr v1, v15

    .line 208
    invoke-static {v0, v13, v14}, Lmf1;->e([BJ)B

    .line 209
    .line 210
    .line 211
    move-result v11

    .line 212
    if-le v11, v4, :cond_7

    .line 213
    .line 214
    goto :goto_6

    .line 215
    :cond_11
    const-wide/16 v15, 0x2

    .line 216
    .line 217
    const/4 v13, 0x3

    .line 218
    if-ge v12, v13, :cond_12

    .line 219
    .line 220
    invoke-static {v0, v11, v1, v2, v12}, Lcg1;->A([BIJI)I

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    goto :goto_6

    .line 225
    :cond_12
    add-int/lit8 v3, v3, -0x4

    .line 226
    .line 227
    add-long v13, v1, p2

    .line 228
    .line 229
    invoke-static {v0, v1, v2}, Lmf1;->e([BJ)B

    .line 230
    .line 231
    .line 232
    move-result v12

    .line 233
    if-gt v12, v4, :cond_13

    .line 234
    .line 235
    shl-int/lit8 v11, v11, 0x1c

    .line 236
    .line 237
    add-int/lit8 v12, v12, 0x70

    .line 238
    .line 239
    add-int/2addr v12, v11

    .line 240
    shr-int/lit8 v11, v12, 0x1e

    .line 241
    .line 242
    if-nez v11, :cond_13

    .line 243
    .line 244
    add-long v11, v1, v15

    .line 245
    .line 246
    invoke-static {v0, v13, v14}, Lmf1;->e([BJ)B

    .line 247
    .line 248
    .line 249
    move-result v13

    .line 250
    if-gt v13, v4, :cond_13

    .line 251
    .line 252
    const-wide/16 v13, 0x3

    .line 253
    .line 254
    add-long/2addr v1, v13

    .line 255
    invoke-static {v0, v11, v12}, Lmf1;->e([BJ)B

    .line 256
    .line 257
    .line 258
    move-result v11

    .line 259
    if-le v11, v4, :cond_7

    .line 260
    .line 261
    :cond_13
    :goto_6
    return v5

    .line 262
    :cond_14
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 263
    .line 264
    array-length v0, v0

    .line 265
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    filled-new-array {v0, v1, v3}, [Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    const-string v1, "Array length=%d, index=%d, limit=%d"

    .line 282
    .line 283
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-direct {v2, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    throw v2

    .line 291
    :goto_7
    :pswitch_0
    if-ge v1, v3, :cond_15

    .line 292
    .line 293
    aget-byte v2, v0, v1

    .line 294
    .line 295
    if-ltz v2, :cond_15

    .line 296
    .line 297
    add-int/lit8 v1, v1, 0x1

    .line 298
    .line 299
    goto :goto_7

    .line 300
    :cond_15
    if-lt v1, v3, :cond_16

    .line 301
    .line 302
    goto :goto_9

    .line 303
    :cond_16
    :goto_8
    if-lt v1, v3, :cond_17

    .line 304
    .line 305
    :goto_9
    const/4 v5, 0x0

    .line 306
    goto :goto_a

    .line 307
    :cond_17
    add-int/lit8 v2, v1, 0x1

    .line 308
    .line 309
    aget-byte v11, v0, v1

    .line 310
    .line 311
    if-gez v11, :cond_20

    .line 312
    .line 313
    if-ge v11, v6, :cond_19

    .line 314
    .line 315
    if-lt v2, v3, :cond_18

    .line 316
    .line 317
    move v5, v11

    .line 318
    goto :goto_a

    .line 319
    :cond_18
    if-lt v11, v8, :cond_1f

    .line 320
    .line 321
    add-int/lit8 v1, v1, 0x2

    .line 322
    .line 323
    aget-byte v2, v0, v2

    .line 324
    .line 325
    if-le v2, v4, :cond_16

    .line 326
    .line 327
    goto :goto_a

    .line 328
    :cond_19
    if-ge v11, v9, :cond_1d

    .line 329
    .line 330
    add-int/lit8 v12, v3, -0x1

    .line 331
    .line 332
    if-lt v2, v12, :cond_1a

    .line 333
    .line 334
    invoke-static {v0, v2, v3}, Lgg1;->d([BII)I

    .line 335
    .line 336
    .line 337
    move-result v5

    .line 338
    goto :goto_a

    .line 339
    :cond_1a
    add-int/lit8 v12, v1, 0x2

    .line 340
    .line 341
    aget-byte v2, v0, v2

    .line 342
    .line 343
    if-gt v2, v4, :cond_1f

    .line 344
    .line 345
    if-ne v11, v6, :cond_1b

    .line 346
    .line 347
    if-lt v2, v7, :cond_1f

    .line 348
    .line 349
    :cond_1b
    if-ne v11, v10, :cond_1c

    .line 350
    .line 351
    if-ge v2, v7, :cond_1f

    .line 352
    .line 353
    :cond_1c
    add-int/lit8 v1, v1, 0x3

    .line 354
    .line 355
    aget-byte v2, v0, v12

    .line 356
    .line 357
    if-le v2, v4, :cond_16

    .line 358
    .line 359
    goto :goto_a

    .line 360
    :cond_1d
    add-int/lit8 v12, v3, -0x2

    .line 361
    .line 362
    if-lt v2, v12, :cond_1e

    .line 363
    .line 364
    invoke-static {v0, v2, v3}, Lgg1;->d([BII)I

    .line 365
    .line 366
    .line 367
    move-result v5

    .line 368
    goto :goto_a

    .line 369
    :cond_1e
    add-int/lit8 v12, v1, 0x2

    .line 370
    .line 371
    aget-byte v2, v0, v2

    .line 372
    .line 373
    if-gt v2, v4, :cond_1f

    .line 374
    .line 375
    shl-int/lit8 v11, v11, 0x1c

    .line 376
    .line 377
    add-int/lit8 v2, v2, 0x70

    .line 378
    .line 379
    add-int/2addr v2, v11

    .line 380
    shr-int/lit8 v2, v2, 0x1e

    .line 381
    .line 382
    if-nez v2, :cond_1f

    .line 383
    .line 384
    add-int/lit8 v2, v1, 0x3

    .line 385
    .line 386
    aget-byte v11, v0, v12

    .line 387
    .line 388
    if-gt v11, v4, :cond_1f

    .line 389
    .line 390
    add-int/lit8 v1, v1, 0x4

    .line 391
    .line 392
    aget-byte v2, v0, v2

    .line 393
    .line 394
    if-le v2, v4, :cond_16

    .line 395
    .line 396
    :cond_1f
    :goto_a
    return v5

    .line 397
    :cond_20
    move v1, v2

    .line 398
    goto :goto_8

    .line 399
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
