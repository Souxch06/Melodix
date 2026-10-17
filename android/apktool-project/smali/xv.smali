.class public final synthetic Lxv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p5, p0, Lxv;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lxv;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, Lxv;->l:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p3, p0, Lxv;->m:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object p4, p0, Lxv;->n:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget v0, p0, Lxv;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lxv;->n:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v4, p0, Lxv;->m:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object v5, p0, Lxv;->l:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lxv;->k:Ljava/lang/Object;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    check-cast p0, Lnm;

    .line 17
    .line 18
    check-cast v5, Ljava/lang/String;

    .line 19
    .line 20
    check-cast v4, Ljava/util/Map;

    .line 21
    .line 22
    check-cast v3, Ljava/util/List;

    .line 23
    .line 24
    iget-object v0, p0, Lnm;->j:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Lwn0;

    .line 27
    .line 28
    iget-object p0, p0, Lnm;->p:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p0, Ljava/util/concurrent/atomic/AtomicMarkableReference;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    check-cast v6, Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v6, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicMarkableReference;->getReference()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/String;

    .line 45
    .line 46
    iget-object v6, v0, Lwn0;->a:Lm30;

    .line 47
    .line 48
    const-string v7, "user-data"

    .line 49
    .line 50
    invoke-virtual {v6, v5, v7}, Lm30;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    :try_start_0
    new-instance v7, Lvn0;

    .line 55
    .line 56
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v8, "userId"

    .line 60
    .line 61
    invoke-virtual {v7, v8, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v7, Ljava/io/BufferedWriter;

    .line 69
    .line 70
    new-instance v8, Ljava/io/OutputStreamWriter;

    .line 71
    .line 72
    new-instance v9, Ljava/io/FileOutputStream;

    .line 73
    .line 74
    invoke-direct {v9, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 75
    .line 76
    .line 77
    sget-object v6, Lwn0;->b:Ljava/nio/charset/Charset;

    .line 78
    .line 79
    invoke-direct {v8, v9, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 80
    .line 81
    .line 82
    invoke-direct {v7, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 83
    .line 84
    .line 85
    :try_start_1
    invoke-virtual {v7, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    .line 90
    .line 91
    invoke-static {v7}, Lml;->i(Ljava/io/Closeable;)V

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    move-object v2, v7

    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-object v2, v7

    .line 99
    goto :goto_1

    .line 100
    :catchall_1
    move-exception p0

    .line 101
    :goto_0
    invoke-static {v2}, Lml;->i(Ljava/io/Closeable;)V

    .line 102
    .line 103
    .line 104
    throw p0

    .line 105
    :catch_1
    :goto_1
    invoke-static {v2}, Lml;->i(Ljava/io/Closeable;)V

    .line 106
    .line 107
    .line 108
    :cond_0
    :goto_2
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-nez p0, :cond_1

    .line 113
    .line 114
    invoke-virtual {v0, v5, v4, v1}, Lwn0;->h(Ljava/lang/String;Ljava/util/Map;Z)V

    .line 115
    .line 116
    .line 117
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_2

    .line 122
    .line 123
    invoke-virtual {v0, v5, v3}, Lwn0;->i(Ljava/lang/String;Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    return-void

    .line 127
    :pswitch_0
    check-cast p0, Le2;

    .line 128
    .line 129
    check-cast v5, Landroid/content/Context;

    .line 130
    .line 131
    check-cast v4, Lcom/melodix/music/SettingsActivity$a;

    .line 132
    .line 133
    check-cast v3, Landroidx/preference/Preference;

    .line 134
    .line 135
    if-eqz p0, :cond_3

    .line 136
    .line 137
    iget-object p0, p0, Le2;->b:Ljava/lang/String;

    .line 138
    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v2, "Saved profile: "

    .line 142
    .line 143
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v5, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 158
    .line 159
    .line 160
    invoke-static {v4, v3}, Lcom/melodix/music/SettingsActivity$a;->R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_3
    const-string p0, "No active Spotify login session found to save"

    .line 165
    .line 166
    const/4 v0, 0x1

    .line 167
    invoke-static {v5, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 172
    .line 173
    .line 174
    :goto_3
    return-void

    .line 175
    :pswitch_1
    check-cast p0, Lzv;

    .line 176
    .line 177
    check-cast v5, Lqf;

    .line 178
    .line 179
    iget-object v0, v5, Lqf;->a:Ljava/lang/String;

    .line 180
    .line 181
    check-cast v4, Lyd1;

    .line 182
    .line 183
    check-cast v3, Lle;

    .line 184
    .line 185
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    .line 187
    .line 188
    sget-object v1, Lzv;->f:Ljava/util/logging/Logger;

    .line 189
    .line 190
    const-string v6, "Transport backend \'"

    .line 191
    .line 192
    :try_start_2
    iget-object v7, p0, Lzv;->c:Lyn0;

    .line 193
    .line 194
    invoke-virtual {v7, v0}, Lyn0;->a(Ljava/lang/String;)Lpd1;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    if-nez v7, :cond_4

    .line 199
    .line 200
    new-instance p0, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    invoke-direct {p0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v0, "\' is not registered"

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {v1, p0}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 221
    .line 222
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-interface {v4, v0}, Lyd1;->b(Ljava/lang/Exception;)V

    .line 226
    .line 227
    .line 228
    goto :goto_5

    .line 229
    :catch_2
    move-exception p0

    .line 230
    goto :goto_4

    .line 231
    :cond_4
    check-cast v7, Lhj;

    .line 232
    .line 233
    invoke-virtual {v7, v3}, Lhj;->a(Lle;)Lle;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iget-object v3, p0, Lzv;->e:Lh21;

    .line 238
    .line 239
    new-instance v6, Lgn;

    .line 240
    .line 241
    const/4 v7, 0x2

    .line 242
    invoke-direct {v6, p0, v5, v0, v7}, Lgn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v3, v6}, Lh21;->r(Lfb1;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    invoke-interface {v4, v2}, Lyd1;->b(Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 249
    .line 250
    .line 251
    goto :goto_5

    .line 252
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    const-string v2, "Error scheduling event "

    .line 255
    .line 256
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {v1, v0}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-interface {v4, p0}, Lyd1;->b(Ljava/lang/Exception;)V

    .line 274
    .line 275
    .line 276
    :goto_5
    return-void

    .line 277
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
