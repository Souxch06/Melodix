.class public final Lcom/melodix/music/AndBridge;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;
.field private final bridgeEpoch:I

# Command queue polled by the page (AndBridge.pollCommands): replaces the
# dead native->JS channel for user commands. Bounded, JSON-safe, never
# carries secrets — only whitelisted function names and their arguments.
.field private static cmdFns:Ljava/util/ArrayList;
.field private static cmdArgs:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

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

    sget v0, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    iput v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method private final dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/melodix/music/DiagCounters;->dispatchIn()V
    invoke-static {}, Lcom/melodix/music/DiagCounters;->notePageEvent()V

    iget v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v2, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v0, v2, :dispatch_drop

    if-eqz p2, :payload_ok
    invoke-virtual {p2}, Ljava/lang/String;->length()I
    move-result v0
    const/high16 v2, 0x40000
    if-gt v0, v2, :dispatch_drop

    :payload_ok
    const/4 v1, 0x0
    sget-object v0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v0, :try_ctx
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/melodix/music/MainActivity;

    :try_ctx
    if-nez v1, :got_activity
    iget-object v0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;
    instance-of v2, v0, Lcom/melodix/music/MainActivity;
    if-eqz v2, :dispatch_drop
    move-object v1, v0
    check-cast v1, Lcom/melodix/music/MainActivity;

    :got_activity
    if-eqz v1, :dispatch_drop
    invoke-virtual {v1, p1, p2}, Lcom/melodix/music/MainActivity;->postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :dispatch_drop
    invoke-static {}, Lcom/melodix/music/DiagCounters;->dispatchDropped()V

    :native_dispatch_done
    return-void
.end method

.method public final onNativeUiReady()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v0, v1, :native_ready_done

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

    iget v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v0, v1, :native_route_done

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

    iget v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v0, v1, :native_home_rows_done

    if-eqz p1, :home_rows_size_ok
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v0
    const/high16 v1, 0x40000
    if-gt v0, v1, :native_home_rows_done

    :home_rows_size_ok
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
    goto :cond_6

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
    goto :cond_6

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
    goto :cond_6

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
    goto :cond_6

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

    .line 1
    iget-object p0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;

    .line 2
    .line 3
    const v0, 0x7f110052

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
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # Runtime-only signal from the Web Player UI; re-evaluated on every app start.
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z
    return-void
.end method

.method public final logoutDetected()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const/4 v0, 0x0
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z

    # Keep the legacy preference false, but never alter Spotify's cookie jar.
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    const-string v2, "LoggedIn"
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    invoke-static {}, Lm9;->k()V
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
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {p1, p2, p3, p4}, Lcom/melodix/music/NativeFetchGuard;->execute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    return-object p1
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
    iget v2, v3, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v4, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v2, v4, :media_epoch_stale
    move-object/from16 v4, p2
    invoke-direct {v3, v1, v4}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    move-object/from16 v0, p2
    goto :media_epoch_ok

    :media_epoch_stale
    return-void

    :media_epoch_ok

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
    iget v2, v4, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v5, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v2, v5, :search_epoch_stale
    move-object/from16 v5, p2
    invoke-direct {v4, v1, v5}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V
    move-object/from16 v0, p2
    goto :search_epoch_ok

    :search_epoch_stale
    return-void

    :search_epoch_ok

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
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    if-eqz p3, :done
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :done
    const-string v0, "profile-image"
    invoke-direct {p0, v0, p3}, Lcom/melodix/music/AndBridge;->dispatchNativeUi(Ljava/lang/String;Ljava/lang/String;)V

    :done
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
    # Native artwork loading is a network sink: accept only HTTPS Spotify CDN URIs.
    # Reject arbitrary schemes/hosts and non-default ports before Picasso is invoked.
    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v1
    const/16 v2, 0x800
    if-gt v1, v2, :cond_artwork_invalid

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v2
    const-string v3, "https"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_artwork_invalid

    invoke-virtual {v1}, Landroid/net/Uri;->getPort()I
    move-result v2
    const/4 v3, -0x1
    if-eq v2, v3, :cond_artwork_port_ok
    const/16 v3, 0x1bb
    if-ne v2, v3, :cond_artwork_invalid

    :cond_artwork_port_ok
    invoke-virtual {v1}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :cond_artwork_invalid

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :cond_artwork_invalid
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1

    const-string v2, ".scdn.co"
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :cond_artwork_safe
    const-string v2, "scdn.co"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :cond_artwork_safe

    const-string v2, ".spotifycdn.com"
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :cond_artwork_safe
    const-string v2, "spotifycdn.com"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_artwork_invalid

    :cond_artwork_safe
    goto :goto_artwork_validated

    :cond_artwork_invalid
    const-string p0, ""

    :goto_artwork_validated
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

