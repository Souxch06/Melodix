.class public final Lm9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static a(Landroid/webkit/WebView;)V
    .locals 5

    .line 1
    const-string p0, "PROXY_OVERRIDE"

    .line 2
    .line 3
    invoke-static {p0}, Ljj1;->b(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const/16 v1, 0x1c

    .line 18
    .line 19
    if-lt v0, v1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Leq;->a(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    new-instance v0, Landroid/os/Handler;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Lq10;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0, v1, v0}, Lq10;-><init>(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 45
    .line 46
    const-string v1, "none"

    .line 47
    .line 48
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    sget-object v0, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    sget v0, Lcom/melodix/music/AppSingleton;->e0:I

    .line 63
    .line 64
    if-gtz v0, :cond_2

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    sget-object v0, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 68
    .line 69
    const-string v1, "socks5"

    .line 70
    .line 71
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    const-string v1, "http"

    .line 79
    .line 80
    :goto_1
    :try_start_0
    new-instance v0, Landroidx/webkit/ProxyConfig$Builder;

    .line 81
    .line 82
    invoke-direct {v0}, Landroidx/webkit/ProxyConfig$Builder;-><init>()V

    .line 83
    .line 84
    .line 85
    sget-object v2, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 86
    .line 87
    sget v3, Lcom/melodix/music/AppSingleton;->e0:I

    .line 88
    .line 89
    new-instance v4, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, "://"

    .line 98
    .line 99
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v1, ":"

    .line 106
    .line 107
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Landroidx/webkit/ProxyConfig$Builder;->addProxyRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "localhost"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroidx/webkit/ProxyConfig$Builder;->addBypassRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "127.0.0.1"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroidx/webkit/ProxyConfig$Builder;->addBypassRule(Ljava/lang/String;)Landroidx/webkit/ProxyConfig$Builder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Landroidx/webkit/ProxyConfig$Builder;->build()Landroidx/webkit/ProxyConfig;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    invoke-static {}, Landroidx/webkit/ProxyController;->getInstance()Landroidx/webkit/ProxyController;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    new-instance v2, Lx3;

    .line 145
    .line 146
    const/4 v3, 0x7

    .line 147
    invoke-direct {v2, v3}, Lx3;-><init>(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v0, p0, v2}, Landroidx/webkit/ProxyController;->setProxyOverride(Landroidx/webkit/ProxyConfig;Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_4
    :goto_2
    invoke-static {}, Landroidx/webkit/ProxyController;->getInstance()Landroidx/webkit/ProxyController;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Lx3;

    .line 159
    .line 160
    const/4 v2, 0x6

    .line 161
    invoke-direct {v1, v2}, Lx3;-><init>(I)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, p0, v1}, Landroidx/webkit/ProxyController;->clearProxyOverride(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .line 166
    .line 167
    :catch_0
    :goto_3
    return-void
.end method

.method public static b()V
    .locals 5

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 7
    .line 8
    .line 9
    const-string v2, "AndBridge"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "WEB_VIEW_RENDERER_TERMINATE"

    .line 15
    .line 16
    invoke-static {v2}, Ljj1;->b(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    :try_start_1
    invoke-static {v0}, Lgj1;->c(Landroid/webkit/WebView;)Lnj1;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    sget-object v3, Ljj1;->b:Lz5;

    .line 29
    .line 30
    invoke-virtual {v3}, Lz5;->a()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    iget-object v2, v2, Lnj1;->b:Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2}, Le1;->g(Ljava/lang/Object;)Landroid/webkit/WebViewRenderProcess;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-static {v2}, Le1;->s(Landroid/webkit/WebViewRenderProcess;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v3}, La6;->b()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    iget-object v2, v2, Lnj1;->a:Lorg/chromium/support_lib_boundary/WebViewRendererBoundaryInterface;

    .line 60
    .line 61
    invoke-interface {v2}, Lorg/chromium/support_lib_boundary/WebViewRendererBoundaryInterface;->terminate()Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-static {}, Ljj1;->a()Ljava/lang/UnsupportedOperationException;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    throw v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    :catch_0
    :cond_2
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 75
    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    check-cast v2, Landroid/view/ViewGroup;

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move-object v2, v1

    .line 82
    :goto_1
    if-eqz v2, :cond_4

    .line 83
    .line 84
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    :cond_4
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 91
    .line 92
    .line 93
    :catch_1
    :cond_5
    sput-object v1, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 94
    .line 95
    sput-object v1, Lcom/melodix/music/AppSingleton;->x:Landroid/content/MutableContextWrapper;

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 99
    .line 100
    return-void
.end method

.method public static c()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->s:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "appContext"

    .line 7
    .line 8
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    throw v0
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    goto :cond_2

    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 21
    .line 22
    and-int/lit8 v1, v1, 0x2

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->W:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v1, 0x0

    .line 33
    :goto_0
    new-instance v2, Ljava/io/File;

    .line 34
    .line 35
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "hotfixes/"

    .line 44
    .line 45
    invoke-virtual {v4, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 56
    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    :try_start_0
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 67
    .line 68
    invoke-static {v2, v1}, Ldl1;->n(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    return-object v1

    .line 76
    :catch_0
    :cond_2
    :try_start_1
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 85
    .line 86
    .line 87
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 88
    :try_start_2
    new-instance v1, Ljava/io/BufferedReader;

    .line 89
    .line 90
    new-instance v2, Ljava/io/InputStreamReader;

    .line 91
    .line 92
    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 93
    .line 94
    .line 95
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 96
    .line 97
    .line 98
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->lines()Ljava/util/stream/Stream;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    const-string v3, "\n"

    .line 103
    .line 104
    invoke-static {v3}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Ljava/lang/String;

    .line 113
    .line 114
    sget-object v3, Lcom/melodix/music/AppSingleton;->f0:Ljava/util/concurrent/ConcurrentHashMap;

    .line 115
    .line 116
    invoke-virtual {v3, p0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 117
    .line 118
    .line 119
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 120
    .line 121
    .line 122
    const/4 p0, 0x0

    .line 123
    :try_start_5
    invoke-static {v0, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :catchall_0
    move-exception p0

    .line 131
    goto :goto_1

    .line 132
    :catchall_1
    move-exception p0

    .line 133
    :try_start_6
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 134
    :catchall_2
    move-exception v2

    .line 135
    :try_start_7
    invoke-static {v1, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 139
    :goto_1
    :try_start_8
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 140
    :catchall_3
    move-exception v1

    .line 141
    :try_start_9
    invoke-static {v0, p0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    throw v1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 145
    :catch_1
    const-string v2, ""

    .line 146
    .line 147
    :goto_2
    return-object v2
.end method

.method public static e()Landroid/content/SharedPreferences;
    .locals 1

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->u:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "prefs"

    .line 7
    .line 8
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    throw v0
.end method

.method public static f()Landroid/content/SharedPreferences$Editor;
    .locals 1

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->v:Landroid/content/SharedPreferences$Editor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "prefsEditor"

    .line 7
    .line 8
    invoke-static {v0}, Ldl1;->p(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    throw v0
.end method

.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    :try_start_0
    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    :catchall_0
    sget-object v1, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 9
    .line 10
    if-nez v1, :cond_a

    .line 11
    .line 12
    :try_start_1
    new-instance v1, Landroid/content/MutableContextWrapper;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/melodix/music/AppSingleton;->x:Landroid/content/MutableContextWrapper;

    .line 18
    .line 19
    new-instance p0, Ll9;

    .line 20
    .line 21
    invoke-direct {p0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    sput-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 25
    .line 26
    :try_start_2
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p0, v0}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 34
    .line 35
    .line 36
    :catch_0
    :try_start_3
    const-string v1, "DOCUMENT_START_SCRIPT"

    .line 37
    .line 38
    invoke-static {v1}, Ljj1;->b(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    :try_start_4
    sget v1, Lcom/melodix/music/AppSingleton;->j:I

    .line 45
    .line 46
    const-string v1, "desktop_spoof.js"

    .line 47
    .line 48
    invoke-static {v1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "*"

    .line 53
    .line 54
    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    invoke-static {p0, v1, v2}, Lgj1;->a(Ll9;Ljava/lang/String;Ljava/util/Set;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 62
    .line 63
    .line 64
    :catch_1
    :cond_0
    const/4 v1, 0x2

    .line 65
    :try_start_5
    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->setOverScrollMode(I)V

    .line 66
    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1}, Landroid/view/View;->setLongClickable(Z)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Lh9;

    .line 76
    .line 77
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 81
    .line 82
    .line 83
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 84
    .line 85
    const/16 v3, 0x1a

    .line 86
    .line 87
    if-lt v2, v3, :cond_1

    .line 88
    .line 89
    invoke-static {p0}, Li1;->o(Ll9;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    sget-boolean v2, Lcom/melodix/music/MainActivity;->l0:Z

    .line 93
    .line 94
    if-eqz v2, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/webkit/WebView;->clearFormData()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/webkit/WebView;->clearHistory()V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Landroid/webkit/WebStorage;->deleteAllData()V

    .line 110
    .line 111
    .line 112
    :cond_2
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 117
    move-result-object v3

    .line 118
    invoke-static {v3}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setOffscreenPreRaster(Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 149
    .line 150
    .line 151
    const-string v0, "REQUESTED_WITH_HEADER_ALLOW_LIST"

    .line 152
    .line 153
    invoke-static {v0}, Ljj1;->b(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 157
    if-eqz v0, :cond_4

    .line 158
    .line 159
    :try_start_6
    sget-object v0, Ljj1;->g:Lz5;

    .line 160
    .line 161
    invoke-virtual {v0}, La6;->b()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_3

    .line 166
    .line 167
    invoke-static {v2}, Lcj1;->a(Landroid/webkit/WebSettings;)Lmd1;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lmd1;->f()V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_3
    invoke-static {}, Ljj1;->a()Ljava/lang/UnsupportedOperationException;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 180
    :catch_2
    :cond_4
    :goto_0
    :try_start_7
    const-string v0, "BACK_FORWARD_CACHE"

    .line 181
    .line 182
    invoke-static {v0}, Ljj1;->b(Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 186
    if-eqz v0, :cond_6

    .line 187
    .line 188
    :try_start_8
    sget-object v0, Ljj1;->h:Lz5;

    .line 189
    .line 190
    invoke-virtual {v0}, La6;->b()Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_5

    .line 195
    .line 196
    invoke-static {v2}, Lcj1;->a(Landroid/webkit/WebSettings;)Lmd1;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lmd1;->e()V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_5
    invoke-static {}, Ljj1;->a()Ljava/lang/UnsupportedOperationException;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 209
    :catch_3
    :cond_6
    :goto_1
    const/16 v0, 0x64

    .line 210
    .line 211
    :try_start_9
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 212
    .line 213
    .line 214
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->E:Z

    .line 215
    .line 216
    if-eqz v0, :cond_7

    .line 217
    .line 218
    const/high16 v0, -0x1000000

    .line 219
    .line 220
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_7
    const-string v0, "#121212"

    .line 225
    .line 226
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 231
    .line 232
    .line 233
    :goto_2
    new-instance v0, Lcom/melodix/music/AndBridge;

    .line 234
    .line 235
    sget v2, Lcom/melodix/music/AppSingleton;->j:I

    .line 236
    .line 237
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-direct {v0, v2}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V

    .line 242
    .line 243
    .line 244
    const-string v2, "AndBridge"

    .line 245
    .line 246
    invoke-virtual {p0, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    new-instance v0, Lb91;

    .line 250
    .line 251
    new-instance v2, Li9;

    .line 252
    .line 253
    invoke-direct {v2, v1}, Li9;-><init>(I)V

    .line 254
    .line 255
    .line 256
    new-instance v1, Lj9;

    .line 257
    .line 258
    invoke-direct {v1}, Lj9;-><init>()V

    .line 259
    .line 260
    .line 261
    invoke-direct {v0, v2, v1}, Lb91;-><init>(Li9;Lj9;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 265
    .line 266
    .line 267
    new-instance v0, Lc91;

    .line 268
    .line 269
    invoke-direct {v0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 273
    .line 274
    .line 275
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 276
    .line 277
    if-nez v0, :cond_9

    .line 278
    .line 279
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 280
    .line 281
    if-eqz v0, :cond_8

    .line 282
    .line 283
    sget-boolean v0, Lcom/melodix/music/MainActivity;->l0:Z

    .line 284
    .line 285
    if-nez v0, :cond_8

    .line 286
    .line 287
    # Match native requests to the Chrome version already exposed through desktop_spoof.js client hints.
    const-string v0, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v1
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    const-string v0, "https://open.spotify.com/"

    .line 288
    .line 289
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    goto :goto_3

    .line 293
    :cond_8
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const-string v0, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    const-string v0, "https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1"

    .line 294
    .line 295
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    :cond_9
    :goto_3
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 299
    .line 300
    if-eqz p0, :cond_b

    .line 301
    .line 302
    invoke-static {p0}, Lm9;->a(Landroid/webkit/WebView;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 303
    .line 304
    .line 305
    goto :goto_4

    .line 306
    :catchall_1
    const/4 p0, 0x0

    .line 307
    sput-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 308
    .line 309
    goto :goto_4

    .line 310
    :cond_a
    :try_start_a
    sget-object v0, Lcom/melodix/music/AppSingleton;->x:Landroid/content/MutableContextWrapper;

    .line 311
    .line 312
    if-eqz v0, :cond_b

    .line 313
    .line 314
    invoke-virtual {v0, p0}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 315
    .line 316
    .line 317
    :catchall_2
    :cond_b
    :goto_4
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 318
    .line 319
    return-object p0
.end method

.method public static h(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "\n                (function(){\n                    var cst = document.getElementById(\'sf-user-custom-css\');\n                    if ("

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " === \"\") {\n                        if (cst) cst.remove();\n                        return;\n                    }\n                    if (!cst) {\n                        cst = document.createElement(\'style\');\n                        cst.id = \'sf-user-custom-css\';\n                    }\n                    cst.textContent = "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, ";\n                    var target = document.head || document.documentElement;\n                    if (target && !cst.parentNode) {\n                        target.appendChild(cst);\n                    }\n                })();\n            "

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Lea1;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    new-instance v1, Lr4;

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    invoke-direct {v1, p0, v2}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public static i()Z
    .locals 2

    .line 1
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "connectivity"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :goto_0
    const/4 v0, 0x0

    .line 30
    return v0

    .line 31
    :cond_1
    const/16 v1, 0xc

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    return v0
.end method

.method public static j()V
    .locals 6

    .line 1
    :try_start_0
    sget-object v0, Lcom/melodix/music/AppSingleton;->Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/io/File;

    .line 7
    .line 8
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "adblock_hosts.txt"

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    new-instance v1, Ljava/io/BufferedReader;

    .line 28
    .line 29
    new-instance v2, Ljava/io/InputStreamReader;

    .line 30
    .line 31
    new-instance v3, Ljava/io/FileInputStream;

    .line 32
    .line 33
    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    .line 44
    .line 45
    new-instance v2, Ljava/io/InputStreamReader;

    .line 46
    .line 47
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const-string v4, "adblock_hosts.txt"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 65
    .line 66
    .line 67
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    :goto_1
    const/4 v3, 0x1

    .line 72
    if-eqz v2, :cond_7

    .line 73
    .line 74
    invoke-static {v2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-lez v4, :cond_6

    .line 87
    .line 88
    const-string v4, "#"

    .line 89
    .line 90
    const/4 v5, 0x0

    .line 91
    invoke-static {v2, v4, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-nez v4, :cond_6

    .line 96
    .line 97
    const-string v4, "!"

    .line 98
    .line 99
    invoke-static {v2, v4, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-nez v4, :cond_6

    .line 104
    .line 105
    const-string v4, "||"

    .line 106
    .line 107
    invoke-static {v2, v4, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-eqz v4, :cond_1

    .line 112
    .line 113
    const/4 v4, 0x2

    .line 114
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    goto :goto_2

    .line 119
    :catchall_0
    move-exception v0

    .line 120
    goto/16 :goto_7

    .line 121
    .line 122
    :cond_1
    :goto_2
    const-string v4, "^"

    .line 123
    .line 124
    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eqz v4, :cond_2

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    sub-int/2addr v4, v3

    .line 135
    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    :cond_2
    const-string v3, "0.0.0.0"

    .line 140
    .line 141
    invoke-static {v2, v3, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    if-eqz v3, :cond_3

    .line 146
    .line 147
    const/4 v3, 0x7

    .line 148
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-static {v2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    goto :goto_3

    .line 161
    :cond_3
    const-string v3, "127.0.0.1"

    .line 162
    .line 163
    invoke-static {v2, v3, v5}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-eqz v3, :cond_4

    .line 168
    .line 169
    const/16 v3, 0x9

    .line 170
    .line 171
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-static {v2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    :cond_4
    :goto_3
    const/16 v3, 0x23

    .line 184
    .line 185
    const/4 v4, 0x6

    .line 186
    invoke-static {v2, v3, v5, v4}, Lda1;->C(Ljava/lang/CharSequence;CII)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    const/4 v4, -0x1

    .line 191
    if-eq v3, v4, :cond_5

    .line 192
    .line 193
    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    :cond_5
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    if-lez v3, :cond_6

    .line 210
    .line 211
    sget-object v3, Lcom/melodix/music/AppSingleton;->Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 212
    .line 213
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 214
    .line 215
    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    :cond_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    goto/16 :goto_1

    .line 230
    .line 231
    :cond_7
    :try_start_2
    invoke-interface {v1}, Ljava/io/Closeable;->close()V

    .line 232
    .line 233
    .line 234
    sget-object v1, Lcom/melodix/music/AppSingleton;->Y:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->size()I

    .line 237
    .line 238
    .line 239
    new-instance v1, Ln3;

    .line 240
    .line 241
    invoke-direct {v1}, Ln3;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-eqz v2, :cond_8

    .line 249
    .line 250
    invoke-virtual {v1, v0}, Ln3;->d(Ljava/io/File;)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_8
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    const-string v2, "adblock_hosts.txt"

    .line 263
    .line 264
    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 265
    .line 266
    .line 267
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 268
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v0}, Ln3;->f(Ljava/io/InputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 272
    .line 273
    .line 274
    :try_start_4
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 275
    .line 276
    .line 277
    :goto_4
    iget-object v0, v1, Ln3;->c:Ljava/lang/StringBuilder;

    .line 278
    .line 279
    monitor-enter v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 280
    :try_start_5
    iget-object v2, v1, Ln3;->c:Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    if-lez v2, :cond_9

    .line 287
    .line 288
    iget-object v2, v1, Ln3;->c:Ljava/lang/StringBuilder;

    .line 289
    .line 290
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 294
    :try_start_6
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    iput-object v2, v1, Ln3;->a:Ljava/util/regex/Pattern;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 299
    .line 300
    goto :goto_5

    .line 301
    :catchall_1
    move-exception v1

    .line 302
    goto :goto_6

    .line 303
    :catch_0
    :cond_9
    :goto_5
    :try_start_7
    monitor-exit v0

    .line 304
    sput-object v1, Lcom/melodix/music/AppSingleton;->Z:Ln3;

    .line 305
    .line 306
    goto :goto_8

    .line 307
    :goto_6
    monitor-exit v0

    .line 308
    throw v1
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 309
    :catchall_2
    move-exception v1

    .line 310
    :try_start_8
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 311
    :catchall_3
    move-exception v2

    .line 312
    :try_start_9
    invoke-static {v0, v1}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 313
    .line 314
    .line 315
    throw v2
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 316
    :goto_7
    :try_start_a
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 317
    :catchall_4
    move-exception v2

    .line 318
    :try_start_b
    invoke-static {v1, v0}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 319
    .line 320
    .line 321
    throw v2
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    .line 322
    :catch_1
    :goto_8
    return-void
.end method

.method public static k()V
    .locals 3

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/melodix/music/MainActivity;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v1, Lx3;

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    invoke-direct {v1, v2}, Lx3;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static l()V
    .locals 8

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->R:Z

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->E:Z

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->D:Z

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->C:Z

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    sget-object v6, Lcom/melodix/music/AppSingleton;->y:Ljava/lang/String;

    .line 32
    .line 33
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->S:Z

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    filled-new-array/range {v1 .. v7}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x7

    .line 44
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "{ isCanvasDisabled: %b, isFullScreenEnabled: %b, isAmoled: %b, closeNowPlay: %b, takeControl: %b, autoPlayMode: \'%s\', dockLeftSidebar: %b }"

    .line 49
    .line 50
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v1, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    new-instance v2, Lr4;

    .line 59
    .line 60
    const/4 v3, 0x2

    .line 61
    invoke-direct {v2, v0, v3}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public static m(IZ)V
    .locals 8

    .line 1
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    and-int/lit8 v0, p0, 0x1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-boolean p1, Lcom/melodix/music/WebService;->s:Z

    .line 8
    .line 9
    :cond_0
    and-int/lit8 p0, p0, 0x2

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    move p0, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    :goto_0
    sget-boolean v1, Lcom/melodix/music/WebService;->r:Z

    .line 18
    .line 19
    sget v1, Lcom/melodix/music/AppSingleton;->P:I

    .line 20
    .line 21
    if-lez v1, :cond_2

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    sget v1, Lcom/melodix/music/AppSingleton;->k:I

    .line 25
    .line 26
    :goto_1
    sget-boolean v2, Lcom/melodix/music/WebService;->r:Z

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    const-wide/32 v4, 0xea60

    .line 30
    .line 31
    .line 32
    if-eqz v2, :cond_6

    .line 33
    .line 34
    if-lez v1, :cond_6

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_3
    if-nez p0, :cond_4

    .line 40
    .line 41
    sget-object v0, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 42
    .line 43
    if-nez v0, :cond_8

    .line 44
    .line 45
    :cond_4
    sget-object v0, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 46
    .line 47
    if-eqz v0, :cond_5

    .line 48
    .line 49
    sget-object v2, Lcom/melodix/music/AppSingleton;->o:Landroid/os/Handler;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    :cond_5
    new-instance v0, Lx3;

    .line 55
    .line 56
    const/4 v2, 0x4

    .line 57
    invoke-direct {v0, v2}, Lx3;-><init>(I)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 61
    .line 62
    sget-object v0, Lcom/melodix/music/AppSingleton;->o:Landroid/os/Handler;

    .line 63
    .line 64
    sget-object v2, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    int-to-long v6, v1

    .line 70
    mul-long/2addr v6, v4

    .line 71
    invoke-virtual {v0, v2, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 72
    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_6
    :goto_2
    if-eqz p1, :cond_7

    .line 76
    .line 77
    sput v0, Lcom/melodix/music/AppSingleton;->k:I

    .line 78
    .line 79
    :cond_7
    sget-object v0, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 80
    .line 81
    if-eqz v0, :cond_8

    .line 82
    .line 83
    sget-object v1, Lcom/melodix/music/AppSingleton;->o:Landroid/os/Handler;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    sput-object v3, Lcom/melodix/music/AppSingleton;->q:Lx3;

    .line 89
    .line 90
    :cond_8
    :goto_3
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 91
    .line 92
    if-eqz v0, :cond_c

    .line 93
    .line 94
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 95
    .line 96
    if-lez v0, :cond_c

    .line 97
    .line 98
    if-nez p1, :cond_9

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_9
    if-nez p0, :cond_a

    .line 102
    .line 103
    sget-object p0, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 104
    .line 105
    if-nez p0, :cond_d

    .line 106
    .line 107
    :cond_a
    sget-object p0, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 108
    .line 109
    if-eqz p0, :cond_b

    .line 110
    .line 111
    sget-object p1, Lcom/melodix/music/AppSingleton;->p:Landroid/os/Handler;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    :cond_b
    new-instance p0, Lx3;

    .line 117
    .line 118
    const/4 p1, 0x5

    .line 119
    invoke-direct {p0, p1}, Lx3;-><init>(I)V

    .line 120
    .line 121
    .line 122
    sput-object p0, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 123
    .line 124
    sget-object p0, Lcom/melodix/music/AppSingleton;->p:Landroid/os/Handler;

    .line 125
    .line 126
    sget-object p1, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 132
    .line 133
    int-to-long v0, v0

    .line 134
    mul-long/2addr v0, v4

    .line 135
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_c
    :goto_4
    sget-object p0, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 140
    .line 141
    if-eqz p0, :cond_d

    .line 142
    .line 143
    sget-object p1, Lcom/melodix/music/AppSingleton;->p:Landroid/os/Handler;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 146
    .line 147
    .line 148
    sput-object v3, Lcom/melodix/music/AppSingleton;->r:Lx3;

    .line 149
    .line 150
    :cond_d
    return-void
.end method
