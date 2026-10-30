.class public final Lc91;
.super Landroid/webkit/WebViewClient;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public static a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;
    .locals 12

    .line 1
    const-string v1, "-"

    .line 2
    .line 3
    const-string v2, "bytes "

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v3, 0x0

    .line 14
    :try_start_0
    const-string v0, "silent.mp3"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Lcg1;->p(Ljava/io/InputStream;)[B

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 28
    .line 29
    .line 30
    :goto_0
    move-object p0, v0

    .line 31
    goto :goto_1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object v4, v0

    .line 34
    :try_start_3
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 35
    :catchall_1
    move-exception v0

    .line 36
    :try_start_4
    invoke-static {p0, v4}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 40
    :catch_0
    new-array v0, v3, [B

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :goto_1
    array-length v4, p0

    .line 44
    const-string v0, "Range"

    .line 45
    .line 46
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    const-string v0, "range"

    .line 55
    .line 56
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    move-object v0, p1

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    new-instance v10, Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 66
    .line 67
    .line 68

    .line 73
    .line 74
    .line 75
    const-string p1, "Accept-Ranges"

    .line 76
    .line 77
    const-string v5, "bytes"

    .line 78
    .line 79
    invoke-virtual {v10, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string p1, "Content-Length"

    .line 83
    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    const-string v5, "bytes="

    .line 87
    .line 88
    invoke-static {v0, v5, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_3

    .line 93
    .line 94
    const/4 v5, 0x6

    .line 95
    :try_start_5
    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    filled-new-array {v1}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-static {v0, v5}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    check-cast v5, Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 114
    .line 115
    .line 116
    move-result-wide v5

    .line 117
    long-to-int v5, v5

    .line 118
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    const/4 v7, 0x1

    .line 123
    if-le v6, v7, :cond_1

    .line 124
    .line 125
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    check-cast v6, Ljava/lang/CharSequence;

    .line 130
    .line 131
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    if-lez v6, :cond_1

    .line 136
    .line 137
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 144
    .line 145
    .line 146
    move-result-wide v8

    .line 147
    long-to-int v0, v8

    .line 148
    goto :goto_2

    .line 149
    :catch_1
    move-exception v0

    .line 150
    goto :goto_4

    .line 151
    :cond_1
    add-int/lit8 v0, v4, -0x1

    .line 152
    .line 153
    :goto_2
    add-int/lit8 v6, v4, -0x1

    .line 154
    .line 155
    invoke-static {v5, v3, v6}, Lkn1;->b(III)I

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    invoke-static {v0, v5, v6}, Lkn1;->b(III)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    sub-int v6, v0, v5

    .line 164
    .line 165
    add-int/2addr v6, v7

    .line 166
    new-instance v8, Lcf0;

    .line 167
    .line 168
    invoke-direct {v8, v5, v0, v7}, Laf0;-><init>(III)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v8}, Lcf0;->isEmpty()Z

    .line 172
    .line 173
    .line 174
    move-result v9

    .line 175
    if-eqz v9, :cond_2

    .line 176
    .line 177
    new-array v3, v3, [B

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_2
    iget v3, v8, Laf0;->k:I

    .line 181
    .line 182
    add-int/2addr v3, v7

    .line 183
    invoke-static {p0, v5, v3}, Lia;->O([BII)[B

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    :goto_3
    const-string v7, "Content-Range"

    .line 188
    .line 189
    new-instance v8, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v8, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v0, "/"

    .line 204
    .line 205
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v10, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v10, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    new-instance v5, Landroid/webkit/WebResourceResponse;

    .line 226
    .line 227
    const-string v6, "audio/mpeg"

    .line 228
    .line 229
    const-string v9, "Partial Content"

    .line 230
    .line 231
    new-instance v11, Ljava/io/ByteArrayInputStream;

    .line 232
    .line 233
    invoke-direct {v11, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 234
    .line 235
    .line 236
    const/4 v7, 0x0

    .line 237
    const/16 v8, 0xce

    .line 238
    .line 239
    invoke-direct/range {v5 .. v11}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 240
    .line 241
    .line 242
    return-object v5

    .line 243
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    :cond_3
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v10, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    new-instance v5, Landroid/webkit/WebResourceResponse;

    .line 254
    .line 255
    new-instance v11, Ljava/io/ByteArrayInputStream;

    .line 256
    .line 257
    invoke-direct {v11, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 258
    .line 259
    .line 260
    const-string v6, "audio/mpeg"

    .line 261
    .line 262
    const/4 v7, 0x0

    .line 263
    const/16 v8, 0xc8

    .line 264
    .line 265
    const-string v9, "OK"

    .line 266
    .line 267
    invoke-direct/range {v5 .. v11}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 268
    .line 269
    .line 270
    return-object v5
.end method

# The request proxy is disabled: no outbound connection is opened on behalf
# of the page.
.method public static b(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 24

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-super/range {p0 .. p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    # Diagnostics: without this mark the stage chain cannot tell "the page never
    # finished loading" from "the shell never ran". Values only, no page data.
    const-string v2, "page-finished"

    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "about:blank"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_14

    .line 21
    .line 22
    const-string v2, "chrome-error://"

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-static {v1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    goto/16 :goto_5

    .line 32
    .line 33
    :cond_0
    # Official account host: reset any stale login state without touching the
    # WebView session data. Cookies and storage are preserved so the official
    # login flow can still use the existing session.
    const-string v2, "accounts.spotify.com"

    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    sput-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    const-string v4, "LoggedIn"

    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_3
    # Leaving the player host with a stale logged-in flag also resets it: the
    # persisted marker is cleared and the in-memory flag starts unconfirmed.
    const-string v5, "LoggedIn"

    const-string v6, "open.spotify.com"

    invoke-static {v1, v6, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    if-eqz v2, :cond_4

    sput-boolean v3, Lcom/melodix/music/AppSingleton;->B:Z

    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v5, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Lm9;->k()V

    :cond_4
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    .line 119
    .line 120
    const-string v5, "/login"

    .line 121
    .line 122
    # A persisted session can land directly on Spotify home; use the existing splash-dismiss path after load.
    if-eqz v2, :cond_15

    const-string v2, "open.spotify.com"

    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :cond_5

    :cond_15
    .line 123
    .line 124
    invoke-static {v1, v5, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_5

    .line 129
    .line 130
    const-string v2, "/auth"

    .line 131
    .line 132
    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-nez v2, :cond_5

    .line 137
    .line 138
    const-string v2, "accounts.spotify.com"

    .line 139
    .line 140
    invoke-static {v1, v2, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_7

    .line 145
    .line 146
    :cond_5
    # A completed Spotify login/home document supersedes any stale splash error from startup or a failed redirect.
    const/4 v8, 0x0

    sput-boolean v8, Lcom/melodix/music/AppSingleton;->m:Z

    const/4 v8, -0x1

    sput v8, Lcom/melodix/music/AppSingleton;->n:I

    sget-object v2, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 147
    .line 148
    if-eqz v2, :cond_7

    .line 149
    .line 150
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lcom/melodix/music/MainActivity;

    .line 155
    .line 156
    if-eqz v2, :cond_7

    # A successful page load must also clear the loading indicator before dismissing the native splash.
    iget-object v9, v2, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    if-eqz v9, :cond_16

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    :cond_16
    sget-boolean v8, Lcom/melodix/music/AppSingleton;->m:Z

    .line 159
    .line 160
    if-eqz v8, :cond_6

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_6
    new-instance v8, Lzk0;

    .line 164
    .line 165
    invoke-direct {v8, v2, v7, v7}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2, v8}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 169
    .line 170
    .line 171
    :cond_7
    :goto_0
    invoke-static {v1}, Ldl1;->l(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    const/4 v8, 0x0

    .line 176
    if-eqz v2, :cond_8

    .line 177
    .line 178
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 179
    .line 180
    const-string v2, "google_spoof.js"

    .line 181
    .line 182
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v0, v2, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 187
    .line 188
    .line 189
    :cond_8
    const-string v2, "https://www.facebook.com/privacy/consent/gdp/"

    .line 190
    .line 191
    invoke-static {v1, v2, v3}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-eqz v2, :cond_9

    .line 196
    .line 197
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 198
    .line 199
    const-string v2, "facebook_consent.js"

    .line 200
    .line 201
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v0, v2, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_9
    invoke-static {v1, v5, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-eqz v2, :cond_a

    .line 214
    .line 215
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 216
    .line 217
    const-string v2, "classic_login.js"

    .line 218
    .line 219
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v0, v2, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 224
    .line 225
    .line 226
    :cond_a
    :goto_1
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    .line 227
    .line 228
    if-nez v2, :cond_b

    .line 229
    .line 230
    const-string v2, "(function() {if(window.__sfPlayerNavDone)return;var l=document.querySelector('button[data-testid=web-player-link],a[data-testid=web-player-link]');if(!l)return;window.__sfPlayerNavDone=1;try{AndBridge.loginDetected();}catch(e){}try{l.click();}catch(e){}setTimeout(function(){if(document.querySelector('#main-view'))return;var a=l.closest?l.closest('a'):null;var h=(a&&a.getAttribute('href'))||l.getAttribute('href')||'';var t=(h&&(h.indexOf('http')===0||h.charAt(0)==='/'))?h:'https://open.spotify.com/app';try{AndBridge.logDiagEvent('player-cta nav');}catch(e){}try{window.location.assign(t);}catch(e){}},2500);})();"

    .line 231
    .line 232
    invoke-virtual {v0, v2, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v1, v6, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-nez v1, :cond_b

    .line 240
    .line 241
    goto/16 :goto_5

    .line 242
    .line 243
    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 252
    .line 253
    int-to-float v2, v2

    .line 254
    iget v5, v1, Landroid/util/DisplayMetrics;->density:F

    .line 255
    .line 256
    div-float/2addr v2, v5

    .line 257
    float-to-int v2, v2

    .line 258
    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 259
    .line 260
    int-to-float v1, v1

    .line 261
    div-float/2addr v1, v5

    .line 262
    float-to-int v1, v1

    .line 263
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->F:Z

    .line 264
    .line 265
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    sget-object v10, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 270
    .line 271
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 272
    .line 273
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 274
    .line 275
    .line 276
    move-result-object v11

    .line 277
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->R:Z

    .line 278
    .line 279
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 280
    .line 281
    .line 282
    move-result-object v12

    .line 283
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->E:Z

    .line 284
    .line 285
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 286
    .line 287
    .line 288
    move-result-object v13

    .line 289
    sget-object v14, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    .line 290
    .line 291
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->D:Z

    .line 292
    .line 293
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 294
    .line 295
    .line 296
    move-result-object v15

    .line 297
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->C:Z

    .line 298
    .line 299
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 300
    .line 301
    .line 302
    move-result-object v16

    .line 303
    sget v5, Lcom/melodix/music/AppSingleton;->j:I

    .line 304
    .line 305
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    const v6, 0x7f110116

    .line 310
    .line 311
    .line 312
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v17

    # Report native touchscreen capability so desktop UA spoofing cannot hide tablet touch input.
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v5
    const-string v6, "android.hardware.touchscreen"
    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    move-result v6
    const-string v3, "android.software.leanback"
    invoke-virtual {v5, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :sf_touch_configured
    const/4 v6, 0x0
    :sf_touch_configured
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v23

    .line 316
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->T:Z

    .line 317
    .line 318
    const-string v6, "bigwindow"

    .line 319
    .line 320
    if-nez v5, :cond_c

    .line 321
    .line 322
    sget-object v5, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 323
    .line 324
    invoke-static {v5, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    if-eqz v5, :cond_d

    .line 329
    .line 330
    :cond_c
    move v3, v7

    .line 331
    :cond_d
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 332
    .line 333
    .line 334
    move-result-object v18

    .line 335
    sget v3, Lcom/melodix/music/AppSingleton;->U:I

    .line 336
    .line 337
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 338
    .line 339
    .line 340
    move-result-object v19

    .line 341
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v20

    .line 345
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 346
    .line 347
    .line 348
    move-result-object v21

    .line 349
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->S:Z

    .line 350
    .line 351
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object v22

    .line 355
    filled-new-array/range {v9 .. v23}, [Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    const/16 v2, 0xf

    .line 360
    .line 361
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    const-string v2, "window.SF_CONFIG = { isAndAutoEnabled: %b, guiMode: \'%s\', isCanvasDisabled: %b, isFullScreenEnabled: %b, isAmoled: %b, autoPlayMode: \'%s\', closeNowPlay: %b, takeControl: %b, closeLibText: \'%s\', hideStatusBar: %b, statusBarHeight: %d, screenWidth: %d, screenHeight: %d, dockLeftSidebar: %b, touchInput: %b };"

    .line 366
    .line 367
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    const-string v2, "desktop_spoof.js"

    .line 372
    .line 373
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    const-string v3, "spotify_bridge.js"

    .line 378
    .line 379
    invoke-static {v3}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    new-instance v5, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    # Keep the native shell entry point separate from remotely hotfixed Spotify behavior.
    # The shell is injected first: it owns the loader that executes the bridge.
    const-string v5, "native_ui_shell.js"
    invoke-static {v5}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v0, v5, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    # The shell is now queued in the page: the next stage in the chain tells
    # whether the injection happened at all on this device.
    const-string v5, "shell-injected"

    invoke-static {v5}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    # spotify_bridge.js is ~200 KB. A single evaluateJavascript call of that size
    # is dropped without any error on device (the bridge never started, so every
    # pause guard stayed inactive). The shell therefore reads the asset through
    # AndBridge.readBundledAsset and executes it in small steps instead.
    # v3 still holds the bridge text: reading it here keeps the asset cache warm.
    const-string v5, "(window.__sfLoadBundledBridge||function(){})(\'spotify_bridge.js\');"
    invoke-virtual {v0, v5, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    # P0 CONTENT STUCK: probe the page from the Android side - works even
    # when page scripts never start and WebView JS timers stay paused.
    invoke-static {v0}, Lcom/melodix/music/AndBridge;->runProbe(Landroid/webkit/WebView;)V

    const/4 v1, 0x0

    const/16 v2, 0xbb8

    invoke-static {v0, v1, v2}, Lcom/melodix/music/AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V

    # Early native fallback: if 15s later the wrapper is still showing, force
    # the player entry (bounded inside AndBridgeProbe, no loops possible).
    const/4 v1, 0x1

    const/16 v2, 0x3a98

    invoke-static {v0, v1, v2}, Lcom/melodix/music/AndBridge;->scheduleProbe(Landroid/webkit/WebView;II)V

    .line 399
    .line 400
    .line 401
    const-string v1, "playlist_sort.js"

    .line 402
    .line 403
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 408
    .line 409
    .line 410
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 411
    .line 412
    const-string v2, "csshack"

    .line 413
    .line 414
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    const-string v2, "css_hacks.css"

    .line 419
    .line 420
    if-nez v1, :inject_full_css

    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;
    const-string v3, "bigwindow"
    invoke-static {v1, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_12

    :inject_full_css
    .line 421
    .line 422
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->E:Z

    .line 427
    .line 428
    if-eqz v2, :cond_e

    .line 429
    .line 430
    const-string v4, ".encore-dark-theme{--background-base:#000;--background-highlight:#000;--background-elevated-base:#000;--background-elevated-highlight:#000;--background-elevated-press:#000;--background-tinted-base:#000} aside[data-testid=now-playing-bar]{background:#000!important;box-shadow:none;border-top:1px solid #666}"

    .line 431
    .line 432
    :cond_e
    new-instance v2, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    const-string v3, "document.body.classList.remove(\'sf-canvas-blur\', \'sf-video-bg\', \'sf-fullscreen-enabled\', \'sf-fullscreen-disabled\', \'sf-hide-canvas\', \'sf-statusbar-hidden\');"

    .line 435
    .line 436
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 440
    .line 441
    if-eqz v3, :cond_f

    .line 442
    .line 443
    const-string v3, "document.body.classList.add(\'sf-canvas-blur\', \'sf-hide-canvas\');"

    .line 444
    .line 445
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    goto :goto_2

    .line 449
    :cond_f
    const-string v3, "document.body.classList.add(\'sf-video-bg\');"

    .line 450
    .line 451
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    :goto_2
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->R:Z

    .line 455
    .line 456
    if-eqz v3, :cond_10

    .line 457
    .line 458
    const-string v3, "document.body.classList.add(\'sf-fullscreen-enabled\');"

    .line 459
    .line 460
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    goto :goto_3

    .line 464
    :cond_10
    const-string v3, "document.body.classList.add(\'sf-fullscreen-disabled\');"

    .line 465
    .line 466
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    :goto_3
    sget-boolean v3, Lcom/melodix/music/AppSingleton;->T:Z

    .line 470
    .line 471
    if-eqz v3, :cond_11

    .line 472
    .line 473
    const-string v3, "document.body.classList.add(\'sf-statusbar-hidden\');"

    .line 474
    .line 475
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    :cond_11
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v3

    .line 486
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v2

    .line 490
    filled-new-array {v1, v3, v2}, [Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    const/4 v2, 0x3

    .line 495
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    const-string v2, "(function() {  let style = document.getElementById(\'sf-custom-style\');  if(!style) { style = document.createElement(\'style\'); style.id = \'sf-custom-style\'; document.head.appendChild(style); }  style.textContent = %s + %s;  %s})();"

    .line 500
    .line 501
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v1

    .line 505
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v2, "css_hacks.css"

    .line 506
    .line 507
    .line 508
    goto :cond_12

    .line 509
    :cond_12
    sget-object v1, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 510
    .line 511
    invoke-static {v1, v6}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result v1

    .line 515
    if-eqz v1, :cond_13

    .line 516
    .line 517
    invoke-static {v2}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    const-string v2, "/* SF_TV_FOCUS_START */"

    .line 522
    .line 523
    invoke-static {v1, v2, v4}, Lda1;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 528
    .line 529
    .line 530
    move-result v2

    .line 531
    if-lez v2, :cond_13

    .line 532
    .line 533
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    new-instance v2, Ljava/lang/StringBuilder;

    .line 538
    .line 539
    const-string v3, "(function() {  var s = document.getElementById(\'sf-tv-focus\');  if (!s) { s = document.createElement(\'style\'); s.id = \'sf-tv-focus\'; document.head.appendChild(s); }  s.textContent = "

    .line 540
    .line 541
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    const-string v1, ";})();"

    .line 548
    .line 549
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    invoke-virtual {v0, v1, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 557
    .line 558
    .line 559
    :cond_13
    :goto_4
    # Preview-only DOM diagnostic; the helper rejects all packages/origins except the test Preview and open.spotify.com.
    invoke-static/range {p1 .. p2}, Lcom/melodix/music/RuntimeDiagnostic;->runIfPreview(Landroid/webkit/WebView;Ljava/lang/String;)V

    sget-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 560
    .line 561
    invoke-static {v0}, Lm9;->h(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    :cond_14
    :goto_5
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    # Network diagnostics: remember the last top-level URL (never logged).
    move-object v0, p2

    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    # The JavascriptInterface stays bound only to real Spotify top-level
    # pages (host open.spotify.com, default or 443 port): any other page
    # keeps the bridge detached.
    const-string v2, "open.spotify.com"

    if-eqz p2, :bridge_detach

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :bridge_detach

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :bridge_detach

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v1

    const/4 v0, -0x1

    if-eq v1, v0, :bridge_attach

    const/16 v0, 0x1bb

    if-eq v1, v0, :bridge_attach

    goto :bridge_detach

    :bridge_attach
    if-eqz p1, :bridge_done

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/AndBridge;

    invoke-direct {v1, v0}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V

    const-string v2, "AndBridge"

    invoke-virtual {p1, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    goto :bridge_done

    :bridge_detach
    if-eqz p1, :bridge_done

    const-string v2, "AndBridge"

    invoke-virtual {p1, v2}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    :bridge_done

    if-eqz p1, :watchdog_skipped
    invoke-static {p1}, Lcom/melodix/music/StartupLoadWatchdog;->arm(Landroid/webkit/WebView;)V
    :watchdog_skipped

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ldl1;->l(Ljava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p3, 0x0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p2, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    if-eqz p1, :cond_3

    .line 25
    .line 26
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 27
    .line 28
    const-string p0, "google_spoof.js"

    .line 29
    .line 30
    invoke-static {p0}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0, p3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    if-eqz p2, :cond_3

    .line 39
    .line 40
    const-string p0, "chrome-error://"

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-static {p2, p0, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_3

    .line 48
    .line 49
    const-string p0, "about:blank"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 60
    .line 61
    const-string p0, "desktop_spoof.js"

    .line 62
    .line 63
    invoke-static {p0}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0, p3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    if-eqz p1, :cond_3

    .line 71
    .line 72
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 73
    .line 74
    const-string p0, "playlist_sort.js"

    .line 75
    .line 76
    invoke-static {p0}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0, p3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 58
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x3

    if-ne p2, p0, :cond_0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    const/4 p1, 0x1

    if-eqz p4, :cond_1

    .line 59
    const-string p2, "open.spotify.com"

    .line 60
    invoke-static {p4, p2, p0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result p2

    if-ne p2, p1, :cond_1

    goto :goto_0

    :cond_1
    if-eqz p4, :cond_2

    .line 61
    const-string p2, "accounts.spotify.com"

    .line 62
    invoke-static {p4, p2, p0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result p0

    if-ne p0, p1, :cond_2

    .line 63
    :goto_0
    :cond_2
    :goto_1
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p1, p0

    .line 13
    :goto_0
    if-eqz p3, :cond_1

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    :cond_1
    :cond_2
    const/4 p2, -0x3

    .line 32
    if-ne p0, p2, :cond_3

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    if-eqz p1, :cond_4

    .line 36
    .line 37

    .line 41
    .line 42
    sget-object p1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/melodix/music/MainActivity;

    .line 51
    .line 52
    if-eqz p1, :cond_4

    iget-object p2, p1, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz p2, :skip_progressbar_hide
    const/16 p3, 0x8
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V
    :skip_progressbar_hide

    .line 53
    .line 54
    const-string p2, "WebView error code: "

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p2, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    if-eqz p2, :diag_text

    const-string p3, "\nSource: "

    invoke-virtual {p3, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :diag_text
    iget-object p2, p1, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    if-eqz p2, :diag_shown

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :diag_shown
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Lcom/melodix/music/MainActivity;->D(Z)V

    .line 55
    .line 56
    .line 57
    :cond_4
    :goto_1
    return-void
.end method

.method public final onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 p1, 0x1

    .line 11
    if-ne p0, p1, :cond_1

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    const/16 p2, 0x190

    .line 29
    .line 30
    if-lt p0, p2, :cond_1

    .line 31
    .line 32

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 19
    .line 20
    and-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Li1;->r(Landroid/webkit/RenderProcessGoneDetail;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 p1, 0x1d

    .line 9
    .line 10
    if-lt p0, p1, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-static {p2}, Li1;->B(Landroid/webkit/RenderProcessGoneDetail;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 18
    .line 19
    invoke-static {}, Lm9;->b()V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    new-instance p1, Ls4;

    .line 35
    .line 36
    const/16 p2, 0xb

    .line 37
    .line 38
    invoke-direct {p1, p0, p2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    const/4 p0, 0x1

    .line 45
    return p0
.end method

# Request interception is disabled: the WebView loads pages through its own
# stack. Nothing is proxied, and no cookie is read or written here.
.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_4

    .line 3
    .line 4
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {v1}, Ldl1;->l(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_3

    .line 22
    .line 23
    const-string v2, "/oauth"

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    const-string v2, "/v2/auth"

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    const-string v2, "/signin"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    :cond_1
    # Local https routing: the authority and the standard https port are
    # checked here, and the runtime state file is served in place. The login
    # URL is never rewritten anymore.
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p0

    const/16 v5, 0x1bb

    const-string v2, "runtime_state.js"

    move-object p0, v1

    :cond_2
    const/4 p0, 0x1

    .line 87
    return p0

    .line 88
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_4
    :goto_0
    return v0
.end method
