.class public final Low0;
.super Landroidx/webkit/ProxyController;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;


# virtual methods
.method public final clearProxyOverride(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Ljj1;->c:Lz5;

    .line 2
    .line 3
    invoke-virtual {v0}, La6;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Llj1;->a:Lmj1;

    .line 14
    .line 15
    invoke-interface {v0}, Lmj1;->getProxyController()Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 20
    .line 21
    :cond_0
    invoke-interface {v0, p2, p1}, Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;->clearProxyOverride(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {}, Ljj1;->a()Ljava/lang/UnsupportedOperationException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public final setProxyOverride(Landroidx/webkit/ProxyConfig;Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    .locals 13

    .line 1
    sget-object v0, Ljj1;->c:Lz5;

    .line 2
    .line 3
    sget-object v1, Ljj1;->f:Lz5;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->getProxyRules()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x2

    .line 14
    new-array v5, v4, [I

    .line 15
    .line 16
    const/4 v6, 0x1

    .line 17
    aput v4, v5, v6

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    aput v3, v5, v4

    .line 21
    .line 22
    const-class v3, Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v3, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    move-object v8, v3

    .line 29
    check-cast v8, [[Ljava/lang/String;

    .line 30
    .line 31
    move v3, v4

    .line 32
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ge v3, v5, :cond_0

    .line 37
    .line 38
    aget-object v5, v8, v3

    .line 39
    .line 40
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    check-cast v7, Lmw0;

    .line 45
    .line 46
    iget-object v7, v7, Lmw0;->a:Ljava/lang/String;

    .line 47
    .line 48
    aput-object v7, v5, v4

    .line 49
    .line 50
    aget-object v5, v8, v3

    .line 51
    .line 52
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    check-cast v7, Lmw0;

    .line 57
    .line 58
    iget-object v7, v7, Lmw0;->b:Ljava/lang/String;

    .line 59
    .line 60
    aput-object v7, v5, v6

    .line 61
    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->getBypassRules()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    new-array v3, v4, [Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    move-object v9, v2

    .line 76
    check-cast v9, [Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0}, La6;->b()Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->isReverseBypassEnabled()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-nez v2, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 91
    .line 92
    if-nez p1, :cond_1

    .line 93
    .line 94
    sget-object p1, Llj1;->a:Lmj1;

    .line 95
    .line 96
    invoke-interface {p1}, Lmj1;->getProxyController()Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 101
    .line 102
    :cond_1
    move-object/from16 v10, p3

    .line 103
    .line 104
    invoke-interface {p1, v8, v9, v10, p2}, Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;->setProxyOverride([[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    move-object/from16 v10, p3

    .line 109
    .line 110
    invoke-virtual {v0}, La6;->b()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    invoke-virtual {v1}, La6;->b()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    iget-object v0, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 123
    .line 124
    if-nez v0, :cond_3

    .line 125
    .line 126
    sget-object v0, Llj1;->a:Lmj1;

    .line 127
    .line 128
    invoke-interface {v0}, Lmj1;->getProxyController()Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Low0;->a:Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;

    .line 133
    .line 134
    :cond_3
    move-object v7, v0

    .line 135
    invoke-virtual {p1}, Landroidx/webkit/ProxyConfig;->isReverseBypassEnabled()Z

    .line 136
    .line 137
    .line 138
    move-result v12

    .line 139
    move-object v11, p2

    .line 140
    invoke-interface/range {v7 .. v12}, Lorg/chromium/support_lib_boundary/ProxyControllerBoundaryInterface;->setProxyOverride([[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/util/concurrent/Executor;Z)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_4
    invoke-static {}, Ljj1;->a()Ljava/lang/UnsupportedOperationException;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    throw p0
.end method
