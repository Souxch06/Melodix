.class public abstract Lgd2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ljava/util/WeakHashMap;

.field public static final b:Ljava/util/WeakHashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lgd2;->a:Ljava/util/WeakHashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lgd2;->b:Ljava/util/WeakHashMap;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Ljava/lang/Throwable;)V
    .locals 13

    .line 1
    sget-object v0, Lgd2;->b:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    move-object v1, p0

    .line 5
    :goto_0
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto/16 :goto_d

    .line 20
    .line 21
    :cond_0
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v3, v2

    .line 27
    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v0, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    goto/16 :goto_b

    .line 38
    .line 39
    :cond_2
    sget-object v1, Lgd2;->a:Ljava/util/WeakHashMap;

    .line 40
    .line 41
    monitor-enter v1

    .line 42
    move-object v0, p0

    .line 43
    :goto_2
    if-eqz v0, :cond_3

    .line 44
    .line 45
    :try_start_1
    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_3

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    goto :goto_2

    .line 56
    :catchall_1
    move-exception p0

    .line 57
    goto/16 :goto_c

    .line 58
    .line 59
    :cond_3
    if-nez v0, :cond_4

    .line 60
    .line 61
    monitor-exit v1

    .line 62
    const/4 v0, 0x0

    .line 63
    goto :goto_3

    .line 64
    :cond_4
    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lfd2;

    .line 69
    .line 70
    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 74
    new-instance v0, Llv1;

    .line 75
    .line 76
    const/16 v1, 0x1c

    .line 77
    .line 78
    invoke-direct {v0, v1}, Llv1;-><init>(I)V

    .line 79
    .line 80
    .line 81
    :goto_3
    if-nez v0, :cond_d

    .line 82
    .line 83
    invoke-static {}, Lhd2;->c()Ltd2;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v0, v0, Ltd2;->b:Led2;

    .line 88
    .line 89
    if-eqz v0, :cond_d

    .line 90
    .line 91
    new-instance v1, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    :goto_4
    if-eqz v0, :cond_5

    .line 97
    .line 98
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    iget-object v0, v0, Led2;->j:Led2;

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Led2;

    .line 109
    .line 110
    iget-object v0, v0, Led2;->k:Ljava/util/UUID;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Led2;

    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    sget-object v4, Lzd0;->k:Lwd0;

    .line 126
    .line 127
    const-string v4, "expectedSize"

    .line 128
    .line 129
    invoke-static {v3, v4}, Lkp1;->a(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    const-string v4, "initialCapacity"

    .line 133
    .line 134
    invoke-static {v3, v4}, Lkp1;->a(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    new-array v3, v3, [Ljava/lang/Object;

    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    const-string v5, "expectedSize"

    .line 144
    .line 145
    invoke-static {v4, v5}, Lkp1;->a(ILjava/lang/String;)V

    .line 146
    .line 147
    .line 148
    const-string v5, "initialCapacity"

    .line 149
    .line 150
    invoke-static {v4, v5}, Lkp1;->a(ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-array v4, v4, [Ljava/lang/Object;

    .line 154
    .line 155
    invoke-static {v1}, Lcg1;->w(Ljava/util/List;)Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    move v5, v2

    .line 164
    move v6, v5

    .line 165
    move v7, v6

    .line 166
    move v8, v7

    .line 167
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 168
    .line 169
    .line 170
    move-result v9

    .line 171
    if-eqz v9, :cond_a

    .line 172
    .line 173
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v9

    .line 177
    check-cast v9, Led2;

    .line 178
    .line 179
    iget-object v10, v9, Led2;->m:Ljava/lang/String;

    .line 180
    .line 181
    add-int/lit8 v11, v7, 0x1

    .line 182
    .line 183
    array-length v12, v4

    .line 184
    if-ge v12, v11, :cond_6

    .line 185
    .line 186
    array-length v8, v4

    .line 187
    invoke-static {v8, v11}, Lvd0;->d(II)I

    .line 188
    .line 189
    .line 190
    move-result v8

    .line 191
    invoke-static {v4, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    :goto_6
    move v8, v2

    .line 196
    goto :goto_7

    .line 197
    :cond_6
    if-eqz v8, :cond_7

    .line 198
    .line 199
    invoke-virtual {v4}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    check-cast v4, [Ljava/lang/Object;

    .line 204
    .line 205
    goto :goto_6

    .line 206
    :cond_7
    :goto_7
    add-int/lit8 v11, v7, 0x1

    .line 207
    .line 208
    aput-object v10, v4, v7

    .line 209
    .line 210
    invoke-virtual {v9}, Led2;->g()Lqd2;

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 215
    .line 216
    .line 217
    add-int/lit8 v9, v5, 0x1

    .line 218
    .line 219
    array-length v10, v3

    .line 220
    if-ge v10, v9, :cond_8

    .line 221
    .line 222
    array-length v6, v3

    .line 223
    invoke-static {v6, v9}, Lvd0;->d(II)I

    .line 224
    .line 225
    .line 226
    move-result v6

    .line 227
    invoke-static {v3, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    :goto_8
    move v6, v2

    .line 232
    goto :goto_9

    .line 233
    :cond_8
    if-eqz v6, :cond_9

    .line 234
    .line 235
    invoke-virtual {v3}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, [Ljava/lang/Object;

    .line 240
    .line 241
    goto :goto_8

    .line 242
    :cond_9
    :goto_9
    add-int/lit8 v9, v5, 0x1

    .line 243
    .line 244
    aput-object v7, v3, v5

    .line 245
    .line 246
    move v5, v9

    .line 247
    move v7, v11

    .line 248
    goto :goto_5

    .line 249
    :cond_a
    sget-object v1, Lgd2;->a:Ljava/util/WeakHashMap;

    .line 250
    .line 251
    monitor-enter v1

    .line 252
    :try_start_2
    invoke-static {v7, v4}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    if-eqz v2, :cond_c

    .line 257
    .line 258
    invoke-static {v5, v3}, Lzd0;->k(I[Ljava/lang/Object;)Lmz0;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    if-eqz v3, :cond_b

    .line 263
    .line 264
    new-instance v4, Lfd2;

    .line 265
    .line 266
    invoke-direct {v4, v2, v3, v0}, Lfd2;-><init>(Lmz0;Lmz0;Ljava/util/UUID;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v1, p0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    monitor-exit v1

    .line 273
    return-void

    .line 274
    :catchall_2
    move-exception p0

    .line 275
    goto :goto_a

    .line 276
    :cond_b
    new-instance p0, Ljava/lang/NullPointerException;

    .line 277
    .line 278
    const-string v0, "Null extras"

    .line 279
    .line 280
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw p0

    .line 284
    :cond_c
    new-instance p0, Ljava/lang/NullPointerException;

    .line 285
    .line 286
    const-string v0, "Null spansNames"

    .line 287
    .line 288
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    throw p0

    .line 292
    :goto_a
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 293
    throw p0

    .line 294
    :cond_d
    :goto_b
    return-void

    .line 295
    :goto_c
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 296
    throw p0

    .line 297
    :goto_d
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 298
    throw p0
.end method
