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
    const-string p1, "Access-Control-Allow-Origin"

    .line 69
    .line 70
    const-string v5, "*"

    .line 71
    .line 72
    invoke-virtual {v10, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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

.method public static b(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 12

    .line 1
    const-string v0, "*"

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v3, 0x0

    .line 19
    :try_start_0
    new-instance v4, Ljava/net/URL;

    .line 20
    .line 21
    invoke-direct {v4, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/net/URLConnection;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 38
    .line 39
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-nez p0, :cond_0

    .line 44
    .line 45
    const-string p0, "GET"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    move-object p0, v0

    .line 50
    goto/16 :goto_6

    .line 51
    .line 52
    :cond_0
    :goto_0
    invoke-virtual {v1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    invoke-virtual {v1, p0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 57
    .line 58
    .line 59
    const/16 p0, 0x1388

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 62
    .line 63
    .line 64
    const/16 p0, 0x2710

    .line 65
    .line 66
    invoke-virtual {v1, p0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    const/4 v4, 0x0

    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Ljava/util/Map$Entry;

    .line 92
    .line 93
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    check-cast v5, Ljava/lang/String;

    .line 98
    .line 99
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 109
    .line 110
    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    const-string v7, "host"

    .line 118
    .line 119
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    if-nez v7, :cond_1

    .line 124
    .line 125
    const-string v7, "x-requested-with"

    .line 126
    .line 127
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    if-nez v7, :cond_1

    .line 132
    .line 133
    const-string v7, "sec-ch-ua"

    .line 134
    .line 135
    invoke-static {v6, v7, v4}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-nez v4, :cond_1

    .line 140
    .line 141
    invoke-virtual {v1, v5, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    const-string p0, "User-Agent"

    .line 146
    .line 147
    const-string v2, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    .line 148
    .line 149
    invoke-virtual {v1, p0, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 153
    .line 154
    .line 155
    move-result v8

    .line 156
    new-instance v10, Ljava/util/HashMap;

    .line 157
    .line 158
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 159
    .line 160
    .line 161
    const-string p0, "Access-Control-Allow-Origin"

    .line 162
    .line 163
    invoke-virtual {v10, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    const-string p0, "Access-Control-Allow-Methods"

    .line 167
    .line 168
    const-string v2, "GET, HEAD, OPTIONS"

    .line 169
    .line 170
    invoke-virtual {v10, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    const-string p0, "Access-Control-Allow-Headers"

    .line 174
    .line 175
    invoke-virtual {v10, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 183
    .line 184
    .line 185
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    :cond_3
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_5

    .line 198
    .line 199
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Ljava/util/Map$Entry;

    .line 204
    .line 205
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Ljava/lang/String;

    .line 210
    .line 211
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ljava/util/List;

    .line 216
    .line 217
    if-eqz v2, :cond_3

    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    .line 221
    .line 222
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v5

    .line 226
    if-nez v5, :cond_3

    .line 227
    .line 228
    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 229
    .line 230
    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    sparse-switch v6, :sswitch_data_0

    .line 242
    .line 243
    .line 244
    goto :goto_2

    .line 245
    :sswitch_0
    const-string v6, "accept-ranges"

    .line 246
    .line 247
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-eqz v5, :cond_3

    .line 252
    .line 253
    goto :goto_3

    .line 254
    :sswitch_1
    const-string v6, "content-type"

    .line 255
    .line 256
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    if-nez v5, :cond_4

    .line 261
    .line 262
    goto :goto_2

    .line 263
    :sswitch_2
    const-string v6, "content-length"

    .line 264
    .line 265
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    if-nez v5, :cond_4

    .line 270
    .line 271
    goto :goto_2

    .line 272
    :sswitch_3
    const-string v6, "content-range"

    .line 273
    .line 274
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v5

    .line 278
    if-nez v5, :cond_4

    .line 279
    .line 280
    goto :goto_2

    .line 281
    :cond_4
    :goto_3
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v10, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    goto :goto_2

    .line 289
    :cond_5
    invoke-virtual {v1}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    if-nez p0, :cond_6

    .line 294
    .line 295
    const-string p0, "audio/mpeg"

    .line 296
    .line 297
    :cond_6
    const-string v0, ";"

    .line 298
    .line 299
    filled-new-array {v0}, [Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {p0, v0}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    check-cast p0, Ljava/lang/String;

    .line 312
    .line 313
    invoke-static {p0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v6

    .line 321
    const/16 p0, 0xc8

    .line 322
    .line 323
    if-gt p0, v8, :cond_7

    .line 324
    .line 325
    const/16 p0, 0x12c

    .line 326
    .line 327
    if-ge v8, p0, :cond_7

    .line 328
    .line 329
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    :goto_4
    move-object v11, p0

    .line 334
    goto :goto_5

    .line 335
    :cond_7
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    goto :goto_4

    .line 340
    :goto_5
    if-nez v11, :cond_8

    .line 341
    .line 342
    return-object v3

    .line 343
    :cond_8
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    if-nez p0, :cond_9

    .line 348
    .line 349
    const-string p0, "OK"

    .line 350
    .line 351
    :cond_9
    move-object v9, p0

    .line 352
    new-instance v5, Landroid/webkit/WebResourceResponse;

    .line 353
    .line 354
    const/4 v7, 0x0

    .line 355
    invoke-direct/range {v5 .. v11}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    .line 357
    .line 358
    return-object v5

    .line 359
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    return-object v3

    .line 363
    :sswitch_data_0
    .sparse-switch
        -0x546f7d17 -> :sswitch_3
        -0x4384d946 -> :sswitch_2
        0x2ed4600e -> :sswitch_1
        0x53476b3b -> :sswitch_0
    .end sparse-switch
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
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v4, ""

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    move-object v2, v4

    .line 46
    :cond_1
    const-string v5, "sp_dc="

    .line 47
    .line 48
    invoke-static {v2, v5, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const-string v5, "LoggedIn"

    .line 53
    .line 54
    const-string v6, "open.spotify.com"

    .line 55
    .line 56
    const/4 v7, 0x1

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    .line 60
    .line 61
    if-nez v2, :cond_2

    .line 62
    .line 63
    sput-boolean v7, Lcom/melodix/music/AppSingleton;->B:Z

    .line 64
    .line 65
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 66
    .line 67
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-interface {v2, v5, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-static {v1, v6, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_4

    .line 83
    .line 84
    const-string v1, "https://open.spotify.com/"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    invoke-static {v1, v6, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_4

    .line 95
    .line 96
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    .line 97
    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    sput-boolean v3, Lcom/melodix/music/AppSingleton;->B:Z

    .line 101
    .line 102
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 103
    .line 104
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-interface {v2, v5, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lm9;->k()V

    .line 116
    .line 117
    .line 118
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
    const-string v2, "(function() {let l=document.querySelector(\'button[data-testid=web-player-link]\');if(l) { AndBridge.loginDetected(); l.click(); }})();"

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
    # This bundled asset still runs when a stale spotify_bridge.js hotfix is active.
    invoke-virtual {v0, v3, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string v5, "native_ui_shell.js"
    invoke-static {v5}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v0, v5, v8}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

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
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

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
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->m:Z

    .line 64
    sput p1, Lcom/melodix/music/AppSingleton;->n:I

    .line 65
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/melodix/music/MainActivity;

    if-eqz p0, :cond_2

    invoke-virtual {p0, p1}, Lcom/melodix/music/MainActivity;->D(Z)V

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
    if-eqz p2, :cond_2

    .line 20
    .line 21
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
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
    const/4 p0, 0x1

    .line 38
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 39
    .line 40
    sput p0, Lcom/melodix/music/AppSingleton;->n:I

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
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->m:Z

    .line 33
    .line 34
    sput p1, Lcom/melodix/music/AppSingleton;->n:I

    .line 35
    .line 36
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/melodix/music/MainActivity;->D(Z)V

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
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

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

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 33

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "charset="

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    iput-object v3, v1, Lc91;->a:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    invoke-static {v3}, Ldl1;->l(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    const/4 v5, 0x1

    .line 37
    const/4 v6, 0x0

    .line 38
    if-eqz v4, :cond_e

    .line 39
    .line 40
    :try_start_0
    new-instance v4, Ljava/net/URL;

    .line 41
    .line 42
    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v4}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Ljava/net/URLConnection;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    check-cast v4, Ljava/net/HttpURLConnection;

    .line 59
    .line 60
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-virtual {v4, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 68
    .line 69
    .line 70
    const/16 v7, 0x2710

    .line 71
    .line 72
    invoke-virtual {v4, v7}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v4, v7}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 76
    .line 77
    .line 78
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    if-nez v7, :cond_1

    .line 83
    .line 84
    new-instance v7, Ljava/util/HashMap;

    .line 85
    .line 86
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    .line 91
    goto/16 :goto_9

    .line 92
    .line 93
    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    :cond_2
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    const-string v9, "sec-ch-ua"

    .line 106
    .line 107
    const-string v10, "sec-gpc"

    .line 108
    .line 109
    if-eqz v8, :cond_3

    .line 110
    .line 111
    :try_start_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    check-cast v8, Ljava/util/Map$Entry;

    .line 116
    .line 117
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    check-cast v11, Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    check-cast v8, Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 133
    .line 134
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v11, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v12

    .line 141
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    const-string v13, "x-requested-with"

    .line 145
    .line 146
    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v13

    .line 150
    if-nez v13, :cond_2

    .line 151
    .line 152
    invoke-virtual {v12, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v10

    .line 156
    if-nez v10, :cond_2

    .line 157
    .line 158
    invoke-static {v12, v9, v6}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    if-nez v9, :cond_2

    .line 163
    .line 164
    const-string v9, "user-agent"

    .line 165
    .line 166
    invoke-virtual {v12, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    if-nez v9, :cond_2

    .line 171
    .line 172
    invoke-virtual {v4, v11, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    const-string v7, "User-Agent"

    .line 177
    .line 178
    const-string v8, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    .line 179
    .line 180
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    const-string v7, "1"

    .line 184
    .line 185
    invoke-virtual {v4, v10, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    const-string v7, "sec-ch-ua-platform"

    .line 189
    .line 190
    const-string v8, "\"Windows\""

    .line 191
    .line 192
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    const-string v7, "sec-ch-ua-mobile"

    .line 196
    .line 197
    const-string v8, "?0"

    .line 198
    .line 199
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    const-string v7, "\"Not;A=Brand\";v=\"8\", \"Chromium\";v=\"134\", \"Google Chrome\";v=\"134\""

    .line 203
    .line 204
    invoke-virtual {v4, v9, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    invoke-virtual {v7, v3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    if-eqz v8, :cond_5

    .line 216
    .line 217
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 218
    .line 219
    .line 220
    move-result v9

    .line 221
    if-nez v9, :cond_4

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_4
    const-string v9, "Cookie"

    .line 225
    .line 226
    invoke-virtual {v4, v9, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_5
    :goto_2
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v4}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 233
    .line 234
    .line 235
    move-result-object v8

    .line 236
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 237
    .line 238
    .line 239
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 240
    .line 241
    .line 242
    move-result-object v8

    .line 243
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 244
    .line 245
    .line 246
    move-result-object v8

    .line 247
    :cond_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 248
    .line 249
    .line 250
    move-result v9

    .line 251
    if-eqz v9, :cond_7

    .line 252
    .line 253
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v9

    .line 257
    check-cast v9, Ljava/util/Map$Entry;

    .line 258
    .line 259
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v10

    .line 263
    check-cast v10, Ljava/lang/String;

    .line 264
    .line 265
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v9

    .line 269
    check-cast v9, Ljava/util/List;

    .line 270
    .line 271
    if-eqz v10, :cond_6

    .line 272
    .line 273
    const-string v11, "Set-Cookie"

    .line 274
    .line 275
    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 276
    .line 277
    .line 278
    move-result v10

    .line 279
    if-eqz v10, :cond_6

    .line 280
    .line 281
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 282
    .line 283
    .line 284
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 285
    .line 286
    .line 287
    move-result-object v9

    .line 288
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 289
    .line 290
    .line 291
    move-result v10

    .line 292
    if-eqz v10, :cond_6

    .line 293
    .line 294
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v10

    .line 298
    check-cast v10, Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v7, v3, v10}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    goto :goto_3

    .line 304
    :cond_7
    invoke-virtual {v7}, Landroid/webkit/CookieManager;->flush()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 308
    .line 309
    .line 310
    move-result v10

    .line 311
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v7

    .line 315
    if-nez v7, :cond_8

    .line 316
    .line 317
    const-string v7, "OK"

    .line 318
    .line 319
    :cond_8
    move-object v11, v7

    .line 320
    const/16 v7, 0x190

    .line 321
    .line 322
    if-lt v10, v7, :cond_9

    .line 323
    .line 324
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 325
    .line 326
    .line 327
    move-result-object v7

    .line 328
    :goto_4
    move-object v13, v7

    .line 329
    goto :goto_5

    .line 330
    :cond_9
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 331
    .line 332
    .line 333
    move-result-object v7

    .line 334
    goto :goto_4

    .line 335
    :goto_5
    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v7

    .line 339
    if-nez v7, :cond_a

    .line 340
    .line 341
    const-string v7, "text/html"

    .line 342
    .line 343
    :cond_a
    const-string v8, ";"

    .line 344
    .line 345
    filled-new-array {v8}, [Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v8

    .line 349
    invoke-static {v7, v8}, Lda1;->M(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    .line 350
    .line 351
    .line 352
    move-result-object v8

    .line 353
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v8

    .line 357
    check-cast v8, Ljava/lang/String;

    .line 358
    .line 359
    invoke-static {v8}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 360
    .line 361
    .line 362
    move-result-object v8

    .line 363
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v8

    .line 367
    invoke-static {v7, v0, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 368
    .line 369
    .line 370
    move-result v9

    .line 371
    if-eqz v9, :cond_b

    .line 372
    .line 373
    invoke-static {v7, v0, v7}, Lda1;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-static {v0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    :goto_6
    move-object v9, v0

    .line 386
    goto :goto_7

    .line 387
    :cond_b
    const-string v0, "utf-8"

    .line 388
    .line 389
    goto :goto_6

    .line 390
    :goto_7
    new-instance v12, Ljava/util/HashMap;

    .line 391
    .line 392
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v4}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 400
    .line 401
    .line 402
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    :cond_c
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    if-eqz v4, :cond_d

    .line 415
    .line 416
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v4

    .line 420
    check-cast v4, Ljava/util/Map$Entry;

    .line 421
    .line 422
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v7

    .line 426
    check-cast v7, Ljava/lang/String;

    .line 427
    .line 428
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v4

    .line 432
    check-cast v4, Ljava/util/List;

    .line 433
    .line 434
    if-eqz v7, :cond_c

    .line 435
    .line 436
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 437
    .line 438
    .line 439
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 440
    .line 441
    .line 442
    move-result v14

    .line 443
    if-nez v14, :cond_c

    .line 444
    .line 445
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v4

    .line 449
    invoke-virtual {v12, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    goto :goto_8

    .line 453
    :cond_d
    new-instance v7, Landroid/webkit/WebResourceResponse;

    .line 454
    .line 455
    invoke-direct/range {v7 .. v13}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 456
    .line 457
    .line 458
    return-object v7

    .line 459
    :goto_9
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    :cond_e
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    if-eqz v0, :cond_10

    .line 471
    .line 472
    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 473
    .line 474
    invoke-virtual {v0, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 479
    .line 480
    .line 481
    const-string v7, ".jpg"

    .line 482
    .line 483
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 484
    .line 485
    .line 486
    move-result v7

    .line 487
    if-nez v7, :cond_f

    .line 488
    .line 489
    const-string v7, ".jpeg"

    .line 490
    .line 491
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 492
    .line 493
    .line 494
    move-result v7

    .line 495
    if-nez v7, :cond_f

    .line 496
    .line 497
    const-string v7, ".png"

    .line 498
    .line 499
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 500
    .line 501
    .line 502
    move-result v7

    .line 503
    if-nez v7, :cond_f

    .line 504
    .line 505
    const-string v7, ".js"

    .line 506
    .line 507
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 508
    .line 509
    .line 510
    move-result v7

    .line 511
    if-nez v7, :cond_f

    .line 512
    .line 513
    const-string v7, ".css"

    .line 514
    .line 515
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 516
    .line 517
    .line 518
    move-result v7

    .line 519
    if-nez v7, :cond_f

    .line 520
    .line 521
    const-string v7, ".svg"

    .line 522
    .line 523
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 524
    .line 525
    .line 526
    move-result v7

    .line 527
    if-nez v7, :cond_f

    .line 528
    .line 529
    const-string v7, ".json"

    .line 530
    .line 531
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 532
    .line 533
    .line 534
    move-result v7

    .line 535
    if-nez v7, :cond_f

    .line 536
    .line 537
    const-string v7, ".woff2"

    .line 538
    .line 539
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 540
    .line 541
    .line 542
    move-result v7

    .line 543
    if-nez v7, :cond_f

    .line 544
    .line 545
    const-string v7, ".woff"

    .line 546
    .line 547
    invoke-virtual {v0, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    if-eqz v0, :cond_10

    .line 552
    .line 553
    :cond_f
    const/16 v16, 0x0

    .line 554
    .line 555
    goto/16 :goto_17

    .line 556
    .line 557
    :cond_10
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    if-nez v0, :cond_11

    .line 562
    .line 563
    sget-object v0, Lv00;->j:Lv00;

    .line 564
    .line 565
    :cond_11
    const-string v7, "Accept"

    .line 566
    .line 567
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v7

    .line 571
    check-cast v7, Ljava/lang/String;

    .line 572
    .line 573
    const-string v8, ""

    .line 574
    .line 575
    if-nez v7, :cond_12

    .line 576
    .line 577
    const-string v7, "accept"

    .line 578
    .line 579
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object v7

    .line 583
    check-cast v7, Ljava/lang/String;

    .line 584
    .line 585
    if-nez v7, :cond_12

    .line 586
    .line 587
    move-object v7, v8

    .line 588
    :cond_12
    const-string v9, "Sec-Fetch-Dest"

    .line 589
    .line 590
    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    .line 592
    .line 593
    move-result-object v9

    .line 594
    check-cast v9, Ljava/lang/String;

    .line 595
    .line 596
    if-nez v9, :cond_13

    .line 597
    .line 598
    const-string v9, "sec-fetch-dest"

    .line 599
    .line 600
    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v9

    .line 604
    check-cast v9, Ljava/lang/String;

    .line 605
    .line 606
    if-nez v9, :cond_13

    .line 607
    .line 608
    move-object v9, v8

    .line 609
    :cond_13
    const-string v10, "Range"

    .line 610
    .line 611
    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    move-result-object v10

    .line 615
    if-nez v10, :cond_15

    .line 616
    .line 617
    const-string v10, "range"

    .line 618
    .line 619
    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    move-result-object v10

    .line 623
    if-eqz v10, :cond_14

    .line 624
    .line 625
    goto :goto_a

    .line 626
    :cond_14
    move v10, v6

    .line 627
    goto :goto_b

    .line 628
    :cond_15
    :goto_a
    move v10, v5

    .line 629
    :goto_b
    const-string v11, "audio"

    .line 630
    .line 631
    invoke-static {v7, v11, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 632
    .line 633
    .line 634
    move-result v12

    .line 635
    const-string v13, "scdn.co/mp3-ad/"

    .line 636
    .line 637
    const-string v14, "/mp3-ad/"

    .line 638
    .line 639
    if-nez v12, :cond_17

    .line 640
    .line 641
    const-string v12, "video"

    .line 642
    .line 643
    invoke-static {v7, v12, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 644
    .line 645
    .line 646
    move-result v7

    .line 647
    if-nez v7, :cond_17

    .line 648
    .line 649
    invoke-static {v9, v11, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 650
    .line 651
    .line 652
    move-result v7

    .line 653
    if-nez v7, :cond_17

    .line 654
    .line 655
    invoke-static {v9, v12, v5}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 656
    .line 657
    .line 658
    move-result v7

    .line 659
    if-nez v7, :cond_17

    .line 660
    .line 661
    const-string v7, ".mp3"

    .line 662
    .line 663
    invoke-static {v3, v7, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 664
    .line 665
    .line 666
    move-result v7

    .line 667
    if-nez v7, :cond_17

    .line 668
    .line 669
    const-string v7, ".mp4"

    .line 670
    .line 671
    invoke-static {v3, v7, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 672
    .line 673
    .line 674
    move-result v7

    .line 675
    if-nez v7, :cond_17

    .line 676
    .line 677
    const-string v7, ".m4a"

    .line 678
    .line 679
    invoke-static {v3, v7, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 680
    .line 681
    .line 682
    move-result v7

    .line 683
    if-nez v7, :cond_17

    .line 684
    .line 685
    const-string v7, ".aac"

    .line 686
    .line 687
    invoke-static {v3, v7, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 688
    .line 689
    .line 690
    move-result v7

    .line 691
    if-nez v7, :cond_17

    .line 692
    .line 693
    invoke-static {v3, v14, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 694
    .line 695
    .line 696
    move-result v7

    .line 697
    if-nez v7, :cond_17

    .line 698
    .line 699
    invoke-static {v3, v13, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 700
    .line 701
    .line 702
    move-result v7

    .line 703
    if-nez v7, :cond_17

    .line 704
    .line 705
    if-eqz v10, :cond_16

    .line 706
    .line 707
    goto :goto_c

    .line 708
    :cond_16
    move v7, v6

    .line 709
    goto :goto_d

    .line 710
    :cond_17
    :goto_c
    move v7, v5

    .line 711
    :goto_d
    sget-boolean v9, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 712
    .line 713
    if-eqz v9, :cond_19

    .line 714
    .line 715
    const-string v9, "/canvaz/"

    .line 716
    .line 717
    invoke-static {v3, v9, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 718
    .line 719
    .line 720
    move-result v9

    .line 721
    if-nez v9, :cond_18

    .line 722
    .line 723
    const-string v9, "canvas-storage"

    .line 724
    .line 725
    invoke-static {v3, v9, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 726
    .line 727
    .line 728
    move-result v9

    .line 729
    if-nez v9, :cond_18

    .line 730
    .line 731
    const-string v9, "canvas.scdn.co"

    .line 732
    .line 733
    invoke-static {v3, v9, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 734
    .line 735
    .line 736
    move-result v9

    .line 737
    if-nez v9, :cond_18

    .line 738
    .line 739
    const-string v9, "/v1/canvas"

    .line 740
    .line 741
    invoke-static {v3, v9, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 742
    .line 743
    .line 744
    move-result v9

    .line 745
    if-eqz v9, :cond_19

    .line 746
    .line 747
    :cond_18
    new-instance v15, Landroid/webkit/WebResourceResponse;

    .line 748
    .line 749
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 750
    .line 751
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 752
    .line 753
    const-string v2, "{\"canvases\":[]}"

    .line 754
    .line 755
    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 756
    .line 757
    .line 758
    move-result-object v1

    .line 759
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 760
    .line 761
    .line 762
    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 763
    .line 764
    .line 765
    const-string v16, "application/json"

    .line 766
    .line 767
    const-string v17, "utf-8"

    .line 768
    .line 769
    const/16 v18, 0xc8

    .line 770
    .line 771
    const-string v19, "OK"

    .line 772
    .line 773
    const/16 v20, 0x0

    .line 774
    .line 775
    move-object/from16 v21, v0

    .line 776
    .line 777
    invoke-direct/range {v15 .. v21}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 778
    .line 779
    .line 780
    return-object v15

    .line 781
    :cond_19
    sget-object v9, Lcom/melodix/music/AppSingleton;->Z:Ln3;

    .line 782
    .line 783
    const-string v10, "*"

    .line 784
    .line 785
    const-string v11, "Access-Control-Allow-Origin"

    .line 786
    .line 787
    if-eqz v9, :cond_1e

    .line 788
    .line 789
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 790
    .line 791
    .line 792
    move-result-object v12

    .line 793
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 794
    .line 795
    .line 796
    iget-object v1, v1, Lc91;->a:Ljava/lang/String;

    .line 797
    .line 798
    invoke-virtual {v12}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 799
    .line 800
    .line 801
    move-result-object v15

    .line 802
    const/16 v16, 0x0

    .line 803
    .line 804
    const-string v4, "http"

    .line 805
    .line 806
    invoke-virtual {v4, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 807
    .line 808
    .line 809
    move-result v4

    .line 810
    if-nez v4, :cond_1a

    .line 811
    .line 812
    const-string v4, "https"

    .line 813
    .line 814
    invoke-virtual {v4, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 815
    .line 816
    .line 817
    move-result v4

    .line 818
    if-nez v4, :cond_1a

    .line 819
    .line 820
    goto :goto_f

    .line 821
    :cond_1a
    :try_start_2
    invoke-virtual {v9, v12, v1}, Ln3;->g(Landroid/net/Uri;Ljava/lang/String;)Z

    .line 822
    .line 823
    .line 824
    move-result v1

    .line 825
    if-eqz v1, :cond_1b

    .line 826
    .line 827
    goto :goto_e

    .line 828
    :cond_1b
    iget-object v1, v9, Ln3;->a:Ljava/util/regex/Pattern;

    .line 829
    .line 830
    if-eqz v1, :cond_1f

    .line 831
    .line 832
    invoke-virtual {v12}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 833
    .line 834
    .line 835
    move-result-object v4

    .line 836
    invoke-virtual {v1, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 837
    .line 838
    .line 839
    move-result-object v1

    .line 840
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    .line 841
    .line 842
    .line 843
    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 844
    if-eqz v1, :cond_1f

    .line 845
    .line 846
    :goto_e
    if-eqz v7, :cond_1d

    .line 847
    .line 848
    sget-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 849
    .line 850
    if-eqz v1, :cond_1c

    .line 851
    .line 852
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 853
    .line 854
    .line 855
    move-result-object v1

    .line 856
    check-cast v1, Lcom/melodix/music/MainActivity;

    .line 857
    .line 858
    if-eqz v1, :cond_1c

    .line 859
    .line 860
    new-instance v3, Ls4;

    .line 861
    .line 862
    const/16 v4, 0xf

    .line 863
    .line 864
    invoke-direct {v3, v1, v4}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 865
    .line 866
    .line 867
    invoke-virtual {v1, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 868
    .line 869
    .line 870
    :cond_1c
    invoke-static {v2, v0}, Lc91;->a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 871
    .line 872
    .line 873
    move-result-object v0

    .line 874
    return-object v0

    .line 875
    :cond_1d
    new-instance v0, Ljava/util/HashMap;

    .line 876
    .line 877
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 878
    .line 879
    .line 880
    invoke-virtual {v0, v11, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    .line 882
    .line 883
    new-instance v1, Landroid/webkit/WebResourceResponse;

    .line 884
    .line 885
    new-instance v7, Ljava/io/ByteArrayInputStream;

    .line 886
    .line 887
    new-array v2, v6, [B

    .line 888
    .line 889
    invoke-direct {v7, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 890
    .line 891
    .line 892
    const-string v2, "text/plain"

    .line 893
    .line 894
    const-string v3, "utf-8"

    .line 895
    .line 896
    const/16 v4, 0xc8

    .line 897
    .line 898
    const-string v5, "OK"

    .line 899
    .line 900
    move-object v6, v0

    .line 901
    invoke-direct/range {v1 .. v7}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 902
    .line 903
    .line 904
    return-object v1

    .line 905
    :catch_1
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 906
    .line 907
    .line 908
    goto :goto_f

    .line 909
    :cond_1e
    const/16 v16, 0x0

    .line 910
    .line 911
    :cond_1f
    :goto_f
    sget-object v1, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 912
    .line 913
    const-string v4, "dynamic"

    .line 914
    .line 915
    invoke-static {v1, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 916
    .line 917
    .line 918
    move-result v1

    .line 919
    const-string v4, "adsrvr.org"

    .line 920
    .line 921
    const-string v9, "tracker.samplicio.us"

    .line 922
    .line 923
    const-string v12, "t.6sc.co"

    .line 924
    .line 925
    const-string v15, "aet.spotify.com"

    .line 926
    .line 927
    move/from16 v17, v5

    .line 928
    .line 929
    const-string v5, "ads.spotify.com"

    .line 930
    .line 931
    const-string v6, "adstudio.spotify.com"

    .line 932
    .line 933
    move/from16 p0, v1

    .line 934
    .line 935
    const-string v1, "pixel.spotify.com"

    .line 936
    .line 937
    move/from16 v19, v7

    .line 938
    .line 939
    const-string v7, "pixel-static.spotify.com"

    .line 940
    .line 941
    move-object/from16 v20, v8

    .line 942
    .line 943
    const-string v8, "adeventtracker.spotify.com"

    .line 944
    .line 945
    move-object/from16 v21, v10

    .line 946
    .line 947
    const-string v10, "ads-fa.spotify.com"

    .line 948
    .line 949
    move-object/from16 v22, v11

    .line 950
    .line 951
    const-string v11, "ads-akp.spotify.com"

    .line 952
    .line 953
    move-object/from16 v23, v0

    .line 954
    .line 955
    const-string v0, "audio-ads.spotify.com"

    .line 956
    .line 957
    const-string v2, "mp3ad.scdn.co"

    .line 958
    .line 959
    move-object/from16 v24, v4

    .line 960
    .line 961
    const-string v4, "amillionads.com"

    .line 962
    .line 963
    if-eqz p0, :cond_27

    .line 964
    .line 965
    move-object/from16 p0, v9

    .line 966
    .line 967
    const/4 v9, 0x0

    .line 968
    invoke-static {v3, v14, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 969
    .line 970
    .line 971
    move-result v14

    .line 972
    if-nez v14, :cond_24

    .line 973
    .line 974
    invoke-static {v3, v13, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 975
    .line 976
    .line 977
    move-result v13

    .line 978
    if-nez v13, :cond_24

    .line 979
    .line 980
    invoke-static {v3, v4, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 981
    .line 982
    .line 983
    move-result v4

    .line 984
    if-nez v4, :cond_24

    .line 985
    .line 986
    invoke-static {v3, v2, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 987
    .line 988
    .line 989
    move-result v2

    .line 990
    if-nez v2, :cond_24

    .line 991
    .line 992
    invoke-static {v3, v0, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 993
    .line 994
    .line 995
    move-result v0

    .line 996
    if-nez v0, :cond_24

    .line 997
    .line 998
    invoke-static {v3, v11, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 999
    .line 1000
    .line 1001
    move-result v0

    .line 1002
    if-nez v0, :cond_24

    .line 1003
    .line 1004
    invoke-static {v3, v10, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1005
    .line 1006
    .line 1007
    move-result v0

    .line 1008
    if-nez v0, :cond_24

    .line 1009
    .line 1010
    invoke-static {v3, v8, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1011
    .line 1012
    .line 1013
    move-result v0

    .line 1014
    if-nez v0, :cond_24

    .line 1015
    .line 1016
    invoke-static {v3, v7, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1017
    .line 1018
    .line 1019
    move-result v0

    .line 1020
    if-nez v0, :cond_24

    .line 1021
    .line 1022
    invoke-static {v3, v1, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1023
    .line 1024
    .line 1025
    move-result v0

    .line 1026
    if-nez v0, :cond_24

    .line 1027
    .line 1028
    invoke-static {v3, v6, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1029
    .line 1030
    .line 1031
    move-result v0

    .line 1032
    if-nez v0, :cond_24

    .line 1033
    .line 1034
    invoke-static {v3, v5, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1035
    .line 1036
    .line 1037
    move-result v0

    .line 1038
    if-nez v0, :cond_24

    .line 1039
    .line 1040
    invoke-static {v3, v15, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1041
    .line 1042
    .line 1043
    move-result v0

    .line 1044
    if-nez v0, :cond_24

    .line 1045
    .line 1046
    invoke-static {v3, v12, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1047
    .line 1048
    .line 1049
    move-result v0

    .line 1050
    if-nez v0, :cond_24

    .line 1051
    .line 1052
    move-object/from16 v0, p0

    .line 1053
    .line 1054
    invoke-static {v3, v0, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1055
    .line 1056
    .line 1057
    move-result v0

    .line 1058
    if-nez v0, :cond_24

    .line 1059
    .line 1060
    move-object/from16 v0, v24

    .line 1061
    .line 1062
    invoke-static {v3, v0, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1063
    .line 1064
    .line 1065
    move-result v0

    .line 1066
    if-eqz v0, :cond_20

    .line 1067
    .line 1068
    goto :goto_11

    .line 1069
    :cond_20
    :try_start_3
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 1070
    .line 1071
    .line 1072
    move-result-object v0

    .line 1073
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v0

    .line 1077
    if-nez v0, :cond_21

    .line 1078
    .line 1079
    goto/16 :goto_15

    .line 1080
    .line 1081
    :cond_21
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1082
    .line 1083
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v0

    .line 1087
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1088
    .line 1089
    .line 1090
    :goto_10
    const-string v1, "."

    .line 1091
    .line 1092
    const/4 v9, 0x0

    .line 1093
    invoke-static {v0, v1, v9}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1094
    .line 1095
    .line 1096
    move-result v1

    .line 1097
    if-eqz v1, :cond_31

    .line 1098
    .line 1099
    sget-object v1, Lcom/melodix/music/AppSingleton;->Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 1100
    .line 1101
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->contains(Ljava/lang/Object;)Z

    .line 1102
    .line 1103
    .line 1104
    move-result v1

    .line 1105
    if-eqz v1, :cond_22

    .line 1106
    .line 1107
    goto :goto_11

    .line 1108
    :cond_22
    const/16 v1, 0x2e

    .line 1109
    .line 1110
    const/4 v2, 0x6

    .line 1111
    invoke-static {v0, v1, v9, v2}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 1112
    .line 1113
    .line 1114
    move-result v1

    .line 1115
    const/4 v2, -0x1

    .line 1116
    if-eq v1, v2, :cond_31

    .line 1117
    .line 1118
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 1119
    .line 1120
    .line 1121
    move-result v2

    .line 1122
    add-int/lit8 v2, v2, -0x1

    .line 1123
    .line 1124
    if-ne v1, v2, :cond_23

    .line 1125
    .line 1126
    goto/16 :goto_15

    .line 1127
    .line 1128
    :cond_23
    add-int/lit8 v1, v1, 0x1

    .line 1129
    .line 1130
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 1131
    .line 1132
    .line 1133
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 1134
    goto :goto_10

    .line 1135
    :cond_24
    :goto_11
    if-eqz v19, :cond_25

    .line 1136
    .line 1137
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 1138
    .line 1139
    if-eqz v0, :cond_25

    .line 1140
    .line 1141
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v0

    .line 1145
    check-cast v0, Lcom/melodix/music/MainActivity;

    .line 1146
    .line 1147
    if-eqz v0, :cond_25

    .line 1148
    .line 1149
    new-instance v1, Ls4;

    .line 1150
    .line 1151
    const/16 v2, 0x10

    .line 1152
    .line 1153
    invoke-direct {v1, v0, v2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 1154
    .line 1155
    .line 1156
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1157
    .line 1158
    .line 1159
    :cond_25
    if-eqz v19, :cond_26

    .line 1160
    .line 1161
    move-object/from16 v9, p1

    .line 1162
    .line 1163
    move-object/from16 v0, v23

    .line 1164
    .line 1165
    invoke-static {v9, v0}, Lc91;->a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v0

    .line 1169
    return-object v0

    .line 1170
    :cond_26
    new-instance v6, Ljava/util/HashMap;

    .line 1171
    .line 1172
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1173
    .line 1174
    .line 1175
    move-object/from16 v0, v21

    .line 1176
    .line 1177
    move-object/from16 v1, v22

    .line 1178
    .line 1179
    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1180
    .line 1181
    .line 1182
    new-instance v1, Landroid/webkit/WebResourceResponse;

    .line 1183
    .line 1184
    new-instance v7, Ljava/io/ByteArrayInputStream;

    .line 1185
    .line 1186
    const/4 v9, 0x0

    .line 1187
    new-array v0, v9, [B

    .line 1188
    .line 1189
    invoke-direct {v7, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1190
    .line 1191
    .line 1192
    const-string v2, "text/plain"

    .line 1193
    .line 1194
    const-string v3, "utf-8"

    .line 1195
    .line 1196
    const/16 v4, 0xc8

    .line 1197
    .line 1198
    const-string v5, "OK"

    .line 1199
    .line 1200
    invoke-direct/range {v1 .. v7}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 1201
    .line 1202
    .line 1203
    return-object v1

    .line 1204
    :cond_27
    move-object/from16 p0, v9

    .line 1205
    .line 1206
    move-object/from16 v26, v21

    .line 1207
    .line 1208
    move-object/from16 v27, v22

    .line 1209
    .line 1210
    move-object/from16 v25, v23

    .line 1211
    .line 1212
    sget-object v9, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 1213
    .line 1214
    move-object/from16 v17, v12

    .line 1215
    .line 1216
    const-string v12, "instant"

    .line 1217
    .line 1218
    invoke-static {v9, v12}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 1219
    .line 1220
    .line 1221
    move-result v9

    .line 1222
    const-string v12, "adstudio-assets.scdn.co"

    .line 1223
    .line 1224
    move/from16 v21, v9

    .line 1225
    .line 1226
    const-string v9, "adxcel.com"

    .line 1227
    .line 1228
    move-object/from16 v22, v15

    .line 1229
    .line 1230
    const-string v15, "2mdn.net"

    .line 1231
    .line 1232
    move-object/from16 v23, v5

    .line 1233
    .line 1234
    const-string v5, "sentry.io"

    .line 1235
    .line 1236
    move-object/from16 v28, v6

    .line 1237
    .line 1238
    const-string v6, "fastly-insights.com"

    .line 1239
    .line 1240
    move-object/from16 v29, v1

    .line 1241
    .line 1242
    const-string v1, "googlesyndication.com"

    .line 1243
    .line 1244
    move-object/from16 v30, v7

    .line 1245
    .line 1246
    const-string v7, "doubleclick.net"

    .line 1247
    .line 1248
    if-eqz v21, :cond_2b

    .line 1249
    .line 1250
    move-object/from16 v21, v8

    .line 1251
    .line 1252
    const/4 v8, 0x0

    .line 1253
    invoke-static {v3, v7, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1254
    .line 1255
    .line 1256
    move-result v7

    .line 1257
    if-nez v7, :cond_28

    .line 1258
    .line 1259
    invoke-static {v3, v1, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1260
    .line 1261
    .line 1262
    move-result v1

    .line 1263
    if-nez v1, :cond_28

    .line 1264
    .line 1265
    invoke-static {v3, v6, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1266
    .line 1267
    .line 1268
    move-result v1

    .line 1269
    if-nez v1, :cond_28

    .line 1270
    .line 1271
    invoke-static {v3, v5, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1272
    .line 1273
    .line 1274
    move-result v1

    .line 1275
    if-nez v1, :cond_28

    .line 1276
    .line 1277
    invoke-static {v3, v15, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1278
    .line 1279
    .line 1280
    move-result v1

    .line 1281
    if-nez v1, :cond_28

    .line 1282
    .line 1283
    invoke-static {v3, v9, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1284
    .line 1285
    .line 1286
    move-result v1

    .line 1287
    if-nez v1, :cond_28

    .line 1288
    .line 1289
    invoke-static {v3, v4, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1290
    .line 1291
    .line 1292
    move-result v1

    .line 1293
    if-nez v1, :cond_28

    .line 1294
    .line 1295
    invoke-static {v3, v12, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1296
    .line 1297
    .line 1298
    move-result v1

    .line 1299
    if-nez v1, :cond_28

    .line 1300
    .line 1301
    invoke-static {v3, v13, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1302
    .line 1303
    .line 1304
    move-result v1

    .line 1305
    if-nez v1, :cond_28

    .line 1306
    .line 1307
    invoke-static {v3, v14, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1308
    .line 1309
    .line 1310
    move-result v1

    .line 1311
    if-nez v1, :cond_28

    .line 1312
    .line 1313
    invoke-static {v3, v2, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1314
    .line 1315
    .line 1316
    move-result v1

    .line 1317
    if-nez v1, :cond_28

    .line 1318
    .line 1319
    invoke-static {v3, v0, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1320
    .line 1321
    .line 1322
    move-result v0

    .line 1323
    if-nez v0, :cond_28

    .line 1324
    .line 1325
    invoke-static {v3, v11, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1326
    .line 1327
    .line 1328
    move-result v0

    .line 1329
    if-nez v0, :cond_28

    .line 1330
    .line 1331
    invoke-static {v3, v10, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1332
    .line 1333
    .line 1334
    move-result v0

    .line 1335
    if-nez v0, :cond_28

    .line 1336
    .line 1337
    move-object/from16 v0, v21

    .line 1338
    .line 1339
    invoke-static {v3, v0, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1340
    .line 1341
    .line 1342
    move-result v0

    .line 1343
    if-nez v0, :cond_28

    .line 1344
    .line 1345
    move-object/from16 v0, v30

    .line 1346
    .line 1347
    invoke-static {v3, v0, v8}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 1348
    .line 1349
    .line 1350
    move-result v0

    .line 1351
    if-nez v0, :cond_28

    .line 1352
    .line 1353
    move-object/from16 v8, v29

    .line 1354
    .line 1355
    invoke-static {v8, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1356
    .line 1357
    .line 1358
    move-result v0

    .line 1359
    if-nez v0, :cond_28

    .line 1360
    .line 1361
    move-object/from16 v0, v28

    .line 1362
    .line 1363
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1364
    .line 1365
    .line 1366
    move-result v0

    .line 1367
    if-nez v0, :cond_28

    .line 1368
    .line 1369
    move-object/from16 v0, v23

    .line 1370
    .line 1371
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1372
    .line 1373
    .line 1374
    move-result v0

    .line 1375
    if-nez v0, :cond_28

    .line 1376
    .line 1377
    move-object/from16 v0, v22

    .line 1378
    .line 1379
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1380
    .line 1381
    .line 1382
    move-result v0

    .line 1383
    if-nez v0, :cond_28

    .line 1384
    .line 1385
    move-object/from16 v0, v17

    .line 1386
    .line 1387
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1388
    .line 1389
    .line 1390
    move-result v0

    .line 1391
    if-nez v0, :cond_28

    .line 1392
    .line 1393
    move-object/from16 v0, p0

    .line 1394
    .line 1395
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1396
    .line 1397
    .line 1398
    move-result v0

    .line 1399
    if-nez v0, :cond_28

    .line 1400
    .line 1401
    move-object/from16 v0, v24

    .line 1402
    .line 1403
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1404
    .line 1405
    .line 1406
    move-result v0

    .line 1407
    if-eqz v0, :cond_31

    .line 1408
    .line 1409
    :cond_28
    if-eqz v19, :cond_29

    .line 1410
    .line 1411
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 1412
    .line 1413
    if-eqz v0, :cond_29

    .line 1414
    .line 1415
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 1416
    .line 1417
    .line 1418
    move-result-object v0

    .line 1419
    check-cast v0, Lcom/melodix/music/MainActivity;

    .line 1420
    .line 1421
    if-eqz v0, :cond_29

    .line 1422
    .line 1423
    new-instance v1, Ls4;

    .line 1424
    .line 1425
    const/16 v2, 0x11

    .line 1426
    .line 1427
    invoke-direct {v1, v0, v2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 1428
    .line 1429
    .line 1430
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1431
    .line 1432
    .line 1433
    :cond_29
    if-eqz v19, :cond_2a

    .line 1434
    .line 1435
    move-object/from16 v1, p1

    .line 1436
    .line 1437
    move-object/from16 v0, v25

    .line 1438
    .line 1439
    invoke-static {v1, v0}, Lc91;->a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 1440
    .line 1441
    .line 1442
    move-result-object v0

    .line 1443
    return-object v0

    .line 1444
    :cond_2a
    new-instance v6, Ljava/util/HashMap;

    .line 1445
    .line 1446
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1447
    .line 1448
    .line 1449
    move-object/from16 v0, v26

    .line 1450
    .line 1451
    move-object/from16 v1, v27

    .line 1452
    .line 1453
    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1454
    .line 1455
    .line 1456
    new-instance v1, Landroid/webkit/WebResourceResponse;

    .line 1457
    .line 1458
    new-instance v7, Ljava/io/ByteArrayInputStream;

    .line 1459
    .line 1460
    const/4 v9, 0x0

    .line 1461
    new-array v0, v9, [B

    .line 1462
    .line 1463
    invoke-direct {v7, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1464
    .line 1465
    .line 1466
    const-string v2, "text/plain"

    .line 1467
    .line 1468
    const-string v3, "utf-8"

    .line 1469
    .line 1470
    const/16 v4, 0xc8

    .line 1471
    .line 1472
    const-string v5, "OK"

    .line 1473
    .line 1474
    invoke-direct/range {v1 .. v7}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 1475
    .line 1476
    .line 1477
    return-object v1

    .line 1478
    :cond_2b
    move-object/from16 v21, v22

    .line 1479
    .line 1480
    move-object/from16 v22, v2

    .line 1481
    .line 1482
    move-object/from16 v2, v21

    .line 1483
    .line 1484
    move-object/from16 v21, v0

    .line 1485
    .line 1486
    move-object/from16 v0, v17

    .line 1487
    .line 1488
    move-object/from16 v31, v26

    .line 1489
    .line 1490
    move-object/from16 v32, v27

    .line 1491
    .line 1492
    move-object/from16 v26, v9

    .line 1493
    .line 1494
    move-object/from16 v17, v11

    .line 1495
    .line 1496
    move-object/from16 v27, v15

    .line 1497
    .line 1498
    move-object/from16 v9, v30

    .line 1499
    .line 1500
    move-object/from16 v11, p0

    .line 1501
    .line 1502
    move-object v15, v8

    .line 1503
    move-object/from16 p0, v10

    .line 1504
    .line 1505
    move-object/from16 v10, v24

    .line 1506
    .line 1507
    move-object/from16 v8, v29

    .line 1508
    .line 1509
    move-object/from16 v24, v12

    .line 1510
    .line 1511
    move-object/from16 v12, v23

    .line 1512
    .line 1513
    move-object/from16 v23, v25

    .line 1514
    .line 1515
    move-object/from16 v25, v13

    .line 1516
    .line 1517
    move-object/from16 v13, v28

    .line 1518
    .line 1519
    invoke-static {v7, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1520
    .line 1521
    .line 1522
    move-result v7

    .line 1523
    if-nez v7, :cond_35

    .line 1524
    .line 1525
    invoke-static {v1, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1526
    .line 1527
    .line 1528
    move-result v1

    .line 1529
    if-nez v1, :cond_35

    .line 1530
    .line 1531
    invoke-static {v6, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1532
    .line 1533
    .line 1534
    move-result v1

    .line 1535
    if-nez v1, :cond_35

    .line 1536
    .line 1537
    invoke-static {v5, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1538
    .line 1539
    .line 1540
    move-result v1

    .line 1541
    if-nez v1, :cond_35

    .line 1542
    .line 1543
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1544
    .line 1545
    .line 1546
    move-result v0

    .line 1547
    if-nez v0, :cond_35

    .line 1548
    .line 1549
    invoke-static {v11, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1550
    .line 1551
    .line 1552
    move-result v0

    .line 1553
    if-nez v0, :cond_35

    .line 1554
    .line 1555
    invoke-static {v10, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1556
    .line 1557
    .line 1558
    move-result v0

    .line 1559
    if-nez v0, :cond_35

    .line 1560
    .line 1561
    invoke-static {v2, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1562
    .line 1563
    .line 1564
    move-result v0

    .line 1565
    if-nez v0, :cond_35

    .line 1566
    .line 1567
    invoke-static {v8, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1568
    .line 1569
    .line 1570
    move-result v0

    .line 1571
    if-nez v0, :cond_35

    .line 1572
    .line 1573
    invoke-static {v9, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1574
    .line 1575
    .line 1576
    move-result v0

    .line 1577
    if-nez v0, :cond_35

    .line 1578
    .line 1579
    invoke-static {v15, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1580
    .line 1581
    .line 1582
    move-result v0

    .line 1583
    if-nez v0, :cond_35

    .line 1584
    .line 1585
    invoke-static {v13, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1586
    .line 1587
    .line 1588
    move-result v0

    .line 1589
    if-nez v0, :cond_35

    .line 1590
    .line 1591
    invoke-static {v12, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1592
    .line 1593
    .line 1594
    move-result v0

    .line 1595
    if-eqz v0, :cond_2c

    .line 1596
    .line 1597
    goto/16 :goto_19

    .line 1598
    .line 1599
    :cond_2c
    goto/16 :cond_31

    const-string v0, ".net/audio/"

    .line 1600
    .line 1601
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1602
    .line 1603
    .line 1604
    move-result v0

    .line 1605
    if-nez v0, :cond_2d

    .line 1606
    .line 1607
    const-string v0, ".co/audio/"

    .line 1608
    .line 1609
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1610
    .line 1611
    .line 1612
    move-result v0

    .line 1613
    if-nez v0, :cond_2d

    .line 1614
    .line 1615
    invoke-static {v14, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1616
    .line 1617
    .line 1618
    move-result v0

    .line 1619
    if-nez v0, :cond_2d

    .line 1620
    .line 1621
    invoke-static {v4, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1622
    .line 1623
    .line 1624
    move-result v0

    .line 1625
    if-nez v0, :cond_2d

    .line 1626
    .line 1627
    move-object/from16 v0, v27

    .line 1628
    .line 1629
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1630
    .line 1631
    .line 1632
    move-result v0

    .line 1633
    if-nez v0, :cond_2d

    .line 1634
    .line 1635
    move-object/from16 v0, v26

    .line 1636
    .line 1637
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1638
    .line 1639
    .line 1640
    move-result v0

    .line 1641
    if-nez v0, :cond_2d

    .line 1642
    .line 1643
    const-string v0, "akamaized.net/audio/"

    .line 1644
    .line 1645
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1646
    .line 1647
    .line 1648
    move-result v0

    .line 1649
    if-nez v0, :cond_2d

    .line 1650
    .line 1651
    const-string v0, "scdn.co/audio/"

    .line 1652
    .line 1653
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1654
    .line 1655
    .line 1656
    move-result v0

    .line 1657
    if-nez v0, :cond_2d

    .line 1658
    .line 1659
    move-object/from16 v0, v25

    .line 1660
    .line 1661
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1662
    .line 1663
    .line 1664
    move-result v0

    .line 1665
    if-nez v0, :cond_2d

    .line 1666
    .line 1667
    const-string v0, "spotifycdn.com/audio/"

    .line 1668
    .line 1669
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1670
    .line 1671
    .line 1672
    move-result v0

    .line 1673
    if-nez v0, :cond_2d

    .line 1674
    .line 1675
    move-object/from16 v0, v24

    .line 1676
    .line 1677
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1678
    .line 1679
    .line 1680
    move-result v0

    .line 1681
    if-nez v0, :cond_2d

    .line 1682
    .line 1683
    move-object/from16 v0, v22

    .line 1684
    .line 1685
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1686
    .line 1687
    .line 1688
    move-result v0

    .line 1689
    if-nez v0, :cond_2d

    .line 1690
    .line 1691
    move-object/from16 v0, v21

    .line 1692
    .line 1693
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1694
    .line 1695
    .line 1696
    move-result v0

    .line 1697
    if-nez v0, :cond_2d

    .line 1698
    .line 1699
    move-object/from16 v0, v17

    .line 1700
    .line 1701
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1702
    .line 1703
    .line 1704
    move-result v0

    .line 1705
    if-nez v0, :cond_2d

    .line 1706
    .line 1707
    move-object/from16 v0, p0

    .line 1708
    .line 1709
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1710
    .line 1711
    .line 1712
    move-result v0

    .line 1713
    if-eqz v0, :cond_31

    .line 1714
    .line 1715
    :cond_2d
    :try_start_4
    new-instance v0, Ljava/net/URL;

    .line 1716
    .line 1717
    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1718
    .line 1719
    .line 1720
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 1721
    .line 1722
    .line 1723
    move-result-object v0

    .line 1724
    invoke-static {v0}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1725
    .line 1726
    .line 1727
    move-result-object v0

    .line 1728
    check-cast v0, Ljava/net/URLConnection;

    .line 1729
    .line 1730
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1731
    .line 1732
    .line 1733
    move-object v1, v0

    .line 1734
    check-cast v1, Ljava/net/HttpURLConnection;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1735
    .line 1736
    :try_start_5
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 1737
    .line 1738
    .line 1739
    move-result-object v0

    .line 1740
    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1741
    .line 1742
    .line 1743
    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 1744
    .line 1745
    .line 1746
    move-result-object v0

    .line 1747
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 1748
    .line 1749
    .line 1750
    move-result-object v0

    .line 1751
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1752
    .line 1753
    .line 1754
    move-result v2

    .line 1755
    if-eqz v2, :cond_2e

    .line 1756
    .line 1757
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1758
    .line 1759
    .line 1760
    move-result-object v2

    .line 1761
    check-cast v2, Ljava/util/Map$Entry;

    .line 1762
    .line 1763
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 1764
    .line 1765
    .line 1766
    move-result-object v4

    .line 1767
    check-cast v4, Ljava/lang/String;

    .line 1768
    .line 1769
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 1770
    .line 1771
    .line 1772
    move-result-object v2

    .line 1773
    check-cast v2, Ljava/lang/String;

    .line 1774
    .line 1775
    invoke-virtual {v1, v4, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1776
    .line 1777
    .line 1778
    goto :goto_12

    .line 1779
    :catchall_0
    move-exception v0

    .line 1780
    move-object v4, v1

    .line 1781
    goto/16 :goto_18

    .line 1782
    .line 1783
    :catch_2
    move-exception v0

    .line 1784
    goto :goto_14

    .line 1785
    :cond_2e
    const/16 v0, 0x7d0

    .line 1786
    .line 1787
    invoke-virtual {v1, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 1788
    .line 1789
    .line 1790
    invoke-virtual {v1, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 1791
    .line 1792
    .line 1793
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 1794
    .line 1795
    .line 1796
    invoke-virtual {v1}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 1797
    .line 1798
    .line 1799
    move-result-object v0

    .line 1800
    if-eqz v0, :cond_30

    .line 1801
    .line 1802
    const-string v2, "audio/mpeg"

    .line 1803
    .line 1804
    const/4 v9, 0x0

    .line 1805
    invoke-static {v0, v2, v9}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 1806
    .line 1807
    .line 1808
    move-result v0

    .line 1809
    if-eqz v0, :cond_30

    .line 1810
    .line 1811
    const-string v0, "podz-content"

    .line 1812
    .line 1813
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1814
    .line 1815
    .line 1816
    move-result v0

    .line 1817
    if-nez v0, :cond_30

    .line 1818
    .line 1819
    const-string v0, "gew4-spclient"

    .line 1820
    .line 1821
    invoke-static {v0, v3}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1822
    .line 1823
    .line 1824
    move-result v0

    .line 1825
    if-nez v0, :cond_30

    .line 1826
    .line 1827
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 1828
    .line 1829
    if-eqz v0, :cond_2f

    .line 1830
    .line 1831
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 1832
    .line 1833
    .line 1834
    move-result-object v0

    .line 1835
    check-cast v0, Lcom/melodix/music/MainActivity;

    .line 1836
    .line 1837
    if-eqz v0, :cond_2f

    .line 1838
    .line 1839
    new-instance v2, Ls4;

    .line 1840
    .line 1841
    const/16 v3, 0x12

    .line 1842
    .line 1843
    invoke-direct {v2, v0, v3}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 1844
    .line 1845
    .line 1846
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1847
    .line 1848
    .line 1849
    :cond_2f
    move-object/from16 v2, p1

    .line 1850
    .line 1851
    move-object/from16 v0, v23

    .line 1852
    .line 1853
    invoke-static {v2, v0}, Lc91;->a(Landroid/webkit/WebView;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 1854
    .line 1855
    .line 1856
    move-result-object v0

    .line 1857
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1858
    .line 1859
    .line 1860
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1861
    .line 1862
    .line 1863
    return-object v0

    .line 1864
    :cond_30
    :goto_13
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1865
    .line 1866
    .line 1867
    goto :goto_15

    .line 1868
    :catchall_1
    move-exception v0

    .line 1869
    move-object/from16 v4, v16

    .line 1870
    .line 1871
    goto :goto_18

    .line 1872
    :catch_3
    move-exception v0

    .line 1873
    move-object/from16 v1, v16

    .line 1874
    .line 1875
    :goto_14
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1876
    .line 1877
    .line 1878
    if-eqz v1, :cond_31

    .line 1879
    .line 1880
    goto :goto_13

    .line 1881
    :catch_4
    :cond_31
    :goto_15
    invoke-interface/range {p2 .. p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 1882
    .line 1883
    .line 1884
    move-result-object v0

    .line 1885
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 1886
    .line 1887
    .line 1888
    move-result-object v0

    .line 1889
    if-eqz v0, :cond_32

    .line 1890
    .line 1891
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 1892
    .line 1893
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 1894
    .line 1895
    .line 1896
    move-result-object v8

    .line 1897
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1898
    .line 1899
    .line 1900
    goto :goto_16

    .line 1901
    :cond_32
    move-object/from16 v8, v20

    .line 1902
    .line 1903
    :goto_16
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 1904
    .line 1905
    .line 1906
    move-result v0

    .line 1907
    if-lez v0, :cond_33

    .line 1908
    .line 1909
    const-string v0, "spotify.com"

    .line 1910
    .line 1911
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1912
    .line 1913
    .line 1914
    move-result v0

    .line 1915
    if-nez v0, :cond_33

    .line 1916
    .line 1917
    const-string v0, "scdn.co"

    .line 1918
    .line 1919
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1920
    .line 1921
    .line 1922
    move-result v0

    .line 1923
    if-nez v0, :cond_33

    .line 1924
    .line 1925
    const-string v0, "spotifycdn.com"

    .line 1926
    .line 1927
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1928
    .line 1929
    .line 1930
    move-result v0

    .line 1931
    if-nez v0, :cond_33

    const-string v0, "akamaized.net"

    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_33

    .line 1932
    .line 1933
    const-string v0, "google"

    .line 1934
    .line 1935
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1936
    .line 1937
    .line 1938
    move-result v0

    .line 1939
    if-nez v0, :cond_33

    .line 1940
    .line 1941
    const-string v0, "facebook"

    .line 1942
    .line 1943
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1944
    .line 1945
    .line 1946
    move-result v0

    .line 1947
    if-nez v0, :cond_33

    .line 1948
    .line 1949
    const-string v0, "sentry"

    .line 1950
    .line 1951
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1952
    .line 1953
    .line 1954
    move-result v0

    .line 1955
    if-nez v0, :cond_33

    .line 1956
    .line 1957
    const-string v0, "doubleclick"

    .line 1958
    .line 1959
    invoke-static {v0, v8}, Lda1;->A(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 1960
    .line 1961
    .line 1962
    move-result v0

    .line 1963
    if-nez v0, :cond_33

    .line 1964
    .line 1965
    if-eqz v19, :cond_33

    .line 1966
    .line 1967
    invoke-static/range {p2 .. p2}, Lc91;->b(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 1968
    .line 1969
    .line 1970
    move-result-object v0

    .line 1971
    if-eqz v0, :cond_33

    .line 1972
    .line 1973
    return-object v0

    .line 1974
    :cond_33
    :goto_17
    return-object v16

    .line 1975
    :goto_18
    if-eqz v4, :cond_34

    .line 1976
    .line 1977
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1978
    .line 1979
    .line 1980
    :cond_34
    throw v0

    .line 1981
    :cond_35
    :goto_19
    new-instance v10, Ljava/util/HashMap;

    .line 1982
    .line 1983
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 1984
    .line 1985
    .line 1986
    move-object/from16 v0, v31

    .line 1987
    .line 1988
    move-object/from16 v1, v32

    .line 1989
    .line 1990
    invoke-virtual {v10, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1991
    .line 1992
    .line 1993
    new-instance v5, Landroid/webkit/WebResourceResponse;

    .line 1994
    .line 1995
    new-instance v11, Ljava/io/ByteArrayInputStream;

    .line 1996
    .line 1997
    const/4 v9, 0x0

    .line 1998
    new-array v0, v9, [B

    .line 1999
    .line 2000
    invoke-direct {v11, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 2001
    .line 2002
    .line 2003
    const-string v6, "text/plain"

    .line 2004
    .line 2005
    const-string v7, "utf-8"

    .line 2006
    .line 2007
    const/16 v8, 0xc8

    .line 2008
    .line 2009
    const-string v9, "OK"

    .line 2010
    .line 2011
    invoke-direct/range {v5 .. v11}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 2012
    .line 2013
    .line 2014
    return-object v5
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 3

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
    const-string v2, "prompt=select_account"

    .line 48
    .line 49
    invoke-static {v1, v2, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p2, "prompt"

    .line 64
    .line 65
    const-string v0, "select_account"

    .line 66
    .line 67
    invoke-virtual {p0, p2, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
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
