.class public final Lcom/melodix/music/AndBridge;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method private final dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v1, 0x0
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :try_ctx
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;

    :try_ctx
    if-eqz v1, :got_activity
    iget-object v0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;
    instance-of v2, v0, Lcom/melodix/music/MainActivity;
    if-eqz v2, :native_dispatch_done
    move-object v1, v0
    check-cast v1, Lcom/melodix/music/MainActivity;

    :got_activity
    if-eqz v1, :native_dispatch_done
    invoke-virtual {v1, p1, p2}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    :native_dispatch_done
    return-void
.end method

.method public final onNativeUiReady()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :native_ready_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;
    if-eqz v1, :native_ready_done
    invoke-virtual {v1}, Lcom/melodix/music/MainActivity;->postNativeUiReady()V

    :native_ready_done
    return-void
.end method

.method public final onNativeUiRoute(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :native_route_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;
    if-eqz v1, :native_route_done
    invoke-virtual {v1, p1}, Lcom/melodix/music/MainActivity;->postNativeUiRoute(Ljava/lang/String;)V

    :native_route_done
    return-void
.end method

.method public final onNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public final onNativeListText(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "list-text"
    invoke-direct {p0, v0, p1}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public final onNativeHomeRows(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :native_home_rows_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;
    if-eqz v1, :native_home_rows_done
    new-instance v0, Lcom/melodix/music/NativeHomePaintRunnable;
    invoke-direct {v0, v1, p1}, Lcom/melodix/music/NativeHomePaintRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :native_home_rows_done
    return-void
.end method

.method public final nativeLogout()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :native_logout_done
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;
    if-eqz v1, :native_logout_done
    new-instance v0, Lcom/melodix/music/NativeLogoutRunnable;
    invoke-direct {v0, v1}, Lcom/melodix/music/NativeLogoutRunnable;-><init>(Lcom/melodix/music/MainActivity;)V
    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :native_logout_done
    return-void
.end method

.method public final onNativeProfileImage(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "profile-image"
    invoke-direct {p0, v0, p1}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public final cssInjected()V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    invoke-static {}, Lm9;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final deferMessage(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz p0, :cond_6

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 13
    .line 14
    if-eqz p0, :cond_6

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const v1, -0x448729b6

    .line 21
    .line 22
    .line 23
    if-eq v0, v1, :cond_4

    .line 24
    .line 25
    const v1, -0x37b57e67

    .line 26
    .line 27
    .line 28
    if-eq v0, v1, :cond_2

    .line 29
    .line 30
    const v1, -0x321820bc

    .line 31
    .line 32
    .line 33
    if-eq v0, v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string v0, "unlock"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const p1, 0x7f110120

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const-string v0, "reload"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const p1, 0x7f11011d

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const-string v0, "adblock"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    const p1, 0x7f110115

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    new-instance v0, Lr4;

    .line 90
    .line 91
    const/4 v1, 0x1

    .line 92
    invoke-direct {v0, p1, v1}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    :cond_6
    return-void
.end method

.method public final enterPip()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ls4;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, p0, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final enterPipVideo(II)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lp4;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, Lp4;-><init>(Lcom/melodix/music/MainActivity;II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final isSignatureValid()Z
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;

    .line 2
    .line 3
    # Resolve by name: a rebuild that renumbers the string table would leave a
    # hard-coded id pointing at another string, and the gate would then refuse
    # every build for the wrong reason.
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v2, "expected_signature_sha256"

    const-string v3, "string"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    :try_start_1
    const-string v0, ""

    .line 25
    .line 26
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_0
    const-string v2, "UNKNOWN"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    goto :goto_3

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v3, "SHA-256"

    .line 51
    .line 52
    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const/16 v5, 0x1c

    .line 59
    .line 60
    if-lt v4, v5, :cond_3

    .line 61
    .line 62
    const/high16 v4, 0x8000000

    .line 63
    .line 64
    invoke-virtual {v2, p0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ld1;->f(Landroid/content/pm/PackageInfo;)Landroid/content/pm/SigningInfo;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    invoke-static {p0}, Ld1;->y(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    :cond_2
    new-array p0, v1, [Landroid/content/pm/Signature;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    const/16 v4, 0x40

    .line 84
    .line 85
    invoke-virtual {v2, p0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 90
    .line 91
    if-nez p0, :cond_4

    .line 92
    .line 93
    new-array p0, v1, [Landroid/content/pm/Signature;

    .line 94
    .line 95
    :cond_4
    :goto_1
    array-length v2, p0

    .line 96
    move v4, v1

    .line 97
    :goto_2
    if-ge v4, v2, :cond_6

    .line 98
    .line 99
    aget-object v5, p0, v4

    .line 100
    .line 101
    invoke-virtual {v5}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-virtual {v3, v5}, Ljava/security/MessageDigest;->digest([B)[B

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    const-string v6, ":"

    .line 113
    .line 114
    new-instance v7, Lq4;

    .line 115
    .line 116
    invoke-direct {v7, v1}, Lq4;-><init>(I)V

    .line 117
    .line 118
    .line 119
    const/16 v8, 0x1e

    .line 120
    .line 121
    invoke-static {v5, v6, v7, v8}, Lia;->S([BLjava/lang/String;Lq4;I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_5

    .line 130
    .line 131
    :goto_3
    const/4 p0, 0x1

    .line 132
    return p0

    .line 133
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_6
    invoke-static {}, Lu30;->c()Lu30;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-class v0, Lv30;

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Lu30;->b(Ljava/lang/Class;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    check-cast p0, Lv30;

    .line 147
    .line 148
    if-eqz p0, :cond_7

    .line 149
    .line 150
    invoke-virtual {p0}, Lv30;->a()V

    .line 151
    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_7
    new-instance p0, Ljava/lang/NullPointerException;

    .line 155
    .line 156
    const-string v0, "FirebaseCrashlytics component is not present."

    .line 157
    .line 158
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    throw p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 162
    :catch_1
    :goto_4
    return v1
.end method

.method public final isWoke()Z
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getWindowVisibility()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

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

.method public final loginDetected()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 3
    .line 4
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 5
    .line 6
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "LoggedIn"

    .line 11
    .line 12
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final manageTShut(Z)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    xor-int/lit8 p0, p1, 0x1

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-static {p1, p0}, Lm9;->m(IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final manageTSleep(Z)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    invoke-static {p0, p1}, Lm9;->m(IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final nativeFetch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "body"

    .line 2
    .line 3
    const-string v0, "status"

    .line 4
    .line 5
    const-string v1, "User-Agent"

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    :try_start_0
    new-instance v3, Ljava/net/URL;

    .line 18
    .line 19
    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3}, Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/net/URLConnection;

    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 36
    .line 37
    :try_start_1
    invoke-virtual {v3, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v2, 0x2710

    .line 41
    .line 42
    invoke-virtual {v3, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Lorg/json/JSONObject;

    .line 49
    .line 50
    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    const-string v5, "sec-ch-ua"

    .line 62
    .line 63
    const/4 v6, 0x0

    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    :try_start_2
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 80
    .line 81
    invoke-virtual {v4, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    const-string v9, "x-requested-with"

    .line 89
    .line 90
    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    if-nez v9, :cond_0

    .line 95
    .line 96
    invoke-static {v8, v5, v6}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-eqz v5, :cond_1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {v3, v4, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :catchall_0
    move-exception p0

    .line 108
    move-object v2, v3

    .line 109
    goto/16 :goto_a

    .line 110
    .line 111
    :catch_0
    move-exception p1

    .line 112
    move-object v2, v3

    .line 113
    goto/16 :goto_9

    .line 114
    .line 115
    :cond_2
    const-string p3, "\"Not;A=Brand\";v=\"8\", \"Chromium\";v=\"134\", \"Google Chrome\";v=\"134\""

    .line 116
    .line 117
    invoke-virtual {v3, v5, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-string p3, "sec-ch-ua-mobile"

    .line 121
    .line 122
    const-string v2, "?0"

    .line 123
    .line 124
    invoke-virtual {v3, p3, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    const-string p3, "sec-ch-ua-platform"

    .line 128
    .line 129
    const-string v2, "\"Windows\""

    .line 130
    .line 131
    invoke-virtual {v3, p3, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string p3, "spclient.spotify.com"

    .line 135
    .line 136
    invoke-static {p1, p3, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 137
    .line 138
    .line 139
    move-result p3

    .line 140
    if-nez p3, :cond_3

    .line 141
    .line 142
    const-string p3, "scdn.co"

    .line 143
    .line 144
    invoke-static {p1, p3, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    if-nez p3, :cond_3

    .line 149
    .line 150
    const-string p3, "spotify.com"

    .line 151
    .line 152
    invoke-static {p1, p3, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    if-eqz p3, :cond_4

    .line 157
    .line 158
    :cond_3
    const-string p3, "Origin"

    .line 159
    .line 160
    const-string v2, "https://open.spotify.com"

    .line 161
    .line 162
    invoke-virtual {v3, p3, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    const-string p3, "Referer"

    .line 166
    .line 167
    const-string v2, "https://open.spotify.com/"

    .line 168
    .line 169
    invoke-virtual {v3, p3, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_4
    invoke-virtual {v3, v1}, Ljava/net/URLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    if-eqz p3, :cond_5

    .line 177
    .line 178
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 179
    .line 180
    .line 181
    move-result p3

    .line 182
    if-nez p3, :cond_6

    .line 183
    .line 184
    :cond_5
    const-string p3, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"

    .line 185
    .line 186
    invoke-virtual {v3, v1, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_6
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    invoke-virtual {p3, p1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    if-eqz v1, :cond_8

    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-nez v2, :cond_7

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_7
    const-string v2, "Cookie"

    .line 207
    .line 208
    invoke-virtual {v3, v2, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    :cond_8
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    const/4 v2, 0x1

    .line 216
    sparse-switch v1, :sswitch_data_0

    .line 217
    .line 218
    .line 219
    goto :goto_3

    .line 220
    :sswitch_0
    const-string v1, "DELETE"

    .line 221
    .line 222
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    if-nez p2, :cond_9

    .line 227
    .line 228
    goto :goto_3

    .line 229
    :sswitch_1
    const-string v1, "PATCH"

    .line 230
    .line 231
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    if-eqz p2, :cond_a

    .line 236
    .line 237
    goto :goto_2

    .line 238
    :sswitch_2
    const-string v1, "POST"

    .line 239
    .line 240
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    if-nez p2, :cond_9

    .line 245
    .line 246
    goto :goto_3

    .line 247
    :sswitch_3
    const-string v1, "PUT"

    .line 248
    .line 249
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    if-nez p2, :cond_9

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_9
    :goto_2
    if-eqz p4, :cond_a

    .line 257
    .line 258
    invoke-virtual {v3, v2}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v3}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 262
    .line 263
    .line 264
    move-result-object p2

    .line 265
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 266
    .line 267
    invoke-virtual {p4, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 268
    .line 269
    .line 270
    move-result-object p4

    .line 271
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    .line 273
    .line 274
    invoke-virtual {p2, p4}, Ljava/io/OutputStream;->write([B)V

    .line 275
    .line 276
    .line 277
    :cond_a
    :goto_3
    invoke-virtual {v3}, Ljava/net/URLConnection;->connect()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 281
    .line 282
    .line 283
    move-result p2

    .line 284
    new-instance p4, Lorg/json/JSONObject;

    .line 285
    .line 286
    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v3}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 294
    .line 295
    .line 296
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    :cond_b
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    if-eqz v4, :cond_c

    .line 309
    .line 310
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    check-cast v4, Ljava/util/Map$Entry;

    .line 315
    .line 316
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v5

    .line 320
    check-cast v5, Ljava/lang/String;

    .line 321
    .line 322
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    check-cast v4, Ljava/util/List;

    .line 327
    .line 328
    if-eqz v5, :cond_b

    .line 329
    .line 330
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 331
    .line 332
    .line 333
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 334
    .line 335
    .line 336
    move-result v7

    .line 337
    if-nez v7, :cond_b

    .line 338
    .line 339
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v4

    .line 343
    invoke-virtual {p4, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 344
    .line 345
    .line 346
    goto :goto_4

    .line 347
    :cond_c
    invoke-virtual {v3}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    const-string v4, "Set-Cookie"

    .line 352
    .line 353
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    check-cast v1, Ljava/util/List;

    .line 358
    .line 359
    if-eqz v1, :cond_e

    .line 360
    .line 361
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 366
    .line 367
    .line 368
    move-result v4

    .line 369
    if-eqz v4, :cond_d

    .line 370
    .line 371
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v4

    .line 375
    check-cast v4, Ljava/lang/String;

    .line 376
    .line 377
    invoke-virtual {p3, p1, v4}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    goto :goto_5

    .line 381
    :cond_d
    invoke-virtual {p3}, Landroid/webkit/CookieManager;->flush()V

    .line 382
    .line 383
    .line 384
    :cond_e
    const/16 p1, 0xc8

    .line 385
    .line 386
    if-gt p1, p2, :cond_f

    .line 387
    .line 388
    const/16 p1, 0x12c

    .line 389
    .line 390
    if-ge p2, p1, :cond_f

    .line 391
    .line 392
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    goto :goto_6

    .line 397
    :cond_f
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 398
    .line 399
    .line 400
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 401
    :goto_6
    if-eqz p1, :cond_10

    .line 402
    .line 403
    :try_start_3
    invoke-static {p1}, Lcg1;->p(Ljava/io/InputStream;)[B

    .line 404
    .line 405
    .line 406
    move-result-object p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 407
    :try_start_4
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 408
    .line 409
    .line 410
    goto :goto_7

    .line 411
    :catchall_1
    move-exception p2

    .line 412
    :try_start_5
    throw p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 413
    :catchall_2
    move-exception p3

    .line 414
    :try_start_6
    invoke-static {p1, p2}, Lkn1;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 415
    .line 416
    .line 417
    throw p3

    .line 418
    :cond_10
    new-array p3, v6, [B

    .line 419
    .line 420
    :goto_7
    invoke-virtual {v3}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    if-nez p1, :cond_11

    .line 425
    .line 426
    const-string p1, ""

    .line 427
    .line 428
    :cond_11
    const-string v1, "protobuf"

    .line 429
    .line 430
    invoke-static {p1, v1, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 431
    .line 432
    .line 433
    move-result v1

    .line 434
    if-nez v1, :cond_12

    .line 435
    .line 436
    const-string v1, "octet-stream"

    .line 437
    .line 438
    invoke-static {p1, v1, v6}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 439
    .line 440
    .line 441
    move-result p1

    .line 442
    if-eqz p1, :cond_13

    .line 443
    .line 444
    :cond_12
    move v6, v2

    .line 445
    :cond_13
    if-eqz v6, :cond_14

    .line 446
    .line 447
    const/4 p1, 0x2

    .line 448
    invoke-static {p3, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    goto :goto_8

    .line 453
    :cond_14
    new-instance p1, Ljava/lang/String;

    .line 454
    .line 455
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 456
    .line 457
    invoke-direct {p1, p3, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 458
    .line 459
    .line 460
    :goto_8
    new-instance p3, Lorg/json/JSONObject;

    .line 461
    .line 462
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 463
    .line 464
    .line 465
    invoke-virtual {p3, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 466
    .line 467
    .line 468
    const-string p2, "headers"

    .line 469
    .line 470
    invoke-virtual {p3, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 471
    .line 472
    .line 473
    invoke-virtual {p3, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 474
    .line 475
    .line 476
    const-string p1, "isBinary"

    .line 477
    .line 478
    invoke-virtual {p3, p1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 479
    .line 480
    .line 481
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object p1

    .line 485
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 486
    .line 487
    .line 488
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 489
    .line 490
    .line 491
    return-object p1

    .line 492
    :catchall_3
    move-exception p0

    .line 493
    goto :goto_a

    .line 494
    :catch_1
    move-exception p1

    .line 495
    :goto_9
    :try_start_7
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    new-instance p2, Lorg/json/JSONObject;

    .line 499
    .line 500
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 501
    .line 502
    .line 503
    const/16 p3, 0x1f4

    .line 504
    .line 505
    invoke-virtual {p2, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 506
    .line 507
    .line 508
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object p1

    .line 512
    if-nez p1, :cond_15

    .line 513
    .line 514
    const-string p1, "Unknown error"

    .line 515
    .line 516
    :cond_15
    invoke-virtual {p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 517
    .line 518
    .line 519
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object p0

    .line 523
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 524
    .line 525
    .line 526
    if-eqz v2, :cond_16

    .line 527
    .line 528
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 529
    .line 530
    .line 531
    :cond_16
    return-object p0

    .line 532
    :goto_a
    if-eqz v2, :cond_17

    .line 533
    .line 534
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 535
    .line 536
    .line 537
    :cond_17
    throw p0

    .line 538
    nop

    .line 539
    :sswitch_data_0
    .sparse-switch
        0x136ef -> :sswitch_3
        0x2590a0 -> :sswitch_2
        0x4862828 -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch
.end method

.method public final onMediaItemsLoaded(Ljava/lang/String;Ljava/lang/String;)V
    .locals 18
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "media:"
    move-object/from16 v2, p1
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    move-object/from16 v3, p0
    move-object/from16 v4, p2
    invoke-direct {v3, v1, v4}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    move-object/from16 v0, p2

    .line 7
    .line 8
    .line 9
    sget-object v1, Lcom/melodix/music/WebService;->E:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    move-object/from16 v2, p1

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/media/MediaBrowserServiceCompat$Result;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-lez v3, :cond_7

    .line 32
    .line 33
    const-string v3, "null"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_7

    .line 40
    .line 41
    const-string v3, "[]"

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_7

    .line 48
    .line 49
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    .line 50
    .line 51
    invoke-direct {v3, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    const/4 v4, 0x0

    .line 59
    move v5, v4

    .line 60
    :goto_0
    if-ge v5, v0, :cond_7

    .line 61
    .line 62
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    const-string v7, "name"

    .line 67
    .line 68
    const-string v8, "Unknown"

    .line 69
    .line 70
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    const-string v8, "id"

    .line 75
    .line 76
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    if-eqz v8, :cond_6

    .line 81
    .line 82
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    if-nez v9, :cond_1

    .line 87
    .line 88
    goto/16 :goto_4

    .line 89
    .line 90
    :cond_1
    const-string v9, "image"

    .line 91
    .line 92
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    const-string v10, "artists"

    .line 97
    .line 98
    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    const-string v11, "browsable"

    .line 103
    .line 104
    invoke-virtual {v6, v11, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    const-string v11, ""

    .line 109
    .line 110
    if-eqz v10, :cond_3

    .line 111
    .line 112
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    if-lez v12, :cond_3

    .line 117
    .line 118
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 119
    .line 120
    .line 121
    move-result v11

    .line 122
    invoke-static {v4, v11}, Lkn1;->p(II)Lcf0;

    .line 123
    .line 124
    .line 125
    move-result-object v11

    .line 126
    new-instance v12, Ljava/util/ArrayList;

    .line 127
    .line 128
    const/16 v13, 0xa

    .line 129
    .line 130
    invoke-static {v11, v13}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 131
    .line 132
    .line 133
    move-result v13

    .line 134
    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v11}, Laf0;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    :goto_1
    move-object v13, v11

    .line 142
    check-cast v13, Lbf0;

    .line 143
    .line 144
    iget-boolean v13, v13, Lbf0;->l:Z

    .line 145
    .line 146
    if-eqz v13, :cond_2

    .line 147
    .line 148
    move-object v13, v11

    .line 149
    check-cast v13, Lbf0;

    .line 150
    .line 151
    invoke-virtual {v13}, Lbf0;->nextInt()I

    .line 152
    .line 153
    .line 154
    move-result v13

    .line 155
    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v13

    .line 159
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_2
    const-string v13, ", "

    .line 164
    .line 165
    const/16 v16, 0x0

    .line 166
    .line 167
    const/16 v17, 0x3e

    .line 168
    .line 169
    const/4 v14, 0x0

    .line 170
    const/4 v15, 0x0

    .line 171
    invoke-static/range {v12 .. v17}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    new-instance v11, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    const-string v12, "by "

    .line 181
    .line 182
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v11

    .line 192
    :cond_3
    new-instance v10, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 193
    .line 194
    invoke-direct {v10}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v10, v8}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 198
    .line 199
    .line 200
    move-result-object v8

    .line 201
    invoke-virtual {v8, v7}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    invoke-virtual {v7, v11}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setSubtitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 206
    .line 207
    .line 208
    move-result-object v7

    .line 209
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 213
    .line 214
    .line 215
    move-result v8

    .line 216
    if-lez v8, :cond_4

    .line 217
    .line 218
    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 219
    .line 220
    .line 221
    move-result-object v8

    .line 222
    goto :goto_2

    .line 223
    :cond_4
    const/4 v8, 0x0

    .line 224
    :goto_2
    invoke-virtual {v7, v8}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 225
    .line 226
    .line 227
    move-result-object v7

    .line 228
    invoke-virtual {v7}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    if-eqz v6, :cond_5

    .line 233
    .line 234
    const/4 v6, 0x1

    .line 235
    goto :goto_3

    .line 236
    :cond_5
    const/4 v6, 0x2

    .line 237
    :goto_3
    new-instance v8, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 238
    .line 239
    invoke-direct {v8, v7, v6}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;-><init>(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .line 244
    .line 245
    :cond_6
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :catch_0
    :cond_7
    invoke-virtual {v1, v2}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method public final onSearchCompleted(Ljava/lang/String;Ljava/lang/String;)V
    .locals 20
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "search:"
    move-object/from16 v2, p1
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    move-object/from16 v4, p0
    move-object/from16 v5, p2
    invoke-direct {v4, v1, v5}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    move-object/from16 v0, p2

    .line 7
    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    sget-object v2, Lcom/melodix/music/WebService;->F:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    move-object/from16 v3, p1

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroidx/media/MediaBrowserServiceCompat$Result;

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-lez v4, :cond_b

    .line 34
    .line 35
    const-string v4, "null"

    .line 36
    .line 37
    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-nez v4, :cond_b

    .line 42
    .line 43
    const-string v4, "[]"

    .line 44
    .line 45
    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-nez v4, :cond_b

    .line 50
    .line 51
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    .line 52
    .line 53
    invoke-direct {v4, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v5, 0x0

    .line 61
    move v6, v5

    .line 62
    :goto_0
    if-ge v6, v0, :cond_b

    .line 63
    .line 64
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    const-string v8, "name"

    .line 69
    .line 70
    const-string v9, "Unknown"

    .line 71
    .line 72
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    const-string v9, "id"

    .line 77
    .line 78
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    if-eqz v9, :cond_a

    .line 83
    .line 84
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    if-nez v10, :cond_1

    .line 89
    .line 90
    goto/16 :goto_6

    .line 91
    .line 92
    :cond_1
    const-string v10, "image"

    .line 93
    .line 94
    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    const-string v11, "type"

    .line 99
    .line 100
    invoke-virtual {v7, v11, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v11

    .line 104
    const-string v12, "artists"

    .line 105
    .line 106
    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    if-eqz v12, :cond_3

    .line 111
    .line 112
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    .line 113
    .line 114
    .line 115
    move-result v13

    .line 116
    if-lez v13, :cond_3

    .line 117
    .line 118
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    .line 119
    .line 120
    .line 121
    move-result v13

    .line 122
    invoke-static {v5, v13}, Lkn1;->p(II)Lcf0;

    .line 123
    .line 124
    .line 125
    move-result-object v13

    .line 126
    new-instance v14, Ljava/util/ArrayList;

    .line 127
    .line 128
    const/16 v15, 0xa

    .line 129
    .line 130
    invoke-static {v13, v15}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 131
    .line 132
    .line 133
    move-result v15

    .line 134
    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v13}, Laf0;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object v13

    .line 141
    :goto_1
    move-object v15, v13

    .line 142
    check-cast v15, Lbf0;

    .line 143
    .line 144
    iget-boolean v15, v15, Lbf0;->l:Z

    .line 145
    .line 146
    if-eqz v15, :cond_2

    .line 147
    .line 148
    move-object v15, v13

    .line 149
    check-cast v15, Lbf0;

    .line 150
    .line 151
    invoke-virtual {v15}, Lbf0;->nextInt()I

    .line 152
    .line 153
    .line 154
    move-result v15

    .line 155
    invoke-virtual {v12, v15}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v15

    .line 159
    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_2
    const-string v15, ", "

    .line 164
    .line 165
    const/16 v18, 0x0

    .line 166
    .line 167
    const/16 v19, 0x3e

    .line 168
    .line 169
    const/16 v16, 0x0

    .line 170
    .line 171
    const/16 v17, 0x0

    .line 172
    .line 173
    invoke-static/range {v14 .. v19}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v12

    .line 177
    goto :goto_2

    .line 178
    :cond_3
    move-object v12, v1

    .line 179
    :goto_2
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 183
    .line 184
    .line 185
    move-result v13

    .line 186
    if-lez v13, :cond_4

    .line 187
    .line 188
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 189
    .line 190
    .line 191
    move-result v13

    .line 192
    if-lez v13, :cond_4

    .line 193
    .line 194
    new-instance v13, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v11, " \u2022 "

    .line 203
    .line 204
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v11

    .line 214
    goto :goto_3

    .line 215
    :cond_4
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 216
    .line 217
    .line 218
    move-result v13

    .line 219
    if-lez v13, :cond_5

    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_5
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 223
    .line 224
    .line 225
    move-result v11

    .line 226
    if-lez v11, :cond_6

    .line 227
    .line 228
    new-instance v11, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .line 232
    .line 233
    const-string v13, "by "

    .line 234
    .line 235
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v11

    .line 245
    goto :goto_3

    .line 246
    :cond_6
    move-object v11, v1

    .line 247
    :goto_3
    const-string v12, "browsable"

    .line 248
    .line 249
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 250
    .line 251
    .line 252
    move-result v7

    .line 253
    new-instance v12, Landroid/os/Bundle;

    .line 254
    .line 255
    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v13, "android.media.browse.CONTENT_STYLE_BROWSABLE_HINT"

    .line 259
    .line 260
    const/4 v14, 0x2

    .line 261
    const/4 v15, 0x1

    .line 262
    if-eqz v7, :cond_7

    .line 263
    .line 264
    move v5, v14

    .line 265
    goto :goto_4

    .line 266
    :cond_7
    move v5, v15

    .line 267
    :goto_4
    invoke-virtual {v12, v13, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 268
    .line 269
    .line 270
    const-string v5, "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT"

    .line 271
    .line 272
    invoke-virtual {v12, v5, v15}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 273
    .line 274
    .line 275
    new-instance v5, Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 276
    .line 277
    invoke-direct {v5}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v5, v9}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setMediaId(Ljava/lang/String;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 281
    .line 282
    .line 283
    move-result-object v5

    .line 284
    invoke-virtual {v5, v8}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    invoke-virtual {v5, v11}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setSubtitle(Ljava/lang/CharSequence;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 296
    .line 297
    .line 298
    move-result v8

    .line 299
    if-lez v8, :cond_8

    .line 300
    .line 301
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 302
    .line 303
    .line 304
    move-result-object v8

    .line 305
    goto :goto_5

    .line 306
    :cond_8
    const/4 v8, 0x0

    .line 307
    :goto_5
    invoke-virtual {v5, v8}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->setIconUri(Landroid/net/Uri;)Landroid/support/v4/media/MediaDescriptionCompat$Builder;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-virtual {v5}, Landroid/support/v4/media/MediaDescriptionCompat$Builder;->build()Landroid/support/v4/media/MediaDescriptionCompat;

    .line 312
    .line 313
    .line 314
    move-result-object v5

    .line 315
    if-eqz v7, :cond_9

    .line 316
    .line 317
    move v14, v15

    .line 318
    :cond_9
    new-instance v7, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 319
    .line 320
    invoke-direct {v7, v5, v14}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;-><init>(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    .line 325
    .line 326
    :cond_a
    :goto_6
    add-int/lit8 v6, v6, 0x1

    .line 327
    .line 328
    const/4 v5, 0x0

    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :catch_0
    :cond_b
    invoke-virtual {v2, v3}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method public final onUserInfoCaptured(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

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
    const-string v4, "Create Playlist"

    .line 11
    .line 12
    const-string v5, "Liked songs"

    .line 13
    .line 14
    const-string v0, "Liked Songs"

    .line 15
    .line 16
    const-string v1, "Your Library"

    .line 17
    .line 18
    const-string v2, "Home"

    .line 19
    .line 20
    const-string v3, "Search"

    .line 21
    .line 22
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lbv;->m([Ljava/lang/Object;)Ljava/util/Set;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p2}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-static {p2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    invoke-static {p2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    sput-object p2, Lbh;->h:Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    invoke-static {p1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    const/4 v0, 0x0

    .line 68
    if-nez p2, :cond_1

    .line 69
    .line 70
    const-string p2, "collection"

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_1

    .line 77
    .line 78
    invoke-static {p1, p2, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-nez p2, :cond_1

    .line 83
    .line 84
    invoke-static {p1}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    sput-object p1, Lbh;->g:Ljava/lang/String;

    .line 96
    .line 97
    :cond_1
    invoke-static {p3}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_2

    .line 102
    .line 103
    invoke-static {p3}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    sput-object p1, Lbh;->i:Ljava/lang/String;

    .line 115
    .line 116
    :cond_2
    iget-object p0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;

    .line 117
    .line 118
    invoke-static {p0}, Lbh;->n(Landroid/content/Context;)Le2;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    if-nez p1, :cond_3

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :cond_3
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    const-string p3, "https://open.spotify.com"

    .line 131
    .line 132
    invoke-virtual {p2, p3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    if-nez p3, :cond_4

    .line 137
    .line 138
    const-string p3, "https://spotify.com"

    .line 139
    .line 140
    invoke-virtual {p2, p3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    if-nez p3, :cond_4

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_4
    move-object v6, p3

    .line 149
    invoke-static {v6}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    if-nez p2, :cond_a

    .line 154
    .line 155
    const-string p2, "sp_dc"

    .line 156
    .line 157
    invoke-static {v6, p2, v0}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-eqz p2, :cond_a

    .line 162
    .line 163
    iget-object p2, p1, Le2;->e:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v6, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    const-string p3, "Account "

    .line 170
    .line 171
    if-eqz p2, :cond_6

    .line 172
    .line 173
    sget-object p2, Lbh;->h:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p2}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-nez p2, :cond_5

    .line 180
    .line 181
    iget-object p2, p1, Le2;->b:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {p2, p3, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-nez p2, :cond_6

    .line 188
    .line 189
    :cond_5
    sget-object p2, Lbh;->g:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {p2}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-nez p2, :cond_a

    .line 196
    .line 197
    iget-object p2, p1, Le2;->c:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {p2}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    if-eqz p2, :cond_a

    .line 204
    .line 205
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 206
    .line 207
    .line 208
    move-result-wide v10

    .line 209
    iget-object v2, p1, Le2;->a:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v3, p1, Le2;->b:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v4, p1, Le2;->c:Ljava/lang/String;

    .line 214
    .line 215
    iget-object v5, p1, Le2;->d:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v7, p1, Le2;->f:Ljava/lang/String;

    .line 218
    .line 219
    iget-wide v8, p1, Le2;->g:J

    .line 220
    .line 221
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 222
    .line 223
    .line 224
    new-instance v1, Le2;

    .line 225
    .line 226
    invoke-direct/range {v1 .. v11}, Le2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 227
    .line 228
    .line 229
    sget-object p1, Lbh;->h:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {p1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-nez p1, :cond_7

    .line 236
    .line 237
    iget-object p1, v1, Le2;->b:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {p1, p3, v0}, Lla1;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_7

    .line 244
    .line 245
    sget-object p1, Lbh;->h:Ljava/lang/String;

    .line 246
    .line 247
    iput-object p1, v1, Le2;->b:Ljava/lang/String;

    .line 248
    .line 249
    :cond_7
    sget-object p1, Lbh;->g:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {p1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-nez p1, :cond_8

    .line 256
    .line 257
    sget-object p1, Lbh;->g:Ljava/lang/String;

    .line 258
    .line 259
    iput-object p1, v1, Le2;->c:Ljava/lang/String;

    .line 260
    .line 261
    :cond_8
    sget-object p1, Lbh;->i:Ljava/lang/String;

    .line 262
    .line 263
    invoke-static {p1}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-nez p1, :cond_9

    .line 268
    .line 269
    sget-object p1, Lbh;->i:Ljava/lang/String;

    .line 270
    .line 271
    iput-object p1, v1, Le2;->d:Ljava/lang/String;

    .line 272
    .line 273
    :cond_9
    invoke-static {p0, v1}, Lbh;->B(Landroid/content/Context;Le2;)V

    .line 274
    .line 275
    .line 276
    :cond_a
    :goto_0
    return-void
.end method

.method public final playLoaded()V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 3
    .line 4
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 5
    .line 6
    invoke-static {}, Lm9;->k()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final recMediaPosition(J)V
    .locals 7
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    sput-wide p1, Lcom/melodix/music/WebService;->z:J

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    sput-wide p0, Lcom/melodix/music/WebService;->A:J

    .line 10
    .line 11
    sget-object p0, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    :try_start_0
    iget-object p0, p0, Lcom/melodix/music/WebService;->j:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->isActive()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    sget-boolean p1, Lcom/melodix/music/WebService;->s:Z

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x3

    .line 31
    :goto_0
    move v1, p1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 p1, 0x2

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    new-instance p1, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 36
    .line 37
    invoke-direct {p1}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-wide/16 v2, 0x4337

    .line 41
    .line 42
    invoke-virtual {p1, v2, v3}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setActions(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-wide v2, Lcom/melodix/music/WebService;->z:J

    .line 47
    .line 48
    sget-wide v5, Lcom/melodix/music/WebService;->A:J

    .line 49
    .line 50
    const/high16 v4, 0x3f800000    # 1.0f

    .line 51
    .line 52
    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJFJ)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    invoke-static {p1}, Lzi1;->a(Landroid/support/v4/media/session/PlaybackStateCompat$Builder;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat;->setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    :catchall_0
    :cond_2
    :goto_2
    return-void
.end method

.method public final recMediaStatus(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "player"
    invoke-direct {p0, v0, p1}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "track"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_4

    .line 16
    .line 17
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-static {v0, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sput-object p1, Lcom/melodix/music/WebService;->v:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "artist"

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    sput-object p1, Lcom/melodix/music/WebService;->u:Ljava/lang/String;

    .line 41
    .line 42
    const-string p1, "position"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    sput-wide v0, Lcom/melodix/music/WebService;->z:J

    .line 49
    .line 50
    const-string p1, "duration"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    sput-wide v0, Lcom/melodix/music/WebService;->y:J

    .line 57
    .line 58
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    sput-wide v0, Lcom/melodix/music/WebService;->A:J

    .line 63
    .line 64
    const-string p1, "playing"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    sput-boolean p1, Lcom/melodix/music/WebService;->s:Z

    .line 71
    .line 72
    const-string p1, "repeat"

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    sput-object p1, Lcom/melodix/music/WebService;->w:Ljava/lang/String;

    .line 82
    .line 83
    const-string p1, "shuffle"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    sput-object p1, Lcom/melodix/music/WebService;->x:Ljava/lang/String;

    .line 93
    .line 94
    const-string p1, "fav"

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    sput-boolean p1, Lcom/melodix/music/WebService;->t:Z

    .line 101
    .line 102
    const-string p1, "cover"

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    const-string p1, "00004851"

    .line 112
    .line 113
    const-string v0, "0000b273"

    .line 114
    .line 115
    invoke-static {p0, p1, v0}, Lla1;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const/4 p1, 0x0

    .line 120
    sput-object p1, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 123
    .line 124
    const/4 v0, 0x0

    .line 125
    invoke-static {v0}, Lzi1;->b(Z)V

    .line 126
    .line 127
    .line 128
    sget-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 129
    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Lcom/melodix/music/MainActivity;

    .line 137
    .line 138
    if-eqz v1, :cond_3

    .line 139
    .line 140
    sget-boolean v2, Lcom/melodix/music/WebService;->s:Z

    .line 141
    .line 142
    iput-boolean v2, v1, Lcom/melodix/music/MainActivity;->U:Z

    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-lez v2, :cond_2

    .line 149
    .line 150
    iget-object v2, v1, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-nez v2, :cond_2

    .line 157
    .line 158
    iput-object p0, v1, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 159
    .line 160
    iget-boolean v2, v1, Lcom/melodix/music/MainActivity;->Y:Z

    .line 161
    .line 162
    if-nez v2, :cond_1

    .line 163
    .line 164
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 165
    .line 166
    const/16 v3, 0x1a

    .line 167
    .line 168
    if-lt v2, v3, :cond_0

    .line 169
    .line 170
    invoke-virtual {v1}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eqz v2, :cond_0

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_0
    iput-object p1, v1, Lcom/melodix/music/MainActivity;->T:Landroid/graphics/Bitmap;

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/Thread;

    .line 181
    .line 182
    new-instance v2, Lbl0;

    .line 183
    .line 184
    invoke-direct {v2, p0, v1}, Lbl0;-><init>(Ljava/lang/String;Lcom/melodix/music/MainActivity;)V

    .line 185
    .line 186
    .line 187
    invoke-direct {p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 191
    .line 192
    .line 193
    :cond_2
    :goto_1
    new-instance p1, Ls4;

    .line 194
    .line 195
    const/16 v2, 0x8

    .line 196
    .line 197
    invoke-direct {p1, v1, v2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 201
    .line 202
    .line 203
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-lez p1, :cond_4

    .line 208
    .line 209
    new-instance p1, Ljava/lang/Thread;

    .line 210
    .line 211
    new-instance v1, Lr4;

    .line 212
    .line 213
    invoke-direct {v1, p0, v0}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 214
    .line 215
    .line 216
    invoke-direct {p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .line 221
    .line 222
    :cond_4
    return-void

    .line 223
    :catch_0
    move-exception p0

    .line 224
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public final setCanvasDisabled(Z)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->Q:Z

    .line 2
    .line 3
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 4
    .line 5
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "DisableCanvas"

    .line 10
    .line 11
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final setExpanded(Z)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ls4;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final setSearchActive(Z)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->V:Z

    .line 2
    .line 3
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 4
    .line 5
    invoke-static {}, Lm9;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final wakeOff()V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    sget-object p0, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final wakeUp()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    new-instance p0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lx3;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {v0, v1}, Lx3;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 20
    .line 21
    sget-object p0, Lcom/melodix/music/WebService;->G:Lcom/melodix/music/WebService;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/melodix/music/WebService;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final injectBundledAsset(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # Recovery hook: pages can ask for a bundled script to be evaluated again
    # when its first injection never started (for example a stale WebView or a
    # dropped evaluateJavascript call). Only whitelisted assets are accepted.
    if-eqz p1, :asset_inject_done

    const-string v0, "spotify_bridge.js"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :asset_inject_done

    invoke-static {}, Lcom/melodix/music/NativeBridgeAsset;->loaderJavascript()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :asset_inject_done

    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz v0, :asset_inject_done

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/melodix/music/MainActivity;

    if-eqz v2, :asset_inject_done

    new-instance v3, Lcom/melodix/music/NativeAssetRunner;

    invoke-direct {v3, v2, v1}, Lcom/melodix/music/NativeAssetRunner;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :asset_inject_done
    return-void
.end method

.method public final readBundledAsset(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # The playback bridge is a 200 KB asset. Sending it through a single
    # evaluateJavascript call silently fails on some WebViews, so JavaScript
    # fetches the text through this whitelisted getter and executes it itself.
    const-string v1, ""

    if-eqz p1, :read_bundled_asset_done

    const-string v0, "spotify_bridge.js"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :read_bundled_asset_done

    invoke-static {p1}, Lm9;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :read_bundled_asset_done
    return-object v1
.end method
