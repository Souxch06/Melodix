.class public final Lnc0;
.super Ljb1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p4, p0, Lnc0;->e:I

    .line 2
    .line 3
    iput-object p2, p0, Lnc0;->f:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lnc0;->g:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    invoke-direct {p0, p1, p2}, Ljb1;-><init>(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 15

    .line 1
    iget v0, p0, Lnc0;->e:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-wide/16 v2, -0x1

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lnc0;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lpc0;

    .line 12
    .line 13
    iget-object p0, p0, Lnc0;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lo51;

    .line 16
    .line 17
    new-instance v4, Lhz0;

    .line 18
    .line 19
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, Lpc0;->k:Ltc0;

    .line 23
    .line 24
    iget-object v5, v0, Ltc0;->F:Lbd0;

    .line 25
    .line 26
    monitor-enter v5

    .line 27
    :try_start_0
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 28
    :try_start_1
    iget-object v6, v0, Ltc0;->z:Lo51;

    .line 29
    .line 30
    new-instance v7, Lo51;

    .line 31
    .line 32
    invoke-direct {v7}, Lo51;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    move v9, v8

    .line 40
    :goto_0
    const/16 v10, 0xa

    .line 41
    .line 42
    const/4 v11, 0x1

    .line 43
    if-ge v9, v10, :cond_1

    .line 44
    .line 45
    shl-int v10, v11, v9

    .line 46
    .line 47
    iget v11, v6, Lo51;->a:I

    .line 48
    .line 49
    and-int/2addr v10, v11

    .line 50
    if-eqz v10, :cond_0

    .line 51
    .line 52
    iget-object v10, v6, Lo51;->b:[I

    .line 53
    .line 54
    aget v10, v10, v9

    .line 55
    .line 56
    invoke-virtual {v7, v9, v10}, Lo51;->b(II)V

    .line 57
    .line 58
    .line 59
    :cond_0
    add-int/lit8 v9, v9, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    move v9, v8

    .line 63
    :goto_1
    if-ge v9, v10, :cond_3

    .line 64
    .line 65
    shl-int v12, v11, v9

    .line 66
    .line 67
    iget v13, p0, Lo51;->a:I

    .line 68
    .line 69
    and-int/2addr v12, v13

    .line 70
    if-eqz v12, :cond_2

    .line 71
    .line 72
    iget-object v12, p0, Lo51;->b:[I

    .line 73
    .line 74
    aget v12, v12, v9

    .line 75
    .line 76
    invoke-virtual {v7, v9, v12}, Lo51;->b(II)V

    .line 77
    .line 78
    .line 79
    :cond_2
    add-int/lit8 v9, v9, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    iput-object v7, v4, Lhz0;->j:Ljava/lang/Object;

    .line 83
    .line 84
    invoke-virtual {v7}, Lo51;->a()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    int-to-long v9, p0

    .line 89
    invoke-virtual {v6}, Lo51;->a()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    int-to-long v6, p0

    .line 94
    sub-long/2addr v9, v6

    .line 95
    const-wide/16 v6, 0x0

    .line 96
    .line 97
    cmp-long p0, v9, v6

    .line 98
    .line 99
    if-eqz p0, :cond_5

    .line 100
    .line 101
    iget-object v11, v0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 102
    .line 103
    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    if-eqz v11, :cond_4

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    iget-object v11, v0, Ltc0;->k:Ljava/util/LinkedHashMap;

    .line 111
    .line 112
    invoke-virtual {v11}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 113
    .line 114
    .line 115
    move-result-object v11

    .line 116
    new-array v12, v8, [Lad0;

    .line 117
    .line 118
    invoke-interface {v11, v12}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v11

    .line 122
    check-cast v11, [Lad0;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :catchall_0
    move-exception p0

    .line 126
    goto :goto_6

    .line 127
    :cond_5
    :goto_2
    const/4 v11, 0x0

    .line 128
    :goto_3
    iget-object v12, v4, Lhz0;->j:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast v12, Lo51;

    .line 131
    .line 132
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    iput-object v12, v0, Ltc0;->z:Lo51;

    .line 136
    .line 137
    iget-object v12, v0, Ltc0;->s:Lob1;

    .line 138
    .line 139
    new-instance v13, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    iget-object v14, v0, Ltc0;->l:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v14, " onSettings"

    .line 150
    .line 151
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v13

    .line 158
    new-instance v14, Lnc0;

    .line 159
    .line 160
    invoke-direct {v14, v13, v0, v4, v8}, Lnc0;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v12, v14, v6, v7}, Lob1;->c(Ljb1;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    .line 165
    .line 166
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 167
    :try_start_3
    iget-object v6, v0, Ltc0;->F:Lbd0;

    .line 168
    .line 169
    iget-object v4, v4, Lhz0;->j:Ljava/lang/Object;

    .line 170
    .line 171
    check-cast v4, Lo51;

    .line 172
    .line 173
    invoke-virtual {v6, v4}, Lbd0;->a(Lo51;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :catchall_1
    move-exception p0

    .line 178
    goto :goto_7

    .line 179
    :catch_0
    move-exception v4

    .line 180
    :try_start_4
    invoke-virtual {v0, v1, v1, v4}, Ltc0;->a(IILjava/io/IOException;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 181
    .line 182
    .line 183
    :goto_4
    monitor-exit v5

    .line 184
    if-eqz v11, :cond_7

    .line 185
    .line 186
    array-length v0, v11

    .line 187
    :goto_5
    if-ge v8, v0, :cond_7

    .line 188
    .line 189
    aget-object v1, v11, v8

    .line 190
    .line 191
    monitor-enter v1

    .line 192
    :try_start_5
    iget-wide v4, v1, Lad0;->f:J

    .line 193
    .line 194
    add-long/2addr v4, v9

    .line 195
    iput-wide v4, v1, Lad0;->f:J

    .line 196
    .line 197
    if-lez p0, :cond_6

    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 200
    .line 201
    .line 202
    :cond_6
    monitor-exit v1

    .line 203
    add-int/lit8 v8, v8, 0x1

    .line 204
    .line 205
    goto :goto_5

    .line 206
    :catchall_2
    move-exception p0

    .line 207
    monitor-exit v1

    .line 208
    throw p0

    .line 209
    :cond_7
    return-wide v2

    .line 210
    :goto_6
    :try_start_6
    monitor-exit v0

    .line 211
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 212
    :goto_7
    monitor-exit v5

    .line 213
    throw p0

    .line 214
    :pswitch_0
    :try_start_7
    iget-object v0, p0, Lnc0;->f:Ljava/lang/Object;

    .line 215
    .line 216
    check-cast v0, Ltc0;

    .line 217
    .line 218
    iget-object v0, v0, Ltc0;->j:Lmc0;

    .line 219
    .line 220
    iget-object v4, p0, Lnc0;->g:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v4, Lad0;

    .line 223
    .line 224
    invoke-virtual {v0, v4}, Lmc0;->b(Lad0;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 225
    .line 226
    .line 227
    goto :goto_8

    .line 228
    :catch_1
    move-exception v0

    .line 229
    sget-object v4, Lgt0;->a:Lgt0;

    .line 230
    .line 231
    sget-object v4, Lgt0;->a:Lgt0;

    .line 232
    .line 233
    new-instance v5, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v6, "Http2Connection.Listener failure for "

    .line 236
    .line 237
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object v6, p0, Lnc0;->f:Ljava/lang/Object;

    .line 241
    .line 242
    check-cast v6, Ltc0;

    .line 243
    .line 244
    iget-object v6, v6, Ltc0;->l:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    const/4 v4, 0x4

    .line 257
    invoke-static {v4, v5, v0}, Lgt0;->i(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 258
    .line 259
    .line 260
    :try_start_8
    iget-object p0, p0, Lnc0;->g:Ljava/lang/Object;

    .line 261
    .line 262
    check-cast p0, Lad0;

    .line 263
    .line 264
    invoke-virtual {p0, v1, v0}, Lad0;->c(ILjava/io/IOException;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    .line 265
    .line 266
    .line 267
    :catch_2
    :goto_8
    return-wide v2

    .line 268
    :pswitch_1
    iget-object v0, p0, Lnc0;->f:Ljava/lang/Object;

    .line 269
    .line 270
    check-cast v0, Ltc0;

    .line 271
    .line 272
    iget-object v1, v0, Ltc0;->j:Lmc0;

    .line 273
    .line 274
    iget-object p0, p0, Lnc0;->g:Ljava/lang/Object;

    .line 275
    .line 276
    check-cast p0, Lhz0;

    .line 277
    .line 278
    iget-object p0, p0, Lhz0;->j:Ljava/lang/Object;

    .line 279
    .line 280
    check-cast p0, Lo51;

    .line 281
    .line 282
    invoke-virtual {v1, v0, p0}, Lmc0;->a(Ltc0;Lo51;)V

    .line 283
    .line 284
    .line 285
    return-wide v2

    .line 286
    nop

    .line 287
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