.method public final readDiagCounters()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/melodix/music/DiagCounters;->readJson()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final readDiagLog()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/melodix/music/DiagCounters;->readLog()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final copyToClipboard(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    if-eqz p1, :copy_done

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/AndBridge;->a:Landroid/content/Context;

    if-eqz v0, :copy_activity

    goto :copy_ctx_ready

    :copy_activity
    sget-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz v1, :copy_done

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    move-object v0, v1

    :copy_ctx_ready
    if-eqz v0, :copy_done

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    if-eqz v1, :copy_done

    const-string v2, "Melodix diagnostic"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const-string v1, "diag-copy ok"

    invoke-static {v1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :copy_done

    :catch_0
    move-exception v0

    :copy_done
    return-void
.end method

.method public static copyToClipboardStatic(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    if-eqz p1, :copy_static_fail

    :try_start_0
    if-eqz p0, :copy_static_fail

    const-string v0, "clipboard"
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/content/ClipboardManager;
    if-eqz v0, :copy_static_fail

    const-string v1, "Melodix diagnostic"
    invoke-static {v1, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const-string v0, "diag-copy ok"
    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1
    return v0

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V

    :copy_static_fail
    const/4 v0, 0x0
    return v0
.end method

.method public final logDiagEvent(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/melodix/music/DiagCounters;->notePageEvent()V
    if-eqz p1, :log_event_done

    invoke-static {p1}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    :log_event_done
    return-void
.end method

.method public final onMediaLibBatch(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # Bounded batch of the normalized library pushed BY THE PAGE (JS->native).
    # NativeLibCache validates every field, assembles the batches and persists
    # the category only when complete: an error never empties the cache.
    if-eqz p1, :libbatch_done

    invoke-static {p1}, Lcom/melodix/music/NativeLibCache;->accept(Ljava/lang/String;)V

    :libbatch_done
    return-void
.end method

.method public final onLibDiagState(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # Bounded library-state snapshot pushed BY THE PAGE (JS->native works even
    # when native->JS evaluateJavascript is dead on a device). Sanitized and
    # stored natively by DiagCounters.libState for the diagnostic screen.
    # Monotonic-epoch guard, same as onNativeHomeRows/dispatchNativeUi: a late
    # snapshot from a previous session must never overwrite newer state.
    iget v0, p0, Lcom/melodix/music/AndBridge;->bridgeEpoch:I
    sget v1, Lcom/melodix/music/MainActivity;->nativeSessionEpoch:I
    if-ne v0, v1, :libdiag_drop_epoch

    if-eqz p1, :libdiag_drop_empty

    invoke-static {p1}, Lcom/melodix/music/DiagCounters;->libState(Ljava/lang/String;)V

    :libdiag_done
    return-void

    # A dropped call must not look like "never called": journal the reason so
    # lib-state calls=0 can be told apart from a blocked JS callback.
    :libdiag_drop_epoch
    const-string v0, "libdiag drop epoch"

    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    goto :libdiag_done

    :libdiag_drop_empty
    const-string v0, "libdiag drop empty"

    invoke-static {v0}, Lcom/melodix/music/DiagCounters;->event(Ljava/lang/String;)V

    goto :libdiag_done
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/melodix/music/AndBridge;->cmdFns:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/melodix/music/AndBridge;->cmdArgs:Ljava/util/ArrayList;

    return-void
.end method

.method public static isSafeFn(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :no

    const-string v0, "[A-Za-z_][A-Za-z0-9_]{0,48}"
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :no

    :yes
    const/4 v0, 0x1
    return v0

    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static declared-synchronized queueCommand(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-eqz p0, :done

    invoke-static {p0}, Lcom/melodix/music/AndBridge;->isSafeFn(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :done

    sget-object v0, Lcom/melodix/music/AndBridge;->cmdFns:Ljava/util/ArrayList;
    if-eqz v0, :done

    # Bounded queue: 32 pending commands max (oldest dropped first).
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    move-result v1
    const/16 v2, 0x20
    if-ge v1, v2, :drop_oldest
    goto :enqueue

    :drop_oldest
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    sget-object v0, Lcom/melodix/music/AndBridge;->cmdArgs:Ljava/util/ArrayList;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :enqueue
    sget-object v0, Lcom/melodix/music/AndBridge;->cmdFns:Ljava/util/ArrayList;
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/melodix/music/AndBridge;->cmdArgs:Ljava/util/ArrayList;
    if-eqz p1, :arg_empty
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :done

    :arg_empty
    const-string v1, ""
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :done
    return-void
.end method

.method public final declared-synchronized pollCommands()Ljava/lang/String;
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    # Synchronous: the page polls this and executes what comes back. The
    # response also tells the page which native screen is showing ("ui") so it
    # can shorten its polling interval while the native UI is visible.

    :try_start_p
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "{\"ui\":"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0
    sget-object v2, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;
    if-eqz v2, :ui_null
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/melodix/music/MainActivity;
    if-eqz v2, :ui_null
    iget-object v2, v2, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    move-object v1, v2

    :ui_null
    if-eqz v1, :ui_empty
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :ui_done

    :ui_empty
    const-string v2, "\"\""
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :ui_done
    const-string v2, ",\"cmds\":["
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/melodix/music/AndBridge;->cmdFns:Ljava/util/ArrayList;
    if-eqz v2, :cmds_done
    sget-object v3, Lcom/melodix/music/AndBridge;->cmdArgs:Ljava/util/ArrayList;
    if-eqz v3, :cmds_done

    const/4 v4, 0x0

    :drain
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I
    move-result v5
    if-eqz v5, :cmds_done
    const/4 v5, 0x4
    if-ge v4, v5, :cmds_done

    const/4 v5, 0x0
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    const/4 v6, 0x0
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;

    if-eqz v4, :no_comma
    const-string v7, ","
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :no_comma
    const-string v7, "{\"fn\":"
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {v5}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, ",\"arg\":"
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz v6, :arg_q
    invoke-static {v6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    goto :arg_q_done

    :arg_q
    const-string v7, "\"\""

    :arg_q_done
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, "}"
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1
    goto :drain

    :cmds_done
    const-string v7, "]}"
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
    :try_end_p
    .catch Ljava/lang/Throwable; {:try_start_p .. :try_end_p} :catch_p

    return-object v7

    :catch_p
    move-exception v7
    const-string v0, "{\"ui\":\"\",\"cmds\":[]}"
    return-object v0
.end method
