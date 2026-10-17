.class public final synthetic Lvm;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lvm;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lvm;->b:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lvm;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object p0, p0, Lvm;->b:Ljava/lang/Object;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast p0, Lorg/chromium/support_lib_boundary/WebViewRendererBoundaryInterface;

    .line 11
    .line 12
    new-instance v0, Lnj1;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p0, v0, Lnj1;->a:Lorg/chromium/support_lib_boundary/WebViewRendererBoundaryInterface;

    .line 18
    .line 19
    return-object v0

    .line 20
    :pswitch_0
    check-cast p0, Lxn0;

    .line 21
    .line 22
    iget-object p0, p0, Lxn0;->l:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Ldn;

    .line 25
    .line 26
    iget-object v0, p0, Ldn;->e:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ldb2;

    .line 29
    .line 30
    iget-object p0, p0, Ldn;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Lo61;

    .line 33
    .line 34
    invoke-static {}, Lc9;->i()V

    .line 35
    .line 36
    .line 37
    :try_start_0
    invoke-static {p0}, Ldb2;->d(Lo61;)Ljava/util/HashMap;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v0, v0, Ldb2;->j:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v3, Lc9;

    .line 44
    .line 45
    invoke-direct {v3, v0, v1}, Lc9;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "User-Agent"

    .line 49
    .line 50
    const-string v4, "Crashlytics Android SDK/20.0.5"

    .line 51
    .line 52
    invoke-virtual {v3, v0, v4}, Lc9;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string v0, "X-CRASHLYTICS-DEVELOPER-TOKEN"

    .line 56
    .line 57
    const-string v4, "470fa2b4ae81cd56ecbcda9735803434cec591fa"

    .line 58
    .line 59
    invoke-virtual {v3, v0, v4}, Lc9;->C(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v3, p0}, Ldb2;->c(Lc9;Lo61;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Lc9;->p()Lf4;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget v0, p0, Lf4;->b:I

    .line 73
    .line 74
    const/16 v1, 0xc8

    .line 75
    .line 76
    if-eq v0, v1, :cond_0

    .line 77
    .line 78
    const/16 v1, 0xc9

    .line 79
    .line 80
    if-eq v0, v1, :cond_0

    .line 81
    .line 82
    const/16 v1, 0xca

    .line 83
    .line 84
    if-eq v0, v1, :cond_0

    .line 85
    .line 86
    const/16 v1, 0xcb

    .line 87
    .line 88
    if-ne v0, v1, :cond_1

    .line 89
    .line 90
    :cond_0
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 97
    .line 98
    .line 99
    move-object v2, v0

    .line 100
    :catch_0
    :cond_1
    return-object v2

    .line 101
    :pswitch_1
    check-cast p0, Lyz0;

    .line 102
    .line 103
    const-string v0, "firebase"

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Lyz0;->b(Ljava/lang/String;)Lv40;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :pswitch_2
    check-cast p0, Lsr;

    .line 111
    .line 112
    iget-object p0, p0, Lsr;->g:Lor;

    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lc9;->h()V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lor;->c:Ls7;

    .line 121
    .line 122
    iget-object v3, v0, Ls7;->l:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v3, Lm30;

    .line 125
    .line 126
    iget-object v4, v0, Ls7;->k:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v4, Ljava/lang/String;

    .line 129
    .line 130
    new-instance v5, Ljava/io/File;

    .line 131
    .line 132
    iget-object v3, v3, Lm30;->l:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v3, Ljava/io/File;

    .line 135
    .line 136
    invoke-direct {v5, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    const/4 v5, 0x1

    .line 144
    if-nez v3, :cond_3

    .line 145
    .line 146
    iget-object v0, p0, Lor;->m:Li7;

    .line 147
    .line 148
    iget-object v0, v0, Li7;->k:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast v0, Lxs;

    .line 151
    .line 152
    invoke-virtual {v0}, Lxs;->c()Ljava/util/NavigableSet;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_2

    .line 161
    .line 162
    invoke-interface {v0}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    move-object v2, v0

    .line 167
    check-cast v2, Ljava/lang/String;

    .line 168
    .line 169
    :cond_2
    if-eqz v2, :cond_4

    .line 170
    .line 171
    iget-object p0, p0, Lor;->j:Ltr;

    .line 172
    .line 173
    invoke-virtual {p0}, Ltr;->c()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_4

    .line 178
    .line 179
    :goto_0
    move v1, v5

    .line 180
    goto :goto_1

    .line 181
    :cond_3
    iget-object p0, v0, Ls7;->l:Ljava/lang/Object;

    .line 182
    .line 183
    check-cast p0, Lm30;

    .line 184
    .line 185
    new-instance v0, Ljava/io/File;

    .line 186
    .line 187
    iget-object p0, p0, Lm30;->l:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast p0, Ljava/io/File;

    .line 190
    .line 191
    invoke-direct {v0, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_4
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    return-object p0

    .line 203
    :pswitch_3
    check-cast p0, Lnn;

    .line 204
    .line 205
    monitor-enter p0

    .line 206
    :try_start_2
    iget-object v0, p0, Lnn;->a:Landroid/content/Context;

    .line 207
    .line 208
    iget-object v3, p0, Lnn;->b:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v0, v3}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 211
    .line 212
    .line 213
    move-result-object v0
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 214
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->available()I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    new-array v4, v3, [B

    .line 219
    .line 220
    invoke-virtual {v0, v4, v1, v3}, Ljava/io/FileInputStream;->read([BII)I

    .line 221
    .line 222
    .line 223
    new-instance v1, Ljava/lang/String;

    .line 224
    .line 225
    const-string v3, "UTF-8"

    .line 226
    .line 227
    invoke-direct {v1, v4, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance v3, Lorg/json/JSONObject;

    .line 231
    .line 232
    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v3}, Lzm;->a(Lorg/json/JSONObject;)Lzm;

    .line 236
    .line 237
    .line 238
    move-result-object v2
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 239
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 240
    .line 241
    .line 242
    monitor-exit p0

    .line 243
    goto :goto_6

    .line 244
    :catchall_0
    move-exception v0

    .line 245
    goto :goto_4

    .line 246
    :catchall_1
    move-exception v1

    .line 247
    move-object v2, v0

    .line 248
    goto :goto_2

    .line 249
    :catchall_2
    move-exception v1

    .line 250
    goto :goto_2

    .line 251
    :catch_1
    move-object v0, v2

    .line 252
    goto :goto_3

    .line 253
    :goto_2
    if-eqz v2, :cond_5

    .line 254
    .line 255
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 256
    .line 257
    .line 258
    :cond_5
    throw v1

    .line 259
    :catch_2
    :goto_3
    if-eqz v0, :cond_6

    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 262
    .line 263
    .line 264
    goto :goto_5

    .line 265
    :goto_4
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 266
    throw v0

    .line 267
    :cond_6
    :goto_5
    monitor-exit p0

    .line 268
    :goto_6
    return-object v2

    .line 269
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
