.class public final Ltx0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Lxe0;

.field public volatile k:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic l:Lwx0;


# direct methods
.method public constructor <init>(Lwx0;Lxe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltx0;->l:Lwx0;

    .line 5
    .line 6
    iput-object p2, p0, Ltx0;->j:Lxe0;

    .line 7
    .line 8
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    const-string v0, "Callback failure for "

    .line 2
    .line 3
    const-string v1, "canceled due to "

    .line 4
    .line 5
    iget-object v2, p0, Ltx0;->l:Lwx0;

    .line 6
    .line 7
    iget-object v2, v2, Lwx0;->k:Lm01;

    .line 8
    .line 9
    iget-object v2, v2, Lm01;->a:Led0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const-string v3, "/..."

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    :try_start_0
    new-instance v5, Ldd0;

    .line 18
    .line 19
    invoke-direct {v5}, Ldd0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v5, v2, v3}, Ldd0;->c(Led0;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-object v5, v4

    .line 27
    :goto_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const-string v2, ""

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    const-string v7, " \"\':;<=>@[]^`{}|/\\?#"

    .line 34
    .line 35
    const/16 v8, 0xfb

    .line 36
    .line 37
    invoke-static {v2, v6, v6, v7, v8}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    iput-object v9, v5, Ldd0;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2, v6, v6, v7, v8}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    iput-object v9, v5, Ldd0;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v5}, Ldd0;->a()Led0;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    iget-object v5, v5, Led0;->h:Ljava/lang/String;

    .line 54
    .line 55
    const-string v9, "OkHttp "

    .line 56
    .line 57
    invoke-virtual {v9, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    iget-object v9, p0, Ltx0;->l:Lwx0;

    .line 62
    .line 63
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 64
    .line 65
    .line 66
    move-result-object v10

    .line 67
    invoke-virtual {v10}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v11

    .line 71
    invoke-virtual {v10, v5}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :try_start_1
    iget-object v5, v9, Lwx0;->m:Lvx0;

    .line 75
    .line 76
    invoke-virtual {v5}, Loa;->h()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .line 78
    .line 79
    :try_start_2
    invoke-virtual {v9}, Lwx0;->f()Lf11;

    .line 80
    .line 81
    .line 82
    move-result-object v5
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 83
    const/4 v12, 0x1

    .line 84
    :try_start_3
    iget-object v13, p0, Ltx0;->j:Lxe0;

    .line 85
    .line 86
    invoke-virtual {v13, v9, v5}, Lxe0;->c(Lhi;Lf11;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 87
    .line 88
    .line 89
    :try_start_4
    iget-object v0, v9, Lwx0;->j:Lmr0;

    .line 90
    .line 91
    :goto_1
    iget-object v0, v0, Lmr0;->j:Ler0;

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Ler0;->h(Ltx0;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    .line 95
    .line 96
    goto/16 :goto_7

    .line 97
    .line 98
    :catchall_0
    move-exception p0

    .line 99
    goto/16 :goto_9

    .line 100
    .line 101
    :catchall_1
    move-exception v0

    .line 102
    move v6, v12

    .line 103
    goto :goto_2

    .line 104
    :catch_1
    move-exception v1

    .line 105
    goto :goto_4

    .line 106
    :catchall_2
    move-exception v0

    .line 107
    :goto_2
    :try_start_5
    invoke-virtual {v9}, Lwx0;->c()V

    .line 108
    .line 109
    .line 110
    if-nez v6, :cond_0

    .line 111
    .line 112
    new-instance v2, Ljava/io/IOException;

    .line 113
    .line 114
    new-instance v3, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v2, v0}, Lbv;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ltx0;->j:Lxe0;

    .line 133
    .line 134
    invoke-virtual {v1, v9, v2}, Lxe0;->b(Lhi;Ljava/io/IOException;)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :catchall_3
    move-exception v0

    .line 139
    goto :goto_8

    .line 140
    :cond_0
    :goto_3
    throw v0

    .line 141
    :catch_2
    move-exception v1

    .line 142
    move v12, v6

    .line 143
    :goto_4
    if-eqz v12, :cond_2

    .line 144
    .line 145
    sget-object v5, Lgt0;->a:Lgt0;

    .line 146
    .line 147
    sget-object v5, Lgt0;->a:Lgt0;

    .line 148
    .line 149
    new-instance v12, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v12, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    iget-boolean v13, v9, Lwx0;->v:Z

    .line 157
    .line 158
    if-eqz v13, :cond_1

    .line 159
    .line 160
    const-string v13, "canceled "

    .line 161
    .line 162
    goto :goto_5

    .line 163
    :cond_1
    move-object v13, v2

    .line 164
    :goto_5
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    const-string v13, "call"

    .line 168
    .line 169
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v13, " to "

    .line 173
    .line 174
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget-object v13, v9, Lwx0;->k:Lm01;

    .line 178
    .line 179
    iget-object v13, v13, Lm01;->a:Led0;

    .line 180
    .line 181
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 182
    .line 183
    .line 184
    :try_start_6
    new-instance v14, Ldd0;

    .line 185
    .line 186
    invoke-direct {v14}, Ldd0;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v14, v13, v3}, Ldd0;->c(Led0;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 190
    .line 191
    .line 192
    move-object v4, v14

    .line 193
    :catch_3
    :try_start_7
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    .line 195
    .line 196
    invoke-static {v2, v6, v6, v7, v8}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    iput-object v3, v4, Ldd0;->b:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v2, v6, v6, v7, v8}, Lok0;->m(Ljava/lang/String;IILjava/lang/String;I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    iput-object v2, v4, Ldd0;->c:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v4}, Ldd0;->a()Led0;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    iget-object v2, v2, Led0;->h:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 229
    .line 230
    .line 231
    const/4 v2, 0x4

    .line 232
    invoke-static {v2, v0, v1}, Lgt0;->i(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 233
    .line 234
    .line 235
    goto :goto_6

    .line 236
    :cond_2
    iget-object v0, p0, Ltx0;->j:Lxe0;

    .line 237
    .line 238
    invoke-virtual {v0, v9, v1}, Lxe0;->b(Lhi;Ljava/io/IOException;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 239
    .line 240
    .line 241
    :goto_6
    :try_start_8
    iget-object v0, v9, Lwx0;->j:Lmr0;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :goto_7
    invoke-virtual {v10, v11}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :goto_8
    :try_start_9
    iget-object v1, v9, Lwx0;->j:Lmr0;

    .line 250
    .line 251
    iget-object v1, v1, Lmr0;->j:Ler0;

    .line 252
    .line 253
    invoke-virtual {v1, p0}, Ler0;->h(Ltx0;)V

    .line 254
    .line 255
    .line 256
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 257
    :goto_9
    invoke-virtual {v10, v11}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    throw p0
.end method
