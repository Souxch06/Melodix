.class public final Lcom/melodix/music/MainActivity;
.super Le6;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static h0:I

.field public static i0:Z

.field public static j0:Z

.field public static k0:Z

.field public static l0:Z


# instance fields
.field public G:Landroid/webkit/WebView;

.field public H:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public I:Landroid/widget/ImageView;

.field public J:Landroid/widget/ImageView;

.field public K:Landroid/widget/TextView;

.field public L:Landroid/widget/ImageButton;

.field public M:Lcom/melodix/music/LockableHScrollView;

.field public N:Landroid/widget/FrameLayout;

.field public O:Landroid/widget/TextView;

.field public P:Landroid/widget/TextView;

.field public Q:Landroid/widget/TextView;

.field public R:Landroid/widget/ProgressBar;

.field public S:Ljava/lang/String;

.field private sfResumePending:Z

.field public volatile T:Landroid/graphics/Bitmap;

.field public volatile U:Z

.field public V:Ljava/lang/String;

.field public W:Landroid/widget/FrameLayout;

.field public X:Landroid/widget/ImageView;

.field public Y:Z

.field public Z:Landroid/view/View;

.field public a0:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field public b0:Landroid/util/Rational;

.field public c0:Z

.field public final d0:Landroid/os/Handler;

.field public final e0:Lub2;

.field public final f0:Landroid/os/Handler;

.field public final g0:Ls4;

.field private nativeCurrentScreen:Ljava/lang/String;

# True once Spotify reports a track: the mini player card stays hidden until
# then instead of showing an empty "Aucune lecture en cours" bar everywhere.
.field private nativeHasTrack:Z

# Set by setNativeScreen: only a real screen change gets the fade, so the 1 s
# player feed cannot retrigger the animation.
.field private nativeFadeNextScreen:Z
.field private nativeCurrentTitle:Ljava/lang/String;
.field private nativeCurrentJson:Ljava/lang/String;
.field private nativeExpectedId:Ljava/lang/String;
.field private nativeExpectedSearch:Ljava/lang/String;
.field private nativeReturnScreen:Ljava/lang/String;
.field private nativeReturnTitle:Ljava/lang/String;
.field private nativeReturnJson:Ljava/lang/String;
.field private nativeReturnExpectedId:Ljava/lang/String;
.field private nativeReturnSearch:Ljava/lang/String;
.field private nativeSearchWatcherAttached:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->K:Z

    .line 2
    .line 3
    sput-boolean v0, Lcom/melodix/music/MainActivity;->j0:Z

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Le6;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->d0:Landroid/os/Handler;

    .line 18
    .line 19
    new-instance v0, Lub2;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-direct {v0, v1}, Lub2;-><init>(I)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->e0:Lub2;

    .line 26
    .line 27
    new-instance v0, Landroid/os/Handler;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;

    .line 37
    .line 38
    new-instance v0, Ls4;

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-direct {v0, p0, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->g0:Ls4;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 3
    .line 4
    sget-boolean v1, Lcom/melodix/music/MainActivity;->l0:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-virtual {v1, v3}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->removeSessionCookies(Landroid/webkit/ValueCallback;)V

    .line 18
    .line 19
    .line 20
    new-instance v3, Lal0;

    .line 21
    .line 22
    invoke-direct {v3, v0, v1}, Lal0;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v3}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/webkit/WebStorage;->deleteAllData()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Landroid/webkit/WebViewDatabase;->getInstance(Landroid/content/Context;)Landroid/webkit/WebViewDatabase;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/webkit/WebViewDatabase;->clearFormData()V

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Landroid/webkit/WebViewDatabase;->getInstance(Landroid/content/Context;)Landroid/webkit/WebViewDatabase;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroid/webkit/WebViewDatabase;->clearHttpAuthUsernamePassword()V

    .line 47
    .line 48
    .line 49
    :cond_0
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 50
    .line 51
    invoke-static {}, Lm9;->b()V

    .line 52
    .line 53
    .line 54
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 55
    .line 56
    new-instance v0, Landroid/content/Intent;

    .line 57
    .line 58
    const-class v1, Lcom/melodix/music/WebService;

    .line 59
    .line 60
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 64
    .line 65
    .line 66
    new-instance v0, Ls4;

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    invoke-direct {v0, p0, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v1, 0x4b0

    .line 73
    .line 74
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;

    .line 75
    .line 76
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final B(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 6
    .line 7
    :cond_0
    if-eqz p0, :cond_1

    .line 8
    .line 9
    new-instance v0, Lyk0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lyk0;-><init>(Landroid/webkit/WebView;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public final C()V
    .locals 6

    .line 1
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    invoke-static {p0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->P:Landroid/widget/TextView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v2, "Android System WebView missing or disabled."

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->D(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    const/4 v3, 0x0

    .line 37
    if-ne v0, v2, :cond_2

    .line 38
    .line 39
    move v0, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v0, v3

    .line 42
    :goto_0
    sget-object v4, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 43
    .line 44
    const-string v5, "bigwindow"

    .line 45
    .line 46
    invoke-static {v4, v5}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const/4 v5, -0x1

    .line 51
    if-eqz v4, :cond_4

    .line 52
    .line 53
    if-nez v0, :cond_4

    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v0, 0x258

    if-lt v4, v0, :cond_4

    .line 54
    .line 55
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->M:Lcom/melodix/music/LockableHScrollView;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/melodix/music/LockableHScrollView;->setScrollingEnabled(Z)V

    .line 60
    .line 61
    .line 62
    :cond_3
    const/16 v0, 0x640

    .line 63
    .line 64
    sput v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->M:Lcom/melodix/music/LockableHScrollView;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Lcom/melodix/music/LockableHScrollView;->setScrollingEnabled(Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 78
    .line 79
    .line 80
    :cond_5
    sput v5, Lcom/melodix/music/MainActivity;->h0:I

    .line 81
    .line 82
    :goto_1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 83
    .line 84
    if-eqz v0, :cond_a

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-static {v1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_8

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 103
    .line 104
    if-eqz v2, :cond_6

    .line 105
    .line 106
    check-cast v1, Landroid/view/ViewGroup;

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    const/4 v1, 0x0

    .line 110
    :goto_2
    if-eqz v1, :cond_7

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    :cond_7
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 116
    .line 117
    sget v2, Lcom/melodix/music/MainActivity;->h0:I

    .line 118
    .line 119
    invoke-direct {v1, v2, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_8
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 138
    .line 139
    sget v3, Lcom/melodix/music/MainActivity;->h0:I

    .line 140
    .line 141
    if-eq v2, v3, :cond_9

    .line 142
    .line 143
    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    :cond_9
    :goto_3
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 149
    .line 150
    .line 151
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->O:Landroid/widget/TextView;

    .line 152
    .line 153
    if-eqz v0, :cond_b

    .line 154
    .line 155
    const-string v1, ""

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    :cond_b
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->G()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final D(Z)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    sget v0, Lcom/melodix/music/AppSingleton;->n:I

    .line 7
    .line 8
    if-ne v0, p1, :cond_a

    .line 9
    .line 10
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    const/4 v2, 0x4

    .line 42
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 54
    .line 55
    if-eqz p1, :cond_5

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    :cond_5
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 61
    .line 62
    if-eqz p1, :cond_6

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    :cond_6
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 76
    .line 77
    int-to-float p1, p1

    .line 78
    const/high16 v2, 0x43200000    # 160.0f

    .line 79
    .line 80
    div-float/2addr p1, v2

    .line 81
    const/high16 v2, -0x3db80000    # -50.0f

    .line 82
    .line 83
    mul-float/2addr p1, v2

    .line 84
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 85
    .line 86
    if-eqz v2, :cond_7

    .line 87
    .line 88
    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 89
    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 92
    .line 93
    if-eqz p1, :cond_8

    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    :cond_8
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 99
    .line 100
    if-eqz p0, :cond_9

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 103
    .line 104
    .line 105
    :cond_9
    :goto_0
    return-void

    .line 106
    :cond_a
    const/4 v0, 0x1

    .line 107
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 108
    .line 109
    sput p1, Lcom/melodix/music/AppSingleton;->n:I

    .line 110
    .line 111
    new-instance v0, Lzk0;

    .line 112
    .line 113
    invoke-direct {v0, p0, p1, v1}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final E(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean v0, Lju1;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->Q:Landroid/widget/TextView;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->g0:Ls4;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v0, 0x9c4

    .line 34
    .line 35
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final F()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const v0, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Le6;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    new-instance v1, Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->T:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    const/high16 v3, -0x1000000

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 41
    .line 42
    .line 43
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 44
    .line 45
    const/4 v4, -0x1

    .line 46
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->X:Landroid/widget/ImageView;

    .line 53
    .line 54
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    invoke-direct {p0, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final G()V
    .locals 8

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v0, -0x1000000

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "#121212"

    .line 9
    .line 10
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 26
    .line 27
    .line 28
    :cond_2
    const v1, 0x7f090116

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->L:Landroid/widget/ImageButton;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    if-eqz v0, :cond_7

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    instance-of v3, v2, Lfp;

    .line 50
    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    check-cast v2, Lfp;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_4
    const/4 v2, 0x0

    .line 57
    :goto_1
    if-nez v2, :cond_5

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_5
    sget-object v3, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 61
    .line 62
    const-string v4, "bigwindow"

    .line 63
    .line 64
    invoke-static {v3, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_6

    .line 69
    .line 70
    const/4 v3, -0x1

    .line 71
    iput v3, v2, Lfp;->q:I

    .line 72
    .line 73
    iput v1, v2, Lfp;->s:I

    .line 74
    .line 75
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 84
    .line 85
    const/high16 v4, 0x41400000    # 12.0f

    .line 86
    .line 87
    mul-float/2addr v4, v3

    .line 88
    float-to-int v3, v4

    .line 89
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    iput v1, v2, Lfp;->q:I

    .line 94
    .line 95
    iput v1, v2, Lfp;->s:I

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 98
    .line 99
    .line 100
    :goto_2
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 104
    .line 105
    if-eqz v0, :cond_8

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-nez v0, :cond_9

    .line 112
    .line 113
    :cond_8
    const-string v0, ""

    .line 114
    .line 115
    :cond_9
    sget-boolean v2, Lcom/melodix/music/AppSingleton;->B:Z

    .line 116
    .line 117
    const/4 v3, 0x1

    .line 118
    const-string v4, "accounts.spotify.com"

    .line 119
    .line 120
    if-nez v2, :cond_b

    .line 121
    .line 122
    const-string v2, "/login"

    .line 123
    .line 124
    invoke-static {v0, v2, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_a

    .line 129
    .line 130
    const-string v2, "/auth"

    .line 131
    .line 132
    invoke-static {v0, v2, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-nez v2, :cond_a

    .line 137
    .line 138
    invoke-static {v0, v4, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_b

    .line 143
    .line 144
    :cond_a
    move v2, v3

    .line 145
    goto :goto_4

    .line 146
    :cond_b
    move v2, v1

    .line 147
    :goto_4
    sget-object v5, Lml;->g:Landroid/widget/LinearLayout;

    .line 148
    .line 149
    const/16 v6, 0x8

    .line 150
    .line 151
    if-eqz v5, :cond_d

    .line 152
    .line 153
    if-eqz v2, :cond_c

    .line 154
    .line 155
    move v7, v1

    .line 156
    goto :goto_5

    .line 157
    :cond_c
    move v7, v6

    .line 158
    :goto_5
    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    :cond_d
    sget-object v5, Lml;->g:Landroid/widget/LinearLayout;

    .line 162
    .line 163
    if-eqz v5, :cond_e

    .line 164
    .line 165
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    if-eqz v5, :cond_e

    .line 170
    .line 171
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    if-eqz v5, :cond_e

    .line 176
    .line 177
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    if-eqz v5, :cond_e

    .line 182
    .line 183
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    .line 184
    .line 185
    goto :goto_6

    .line 186
    :cond_e
    const/high16 v5, 0x3f800000    # 1.0f

    .line 187
    .line 188
    :goto_6
    const/high16 v7, 0x42600000    # 56.0f

    .line 189
    .line 190
    mul-float/2addr v5, v7

    .line 191
    float-to-int v5, v5

    .line 192
    if-eqz v2, :cond_f

    .line 193
    .line 194
    sget v7, Lml;->n:I

    .line 195
    .line 196
    add-int/2addr v7, v5

    .line 197
    goto :goto_7

    .line 198
    :cond_f
    move v7, v1

    .line 199
    :goto_7
    sget-object v5, Lml;->l:Ljava/lang/ref/WeakReference;

    .line 200
    .line 201
    if-eqz v5, :cond_10

    .line 202
    .line 203
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    check-cast v5, Landroid/view/View;

    .line 208
    .line 209
    if-eqz v5, :cond_10

    .line 210
    .line 211
    invoke-virtual {v5, v1, v7, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 212
    .line 213
    .line 214
    :cond_10
    if-eqz v2, :cond_13

    .line 215
    .line 216
    const-string v5, "method=password"

    .line 217
    .line 218
    invoke-static {v0, v5, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    if-eqz v7, :cond_11

    .line 223
    .line 224
    const-string v0, "password"

    .line 225
    .line 226
    sput-object v0, Lml;->m:Ljava/lang/String;

    .line 227
    .line 228
    goto :goto_8

    .line 229
    :cond_11
    invoke-static {v0, v4, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_12

    .line 234
    .line 235
    invoke-static {v0, v5, v1}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_12

    .line 240
    .line 241
    const-string v0, "social"

    .line 242
    .line 243
    sput-object v0, Lml;->m:Ljava/lang/String;

    .line 244
    .line 245
    :cond_12
    :goto_8
    invoke-static {}, Lml;->F()V

    .line 246
    .line 247
    .line 248
    :cond_13
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->L:Landroid/widget/ImageButton;

    .line 253
    .line 254
    if-eqz v4, :cond_16

    .line 255
    .line 256
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->V:Z

    .line 257
    .line 258
    if-nez v5, :cond_15

    .line 259
    .line 260
    if-nez v2, :cond_15

    .line 261
    .line 262
    if-eqz v0, :cond_14

    .line 263
    .line 264
    goto :goto_9

    .line 265
    :cond_14
    move v6, v1

    .line 266
    :cond_15
    :goto_9
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 267
    .line 268
    .line 269
    :cond_16
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->A:Z

    .line 270
    .line 271
    const/4 v4, 0x4

    .line 272
    if-nez v0, :cond_18

    .line 273
    .line 274
    sget-boolean v0, Lju1;->w:Z

    .line 275
    .line 276
    if-nez v0, :cond_17

    .line 277
    .line 278
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 279
    .line 280
    if-eqz v0, :cond_17

    .line 281
    .line 282
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 283
    .line 284
    .line 285
    :cond_17
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->D(Z)V

    .line 286
    .line 287
    .line 288
    return-void

    .line 289
    :cond_18
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 290
    .line 291
    if-eqz v0, :cond_1a

    .line 292
    .line 293
    sget v0, Lcom/melodix/music/AppSingleton;->n:I

    .line 294
    .line 295
    if-ne v0, v3, :cond_19

    .line 296
    .line 297
    move v1, v3

    .line 298
    :cond_19
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->D(Z)V

    .line 299
    .line 300
    .line 301
    return-void

    .line 302
    :cond_1a
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 303
    .line 304
    if-nez v0, :cond_1d

    .line 305
    .line 306
    if-nez v2, :cond_1d

    .line 307
    .line 308
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 309
    .line 310
    if-eqz v0, :cond_1d

    .line 311
    .line 312
    sget-boolean v0, Lju1;->w:Z

    .line 313
    .line 314
    if-nez v0, :cond_1b

    .line 315
    .line 316
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 317
    .line 318
    if-eqz v0, :cond_1b

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 321
    .line 322
    .line 323
    :cond_1b
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 324
    .line 325
    if-eqz v0, :cond_1c

    .line 326
    .line 327
    new-instance v0, Lwk0;

    .line 328
    .line 329
    invoke-direct {v0, p0, v1}, Lwk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->w(Lp80;)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_1c
    new-instance v0, Ls4;

    .line 337
    .line 338
    const/4 v1, 0x5

    .line 339
    invoke-direct {v0, p0, v1}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :cond_1d
    sget-boolean v0, Lju1;->w:Z

    .line 347
    .line 348
    if-nez v0, :cond_1e

    .line 349
    .line 350
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 351
    .line 352
    if-eqz v0, :cond_1e

    .line 353
    .line 354
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 355
    .line 356
    .line 357
    :cond_1e
    if-nez v2, :cond_1f

    .line 358
    .line 359
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->B:Z

    .line 360
    .line 361
    if-nez v0, :cond_20

    .line 362
    .line 363
    :cond_1f
    move v1, v3

    .line 364
    :cond_20
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 365
    .line 366
    if-eqz v0, :cond_21

    .line 367
    .line 368
    goto :goto_a

    .line 369
    :cond_21
    new-instance v0, Lzk0;

    .line 370
    .line 371
    invoke-direct {v0, p0, v1, v3}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 375
    .line 376
    .line 377
    :goto_a
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->z()V

    .line 378
    .line 379
    .line 380
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->t()Landroid/app/PictureInPictureParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, v0}, Li1;->s(Lcom/melodix/music/MainActivity;Landroid/app/PictureInPictureParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    :cond_0
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Le6;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 5
    .line 6
    .line 7
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v0, 0x1a

    .line 10
    .line 11
    if-lt p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Lcom/melodix/music/MainActivity;->B(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->H()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->requestApplyInsets()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->C()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/16 v4, 0x1e

    .line 11
    .line 12
    if-lt v2, v4, :cond_0

    .line 13
    .line 14
    invoke-static {v1, v3}, Lsj1;->a(Landroid/view/Window;Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    or-int/lit16 v5, v5, 0x700

    .line 27
    .line 28
    invoke-virtual {v1, v5}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 29
    .line 30
    .line 31
    :goto_0
    const/16 v1, 0x1c

    .line 32
    .line 33
    if-lt v2, v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Ld1;->t(Landroid/view/WindowManager$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    new-instance v6, Lpa0;

    .line 59
    .line 60
    invoke-direct {v6, v5}, Lpa0;-><init>(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 64
    .line 65
    const/4 v7, 0x1

    .line 66
    if-lt v5, v4, :cond_2

    .line 67
    .line 68
    new-instance v4, Llk1;

    .line 69
    .line 70
    invoke-direct {v4, v1, v6, v7}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    const/16 v4, 0x1a

    .line 75
    .line 76
    if-lt v5, v4, :cond_3

    .line 77
    .line 78
    new-instance v4, Lmk1;

    .line 79
    .line 80
    invoke-direct {v4, v1, v6, v3}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    new-instance v4, Llk1;

    .line 85
    .line 86
    invoke-direct {v4, v1, v6, v3}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 87
    .line 88
    .line 89
    :goto_1
    invoke-virtual {v4}, Lst;->p()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Lst;->o()V

    .line 93
    .line 94
    .line 95
    invoke-super/range {p0 .. p1}, Landroidx/activity/a;->onCreate(Landroid/os/Bundle;)V

    # Preview builds are debugged without logcat: keep the last crash so the
    # next launch can show it instead of dying silently.
    :native_guard_try_start
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/NativeCrashGuard;->install(Landroid/content/Context;)V

    # Show the previous crash before anything else can fail: the signature gate
    # and the layout inflation both run after this point.
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/NativeCrashGuard;->showLastReport(Landroid/app/Activity;)Z

    move-result v1
    :native_guard_try_end
    .catch Ljava/lang/Throwable; {:native_guard_try_start .. :native_guard_try_end} :native_guard_failed

    goto :native_guard_done

    :native_guard_failed
    move-exception v1

    const/4 v1, 0x0

    :native_guard_done
    if-eqz v1, :native_no_crash_report

    return-void

    :native_no_crash_report
    # Paint a small marker before anything else can fail. If this text is never
    # seen, the process dies before the activity exists; if it flashes, the
    # failure is later and the stage trail says where. This cannot be muted by
    # the system the way a toast posted before the first window can.
    # The marker is drawn by a helper: inlining it here meant reusing registers
    # that carry SDK_INT for the rest of onCreate, which the verifier rejects.
    :try_start_marker
    invoke-static/range {p0 .. p0}, Lcom/melodix/music/NativeCrashGuard;->showLaunchMarker(Landroid/app/Activity;)V
    :try_end_marker
    .catch Ljava/lang/Throwable; {:try_start_marker .. :try_end_marker} :catch_marker

    goto :marker_done

    :catch_marker
    move-exception v1

    :marker_done
    :try_start_stage
    const-string v1, "activity-create"

    invoke-static/range {v1 .. v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
    :try_end_stage
    .catch Ljava/lang/Throwable; {:try_start_stage .. :try_end_stage} :catch_stage

    goto :stage_done

    :catch_stage
    move-exception v1

    :stage_done

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->u()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_4

    .line 103
    .line 104
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Signature preview refusee : l application se ferme sans message (u() == false). Le certificat de signature ne correspond pas a expected_signature_sha256."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v2 .. v2}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V

    # Only a preview shows the expected fingerprint. Production keeps its
    # original silent stop, so the value is never exposed there.
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".preview"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :gate_refusal_return

    # Keep the reason on screen: this is the only trace a silent self-close can
    # leave, and it names the fingerprint the APK was expected to carry.
    const v2, 0x7f110052

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Controle de signature refuse.\n\nCette build de test reste ouverte pour montrer le probleme ; l application normale se ferme ici.\n\nEmpreinte attendue :\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n\nLe certificat de signature de l APK ne correspond pas a cette empreinte."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, -0x1

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v4, 0x41400000

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x1000000

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    const/16 v4, 0x18

    invoke-virtual {v2, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    :gate_refusal_return
    return-void

    .line 105
    :cond_4
    const-string v1, "signature-ok"

    invoke-static/range {v1 .. v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 117
    .line 118
    .line 119
    const/16 v1, 0x1d

    .line 120
    .line 121
    if-lt v2, v1, :cond_5

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v1}, Le1;->k(Landroid/view/Window;)V

    .line 128
    .line 129
    .line 130
    :cond_5
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->K:Z

    .line 131
    .line 132
    if-eqz v1, :cond_6

    .line 133
    .line 134
    const-string v1, "en"

    .line 135
    .line 136
    invoke-static {v1}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {v1}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 141
    .line 142
    .line 143
    :cond_6
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 144
    .line 145
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    sput-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 149
    .line 150
    const v1, 0x7f0c001c

    .line 151
    .line 152
    .line 153
    :native_content_try_start
    invoke-virtual {v0, v1}, Le6;->setContentView(I)V
    :native_content_try_end
    .catch Ljava/lang/Throwable; {:native_content_try_start .. :native_content_try_end} :native_content_failed

    goto :native_content_ok

    :native_content_failed
    move-exception v2

    # A broken layout must not kill the launch: show the trace on the screen the
    # user is already looking at instead of a blank crash.
    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->excerpt(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v4

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v4, 0x41400000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x41c00000

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v0, v3}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void

    :native_content_ok
    const-string v1, "content-view"

    invoke-static/range {v1 .. v1}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    const v1, 0x7f090116

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    const/4 v5, 0x7

    .line 164
    if-eqz v4, :cond_7

    .line 165
    .line 166
    new-instance v6, Lfj;

    .line 167
    .line 168
    invoke-direct {v6, v5, v0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    sget-object v8, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 172
    .line 173
    invoke-static {v4, v6}, Loh1;->u(Landroid/view/View;Lor0;)V

    .line 174
    .line 175
    .line 176
    :cond_7
    const/16 v4, 0x1f

    .line 177
    .line 178
    if-lt v2, v4, :cond_8

    .line 179
    .line 180
    const-string v4, "android.permission.BLUETOOTH_CONNECT"

    .line 181
    .line 182
    invoke-virtual {v0, v4}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v6

    .line 186
    if-eqz v6, :cond_8

    .line 187
    .line 188
    filled-new-array {v4}, [Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    const/16 v6, 0x65

    .line 193
    .line 194
    invoke-virtual {v0, v4, v6}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    :cond_8
    new-instance v4, Landroid/content/Intent;

    .line 198
    .line 199
    sget v6, Lcom/melodix/music/AppSingleton;->j:I

    .line 200
    .line 201
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    const-class v8, Lcom/melodix/music/WebService;

    .line 206
    .line 207
    invoke-direct {v4, v6, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 208
    .line 209
    .line 210
    new-instance v4, Landroid/content/IntentFilter;

    .line 211
    .line 212
    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    .line 213
    .line 214
    .line 215
    const-string v6, "com.melodix.music.PIP_PREV"

    .line 216
    .line 217
    invoke-virtual {v4, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    const-string v6, "com.melodix.music.PIP_PLAY_PAUSE"

    .line 221
    .line 222
    invoke-virtual {v4, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    const-string v6, "com.melodix.music.PIP_NEXT"

    .line 226
    .line 227
    invoke-virtual {v4, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    const/16 v6, 0x21

    .line 231
    .line 232
    iget-object v8, v0, Lcom/melodix/music/MainActivity;->e0:Lub2;

    .line 233
    .line 234
    if-lt v2, v6, :cond_9

    .line 235
    .line 236
    invoke-static {v0, v8, v4}, Li1;->t(Lcom/melodix/music/MainActivity;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 237
    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_9
    invoke-virtual {v0, v8, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 241
    .line 242
    .line 243
    :goto_2
    const v2, 0x7f0900ea

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    check-cast v2, Lcom/melodix/music/LockableHScrollView;

    .line 251
    .line 252
    iput-object v2, v0, Lcom/melodix/music/MainActivity;->M:Lcom/melodix/music/LockableHScrollView;

    .line 253
    .line 254
    const v2, 0x7f090227

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    check-cast v2, Landroid/widget/FrameLayout;

    .line 262
    .line 263
    iput-object v2, v0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 264
    .line 265
    const v2, 0x7f0900e0

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    check-cast v2, Landroid/widget/TextView;

    .line 273
    .line 274
    iput-object v2, v0, Lcom/melodix/music/MainActivity;->O:Landroid/widget/TextView;

    .line 275
    .line 276
    const v2, 0x7f0900e1

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Landroid/widget/TextView;

    .line 284
    .line 285
    iput-object v2, v0, Lcom/melodix/music/MainActivity;->P:Landroid/widget/TextView;

    .line 286
    .line 287
    const v2, 0x7f090212

    .line 288
    .line 289
    .line 290
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    check-cast v2, Landroid/widget/TextView;

    .line 295
    .line 296
    iput-object v2, v0, Lcom/melodix/music/MainActivity;->Q:Landroid/widget/TextView;

    .line 297
    .line 298
    const v2, 0x7f090060

    .line 299
    .line 300
    .line 301
    invoke-virtual {v0, v2}, Le6;->findViewById(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    check-cast v4, Landroid/widget/ImageButton;

    .line 306
    .line 307
    iput-object v4, v0, Lcom/melodix/music/MainActivity;->L:Landroid/widget/ImageButton;

    .line 308
    .line 309
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    check-cast v1, Landroid/view/ViewGroup;

    .line 314
    .line 315
    const/4 v4, 0x2

    .line 316
    const/4 v6, -0x1

    .line 317
    if-eqz v1, :cond_11

    .line 318
    .line 319
    invoke-static {v0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 320
    .line 321
    .line 322
    move-result-object v8

    .line 323
    if-eqz v8, :cond_11

    .line 324
    .line 325
    iget-object v9, v0, Lcom/melodix/music/MainActivity;->M:Lcom/melodix/music/LockableHScrollView;

    .line 326
    .line 327
    const/high16 v10, 0x41000000    # 8.0f

    .line 328
    .line 329
    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 330
    .line 331
    .line 332
    move-result-object v10

    .line 333
    const/high16 v11, 0x41800000    # 16.0f

    .line 334
    .line 335
    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 336
    .line 337
    .line 338
    move-result-object v11

    .line 339
    const/high16 v12, 0x40800000    # 4.0f

    .line 340
    .line 341
    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 342
    .line 343
    .line 344
    move-result-object v12

    .line 345
    const/high16 v13, 0x42200000    # 40.0f

    .line 346
    .line 347
    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 348
    .line 349
    .line 350
    move-result-object v13

    .line 351
    new-instance v14, Ljava/lang/ref/WeakReference;

    .line 352
    .line 353
    invoke-direct {v14, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 354
    .line 355
    .line 356
    new-instance v14, Ljava/lang/ref/WeakReference;

    .line 357
    .line 358
    invoke-direct {v14, v8}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    sput-object v14, Lml;->k:Ljava/lang/ref/WeakReference;

    .line 362
    .line 363
    if-eqz v9, :cond_a

    .line 364
    .line 365
    new-instance v8, Ljava/lang/ref/WeakReference;

    .line 366
    .line 367
    invoke-direct {v8, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 368
    .line 369
    .line 370
    sput-object v8, Lml;->l:Ljava/lang/ref/WeakReference;

    .line 371
    .line 372
    :cond_a
    sget-object v8, Lml;->g:Landroid/widget/LinearLayout;

    .line 373
    .line 374
    const/4 v9, 0x0

    .line 375
    if-eqz v8, :cond_c

    .line 376
    .line 377
    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 378
    .line 379
    .line 380
    move-result-object v8

    .line 381
    instance-of v14, v8, Landroid/view/ViewGroup;

    .line 382
    .line 383
    if-eqz v14, :cond_b

    .line 384
    .line 385
    check-cast v8, Landroid/view/ViewGroup;

    .line 386
    .line 387
    goto :goto_3

    .line 388
    :cond_b
    move-object v8, v9

    .line 389
    :goto_3
    if-eqz v8, :cond_c

    .line 390
    .line 391
    sget-object v14, Lml;->g:Landroid/widget/LinearLayout;

    .line 392
    .line 393
    invoke-virtual {v8, v14}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 394
    .line 395
    .line 396
    :cond_c
    invoke-virtual {v0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 397
    .line 398
    .line 399
    move-result-object v8

    .line 400
    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 401
    .line 402
    .line 403
    move-result-object v8

    .line 404
    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    .line 405
    .line 406
    new-instance v14, Lqk0;

    .line 407
    .line 408
    invoke-direct {v14, v8}, Lqk0;-><init>(F)V

    .line 409
    .line 410
    .line 411
    new-instance v8, Landroid/widget/LinearLayout;

    .line 412
    .line 413
    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 414
    .line 415
    .line 416
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 417
    .line 418
    .line 419
    move-result v15

    .line 420
    invoke-virtual {v8, v15}, Landroid/view/View;->setId(I)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v14, v11}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v15

    .line 430
    check-cast v15, Ljava/lang/Number;

    .line 431
    .line 432
    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    .line 433
    .line 434
    .line 435
    move-result v15

    .line 436
    invoke-virtual {v14, v10}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v16

    .line 440
    check-cast v16, Ljava/lang/Number;

    .line 441
    .line 442
    move/from16 p1, v5

    .line 443
    .line 444
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->intValue()I

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    invoke-virtual {v14, v11}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v11

    .line 452
    check-cast v11, Ljava/lang/Number;

    .line 453
    .line 454
    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    .line 455
    .line 456
    .line 457
    move-result v11

    .line 458
    invoke-virtual {v14, v10}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v10

    .line 462
    check-cast v10, Ljava/lang/Number;

    .line 463
    .line 464
    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    .line 465
    .line 466
    .line 467
    move-result v10

    .line 468
    invoke-virtual {v8, v15, v5, v11, v10}, Landroid/view/View;->setPadding(IIII)V

    .line 469
    .line 470
    .line 471
    sget-boolean v5, Lcom/melodix/music/AppSingleton;->E:Z

    .line 472
    .line 473
    if-eqz v5, :cond_d

    .line 474
    .line 475
    const/high16 v5, -0x1000000

    .line 476
    .line 477
    goto :goto_4

    .line 478
    :cond_d
    const-string v5, "#121212"

    .line 479
    .line 480
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 481
    .line 482
    .line 483
    move-result v5

    .line 484
    :goto_4
    invoke-virtual {v8, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 485
    .line 486
    .line 487
    const/high16 v5, 0x41700000    # 15.0f

    .line 488
    .line 489
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 490
    .line 491
    .line 492
    move-result-object v5

    .line 493
    invoke-virtual {v14, v5}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object v5

    .line 497
    check-cast v5, Ljava/lang/Number;

    .line 498
    .line 499
    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    .line 500
    .line 501
    .line 502
    move-result v5

    .line 503
    int-to-float v5, v5

    .line 504
    invoke-virtual {v8, v5}, Landroid/view/View;->setElevation(F)V

    .line 505
    .line 506
    .line 507
    const/16 v5, 0x8

    .line 508
    .line 509
    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    .line 510
    .line 511
    .line 512
    new-instance v5, Lfp;

    .line 513
    .line 514
    invoke-direct {v5, v6}, Lfp;-><init>(I)V

    .line 515
    .line 516
    .line 517
    iput v3, v5, Lfp;->h:I

    .line 518
    .line 519
    iput v3, v5, Lfp;->q:I

    .line 520
    .line 521
    iput v3, v5, Lfp;->s:I

    .line 522
    .line 523
    invoke-virtual {v8, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 524
    .line 525
    .line 526
    sput-object v8, Lml;->g:Landroid/widget/LinearLayout;

    .line 527
    .line 528
    new-instance v5, Lg6;

    .line 529
    .line 530
    invoke-direct {v5, v0}, Lg6;-><init>(Lcom/melodix/music/MainActivity;)V

    .line 531
    .line 532
    .line 533
    const-string v8, "Spotify Password"

    .line 534
    .line 535
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 536
    .line 537
    .line 538
    invoke-virtual {v5, v3}, Lg6;->setAllCaps(Z)V

    .line 539
    .line 540
    .line 541
    const/high16 v8, 0x41500000    # 13.0f

    .line 542
    .line 543
    invoke-virtual {v5, v4, v8}, Lg6;->setTextSize(IF)V

    .line 544
    .line 545
    .line 546
    sget-object v10, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 547
    .line 548
    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 549
    .line 550
    .line 551
    const/16 v11, 0x11

    .line 552
    .line 553
    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 554
    .line 555
    .line 556
    new-instance v15, Lrk0;

    .line 557
    .line 558
    invoke-direct {v15, v3}, Lrk0;-><init>(I)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v5, v15}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 562
    .line 563
    .line 564
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    .line 565
    .line 566
    invoke-virtual {v14, v13}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    .line 568
    .line 569
    move-result-object v16

    .line 570
    check-cast v16, Ljava/lang/Number;

    .line 571
    .line 572
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->intValue()I

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    const/high16 v6, 0x3f800000    # 1.0f

    .line 577
    .line 578
    invoke-direct {v15, v3, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 579
    .line 580
    .line 581
    invoke-virtual {v14, v12}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    check-cast v2, Ljava/lang/Number;

    .line 586
    .line 587
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 588
    .line 589
    .line 590
    move-result v2

    .line 591
    invoke-virtual {v15, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 592
    .line 593
    .line 594
    invoke-virtual {v5, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 595
    .line 596
    .line 597
    sput-object v5, Lml;->h:Lg6;

    .line 598
    const/16 v15, 0x8

    .line 599
    invoke-virtual {v5, v15}, Landroid/view/View;->setVisibility(I)V

    .line 600
    new-instance v2, Ln7;

    .line 600
    .line 601
    const v5, 0x7f040232

    .line 602
    .line 603
    .line 604
    invoke-direct {v2, v0, v9, v5}, Ln7;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 605
    .line 606
    .line 607
    const-string v5, "Settings"

    .line 608
    .line 609
    invoke-virtual {v2, v5}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 610
    .line 611
    .line 612
    const v5, 0x7f080134

    .line 613
    .line 614
    .line 615
    invoke-virtual {v2, v5}, Ln7;->setImageResource(I)V

    .line 616
    .line 617
    .line 618
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 619
    .line 620
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 621
    .line 622
    .line 623
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 627
    .line 628
    .line 629
    new-instance v5, Lsk0;

    .line 630
    .line 631
    invoke-direct {v5, v0, v3}, Lsk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 635
    .line 636
    .line 637
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 638
    .line 639
    invoke-virtual {v14, v13}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    move-result-object v9

    .line 643
    check-cast v9, Ljava/lang/Number;

    .line 644
    .line 645
    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    .line 646
    .line 647
    .line 648
    move-result v9

    .line 649
    invoke-virtual {v14, v13}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v15

    .line 653
    check-cast v15, Ljava/lang/Number;

    .line 654
    .line 655
    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    .line 656
    .line 657
    .line 658
    move-result v15

    .line 659
    invoke-direct {v5, v9, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 660
    .line 661
    .line 662
    invoke-virtual {v14, v12}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    .line 664
    .line 665
    move-result-object v9

    .line 666
    check-cast v9, Ljava/lang/Number;

    .line 667
    .line 668
    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    .line 669
    .line 670
    .line 671
    move-result v9

    .line 672
    invoke-virtual {v5, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 673
    .line 674
    .line 675
    invoke-virtual {v14, v12}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    .line 677
    .line 678
    move-result-object v9

    .line 679
    check-cast v9, Ljava/lang/Number;

    .line 680
    .line 681
    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    .line 682
    .line 683
    .line 684
    move-result v9

    .line 685
    invoke-virtual {v5, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 686
    .line 687
    .line 688
    invoke-virtual {v2, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 689
    .line 690
    .line 691
    sput-object v2, Lml;->j:Ln7;

    .line 692
    .line 693
    new-instance v2, Lg6;

    .line 694
    .line 695
    invoke-direct {v2, v0}, Lg6;-><init>(Lcom/melodix/music/MainActivity;)V

    .line 696
    .line 697
    .line 698
    const-string v5, "Google / Apple / OTP"

    .line 699
    .line 700
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 701
    .line 702
    .line 703
    invoke-virtual {v2, v3}, Lg6;->setAllCaps(Z)V

    .line 704
    .line 705
    .line 706
    invoke-virtual {v2, v4, v8}, Lg6;->setTextSize(IF)V

    const/high16 v5, 0x43340000    # 180.0f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v14, v5}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMaxWidth(I)V

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 707
    .line 708
    .line 709
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 710
    .line 711
    .line 712
    invoke-virtual {v2, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 713
    .line 714
    .line 715
    new-instance v5, Lrk0;

    .line 716
    .line 717
    invoke-direct {v5, v7}, Lrk0;-><init>(I)V

    .line 718
    .line 719
    .line 720
    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 721
    .line 722
    .line 723
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 724
    .line 725
    invoke-virtual {v14, v13}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    .line 727
    .line 728
    move-result-object v8

    .line 729
    check-cast v8, Ljava/lang/Number;

    .line 730
    .line 731
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 732
    .line 733
    .line 734
    move-result v8

    .line 735
    const/4 v9, -0x2

    const/4 v6, 0x0

    invoke-direct {v5, v9, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 736
    .line 737
    .line 738
    invoke-virtual {v14, v12}, Lqk0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 739
    .line 740
    .line 741
    move-result-object v6

    .line 742
    check-cast v6, Ljava/lang/Number;

    .line 743
    .line 744
    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    .line 745
    .line 746
    .line 747
    move-result v6

    .line 748
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 749
    .line 750
    .line 751
    invoke-virtual {v2, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 752
    .line 753
    .line 754
    sput-object v2, Lml;->i:Lg6;

    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 755
    sget-object v2, Lml;->g:Landroid/widget/LinearLayout;

    .line 758
    if-eqz v2, :cond_e

    .line 759
    .line 760
    sget-object v5, Lml;->h:Lg6;

    .line 761
    .line 762
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 763
    .line 764
    .line 765
    :cond_e
    sget-object v2, Lml;->g:Landroid/widget/LinearLayout;

    .line 766
    .line 767
    if-eqz v2, :cond_f

    .line 768
    .line 769
    sget-object v5, Lml;->j:Ln7;

    .line 770
    .line 771
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 772
    .line 773
    .line 774
    :cond_f
    sget-object v2, Lml;->g:Landroid/widget/LinearLayout;

    .line 775
    .line 776
    if-eqz v2, :cond_10

    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v6, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 777
    .line 778
    sget-object v5, Lml;->i:Lg6;

    .line 779
    .line 780
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 781
    .line 782
    .line 783
    :cond_10
    invoke-static {}, Lml;->F()V

    .line 784
    .line 785
    .line 786
    sget-object v2, Lml;->g:Landroid/widget/LinearLayout;

    .line 787
    .line 788
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 789
    .line 790
    .line 791
    goto :goto_5

    .line 792
    :cond_11
    move/from16 p1, v5

    .line 793
    .line 794
    :goto_5
    const v1, 0x7f0901c6

    .line 795
    .line 796
    .line 797
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 798
    .line 799
    .line 800
    move-result-object v1

    .line 801
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 802
    .line 803
    iput-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 804
    .line 805
    const v1, 0x7f0900fd

    .line 806
    .line 807
    .line 808
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 809
    .line 810
    .line 811
    move-result-object v1

    .line 812
    check-cast v1, Landroid/widget/ImageView;

    .line 813
    .line 814
    iput-object v1, v0, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 815
    .line 816
    const v1, 0x7f0900fc

    .line 817
    .line 818
    .line 819
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 820
    .line 821
    .line 822
    move-result-object v1

    .line 823
    check-cast v1, Landroid/widget/ImageView;

    .line 824
    .line 825
    iput-object v1, v0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 826
    .line 827
    const v1, 0x7f090213

    .line 828
    .line 829
    .line 830
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 831
    .line 832
    .line 833
    move-result-object v1

    .line 834
    check-cast v1, Landroid/widget/TextView;

    .line 835
    .line 836
    iput-object v1, v0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 837
    .line 838
    iget-object v1, v0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 839
    .line 840
    if-eqz v1, :cond_12

    .line 841
    .line 842
    new-instance v2, Lsk0;

    .line 843
    .line 844
    invoke-direct {v2, v0, v7}, Lsk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 845
    .line 846
    .line 847
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 848
    .line 849
    .line 850
    :cond_12
    new-instance v1, Landroid/os/Handler;

    .line 851
    .line 852
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 853
    .line 854
    .line 855
    move-result-object v2

    .line 856
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 857
    .line 858
    .line 859
    new-instance v2, Lhz0;

    .line 860
    .line 861
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 862
    .line 863
    .line 864
    iget-object v5, v0, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 865
    .line 866
    if-eqz v5, :cond_13

    .line 867
    .line 868
    new-instance v6, Lxk0;

    .line 869
    .line 870
    invoke-direct {v6, v2, v1, v0}, Lxk0;-><init>(Lhz0;Landroid/os/Handler;Lcom/melodix/music/MainActivity;)V

    .line 871
    .line 872
    .line 873
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 874
    .line 875
    .line 876
    :cond_13
    invoke-static {v0}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 877
    .line 878
    .line 879
    move-result-object v1

    .line 880
    if-eqz v1, :cond_14

    .line 881
    .line 882
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 883
    .line 884
    .line 885
    move-result-object v1

    .line 886
    if-eqz v1, :cond_14

    .line 887
    .line 888
    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 889
    .line 890
    .line 891
    move-result-object v1

    .line 892
    if-nez v1, :cond_15

    .line 893
    .line 894
    :cond_14
    const-string v1, ""

    .line 895
    .line 896
    :cond_15
    const-string v2, "Chrome/"

    .line 897
    .line 898
    const/4 v5, 0x6

    .line 899
    invoke-static {v1, v2, v3, v3, v5}, Lda1;->D(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    .line 900
    .line 901
    .line 902
    move-result v2

    .line 903
    const/4 v5, -0x1

    .line 904
    if-eq v2, v5, :cond_17

    .line 905
    .line 906
    const-string v6, " "

    .line 907
    .line 908
    const/4 v7, 0x4

    .line 909
    invoke-static {v1, v6, v2, v3, v7}, Lda1;->D(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    .line 910
    .line 911
    .line 912
    move-result v3

    .line 913
    if-ne v3, v5, :cond_16

    .line 914
    .line 915
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 916
    .line 917
    .line 918
    move-result v3

    .line 919
    :cond_16
    iget-object v5, v0, Lcom/melodix/music/MainActivity;->P:Landroid/widget/TextView;

    .line 920
    .line 921
    if-eqz v5, :cond_17

    .line 922
    .line 923
    add-int/lit8 v2, v2, 0x7

    .line 924
    .line 925
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 926
    .line 927
    .line 928
    move-result-object v1

    .line 929
    const-string v2, "WebView v."

    .line 930
    .line 931
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 932
    .line 933
    .line 934
    move-result-object v1

    .line 935
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 936
    .line 937
    .line 938
    :cond_17
    const v1, 0x7f090187

    .line 939
    .line 940
    .line 941
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 942
    .line 943
    .line 944
    move-result-object v1

    .line 945
    check-cast v1, Landroid/widget/ProgressBar;

    .line 946
    .line 947
    iput-object v1, v0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;

    .line 948
    .line 949
    const v1, 0x7f090060

    .line 950
    .line 951
    .line 952
    invoke-virtual {v0, v1}, Le6;->findViewById(I)Landroid/view/View;

    .line 953
    .line 954
    .line 955
    move-result-object v1

    .line 956
    if-eqz v1, :cond_18

    .line 957
    .line 958
    new-instance v2, Lsk0;

    .line 959
    .line 960
    invoke-direct {v2, v0, v4}, Lsk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 961
    .line 962
    .line 963
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 964
    .line 965
    .line 966
    :cond_18
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->G()V

    .line 967
    .line 968
    .line 969
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 970
    .line 971
    .line 972
    move-result-object v1

    .line 973
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 974
    .line 975
    and-int/2addr v1, v4

    .line 976
    if-eqz v1, :cond_19

    .line 977
    .line 978
    goto :goto_6

    .line 979
    :cond_19
    new-instance v1, Ljava/lang/Thread;

    .line 980
    .line 981
    new-instance v2, Ls4;

    .line 982
    .line 983
    const/16 v3, 0x13

    .line 984
    .line 985
    invoke-direct {v2, v0, v3}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 986
    .line 987
    .line 988
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 989
    .line 990
    .line 991
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 992
    .line 993
    .line 994
    :goto_6
    invoke-virtual {v0}, Landroidx/activity/a;->i()Landroidx/activity/b;

    .line 995
    .line 996
    .line 997
    move-result-object v1

    .line 998
    new-instance v2, Lr70;

    .line 999
    .line 1000
    invoke-direct {v2, v0}, Lr70;-><init>(Lcom/melodix/music/MainActivity;)V

    .line 1001
    .line 1002
    .line 1003
    invoke-virtual {v1, v0, v2}, Landroidx/activity/b;->a(Lci0;Lr70;)V

    .line 1004
    .line 1005
    .line 1006
    return-void
.end method

.method public final onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Le6;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->g0:Ls4;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->d0:Landroid/os/Handler;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->e0:Lub2;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->x()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 35
    .line 36
    invoke-static {}, Lm9;->b()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    sput-object v1, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 52
    .line 53
    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x52

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x83

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Le6;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 15
    .line 16
    const-class p2, Lcom/melodix/music/SettingsActivity;

    .line 17
    .line 18
    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/a;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    const-string v0, "spotify_uri"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->S:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->z()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroidx/activity/a;->onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->L:Landroid/widget/ImageButton;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/16 p2, 0x8

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->Z:Landroid/view/View;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->F()V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->H()V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 33
    .line 34
    if-eqz p0, :cond_4

    .line 35
    .line 36
    new-instance p1, Lx3;

    .line 37
    .line 38
    const/16 p2, 0x9

    .line 39
    .line 40
    invoke-direct {p1, p2}, Lx3;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->x()V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->Z:Landroid/view/View;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->b0:Landroid/util/Rational;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    iput-boolean p2, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->B(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/melodix/music/MainActivity;->a0:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 62
    .line 63
    if-eqz p2, :cond_3

    .line 64
    .line 65
    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 66
    .line 67
    .line 68
    :cond_3
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->a0:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->G()V

    .line 71
    .line 72
    .line 73
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 74
    .line 75
    if-eqz p0, :cond_4

    .line 76
    .line 77
    new-instance p1, Lx3;

    .line 78
    .line 79
    const/16 p2, 0xa

    .line 80
    .line 81
    invoke-direct {p1, p2}, Lx3;-><init>(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 85
    .line 86
    .line 87
    :cond_4
    return-void
.end method

.method public final onResume()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroidx/activity/a;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->u()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lju1;->v:Ljava/io/File;

    .line 12
    .line 13
    const/16 v1, 0x1a

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 24
    .line 25
    if-lt v2, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Li1;->C(Landroid/content/pm/PackageManager;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-static {p0, v0}, Lju1;->t(Lcom/melodix/music/MainActivity;Ljava/io/File;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-static {p0}, Lc40;->b(Landroid/content/ContextWrapper;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v2, Ls4;

    .line 52
    .line 53
    const/16 v3, 0x9

    .line 54
    .line 55
    invoke-direct {v2, p0, v3}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 59
    .line 60
    .line 61
    new-instance v0, Ls4;

    .line 62
    .line 63
    const/4 v2, 0x7

    .line 64
    invoke-direct {v0, p0, v2}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 71
    .line 72
    const-string v2, "bigwindow"

    .line 73
    .line 74
    invoke-static {v0, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v2, 0x1

    .line 79
    const/4 v3, 0x0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    move v0, v3

    .line 83
    goto :goto_0

    .line 84
    :cond_2
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->I:Z

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    move v0, v2

    .line 89
    goto :goto_0

    .line 90
    :cond_3
    const/4 v0, -0x1

    .line 91
    :goto_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    const-string v4, "try {\n    window.__sdBg = false;\n    if(window.__sfEnsureMobileShell) window.__sfEnsureMobileShell();\n    if(window.__sdWasPfint) { window.__sdWasPfint = false; if(typeof firstFuck === \'function\') firstFuck(); }\n    if(window.__sdWasAfint) { window.__sdWasAfint = false; if(typeof addAutoFeatures === \'function\') addAutoFeatures(); }\n    if(window.__sdWasCssint) { window.__sdWasCssint = false; if(typeof addCSSJSHack === \'function\') addCSSJSHack(); }\n} catch(e) {}"

    .line 99
    .line 100
    const/4 v5, 0x0

    .line 101
    invoke-virtual {v0, v4, v5}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    iget-boolean v4, p0, Lcom/melodix/music/MainActivity;->sfResumePending:Z
    if-eqz v4, :resume_watchdog_done
    const/4 v4, 0x0
    iput-boolean v4, p0, Lcom/melodix/music/MainActivity;->sfResumePending:Z
    invoke-static {v0}, Lcom/melodix/music/StartupLoadWatchdog;->armAfterResume(Landroid/webkit/WebView;)V
    :resume_watchdog_done

    .line 102
    .line 103
    .line 104
    :cond_4
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 105
    .line 106
    const-string v4, "LoggedIn"

    .line 107
    .line 108
    if-nez v0, :cond_a

    .line 109
    .line 110
    sput-boolean v2, Lcom/melodix/music/AppSingleton;->A:Z

    .line 111
    .line 112
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 113
    .line 114
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v5, "ServiceOn"

    .line 119
    .line 120
    invoke-interface {v0, v5, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 125
    .line 126
    .line 127
    sget-boolean v0, Lcom/melodix/music/MainActivity;->l0:Z

    .line 128
    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    sput-boolean v3, Lcom/melodix/music/AppSingleton;->B:Z

    .line 132
    .line 133
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 142
    .line 143
    .line 144
    :cond_5
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 145
    .line 146
    if-nez v0, :cond_8

    .line 147
    .line 148
    sget-boolean v4, Lcom/melodix/music/MainActivity;->l0:Z

    .line 149
    .line 150
    if-eqz v4, :cond_6

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_6
    new-instance v0, Landroid/content/Intent;

    .line 154
    .line 155
    const-class v4, Lcom/melodix/music/WebService;

    .line 156
    .line 157
    invoke-direct {v0, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 158
    .line 159
    .line 160
    :try_start_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 161
    .line 162
    if-lt v4, v1, :cond_7

    .line 163
    .line 164
    invoke-static {p0, v0}, Li1;->u(Lcom/melodix/music/MainActivity;Landroid/content/Intent;)V

    .line 165
    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_7
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .line 170
    .line 171
    :catch_0
    :goto_1
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->C()V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_8
    :goto_2
    if-eqz v0, :cond_9

    .line 176
    .line 177
    new-instance v0, Lwk0;

    .line 178
    .line 179
    invoke-direct {v0, p0, v2}, Lwk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->w(Lp80;)V

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_9
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 187
    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_a
    sget-boolean v0, Lcom/melodix/music/MainActivity;->l0:Z

    .line 191
    .line 192
    if-eqz v0, :cond_b

    .line 193
    .line 194
    sput-boolean v3, Lcom/melodix/music/AppSingleton;->B:Z

    .line 195
    .line 196
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 197
    .line 198
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 210
    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_b
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 214
    .line 215
    if-eqz v0, :cond_c

    .line 216
    .line 217
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-nez v0, :cond_d

    .line 222
    .line 223
    :cond_c
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->C()V

    .line 224
    .line 225
    .line 226
    :cond_d
    :goto_3
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->K:Z

    .line 227
    .line 228
    if-eqz v0, :cond_e

    .line 229
    .line 230
    const-string v0, "en"

    .line 231
    .line 232
    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 237
    .line 238
    .line 239
    :cond_e
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 240
    .line 241
    if-eqz v0, :cond_10

    .line 242
    .line 243
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 244
    .line 245
    if-eqz v0, :cond_10

    .line 246
    .line 247
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 248
    .line 249
    if-eqz v0, :cond_f

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_f
    new-instance v0, Lzk0;

    .line 253
    .line 254
    invoke-direct {v0, p0, v3, v2}, Lzk0;-><init>(Lcom/melodix/music/MainActivity;ZI)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 258
    .line 259
    .line 260
    :cond_10
    :goto_4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    if-eqz v0, :cond_12

    .line 265
    .line 266
    const-string v1, "spotify_uri"

    .line 267
    .line 268
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    if-eqz v0, :cond_12

    .line 273
    .line 274
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->S:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    if-eqz v0, :cond_11

    .line 281
    .line 282
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    :cond_11
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->z()V

    .line 286
    .line 287
    .line 288
    :cond_12
    sget-boolean v0, Lcom/melodix/music/MainActivity;->k0:Z

    .line 289
    .line 290
    if-nez v0, :cond_13

    .line 291
    .line 292
    sget-boolean v0, Lcom/melodix/music/MainActivity;->j0:Z

    .line 293
    .line 294
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->K:Z

    .line 295
    .line 296
    if-eq v0, v1, :cond_14

    .line 297
    .line 298
    :cond_13
    sput-boolean v3, Lcom/melodix/music/MainActivity;->k0:Z

    .line 299
    .line 300
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->K:Z

    .line 301
    .line 302
    sput-boolean v0, Lcom/melodix/music/MainActivity;->j0:Z

    .line 303
    .line 304
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->A()V

    .line 305
    .line 306
    .line 307
    :cond_14
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-nez v0, :cond_15

    .line 312
    .line 313
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 314
    .line 315
    if-eqz v0, :cond_15

    .line 316
    .line 317
    new-instance v1, Lx3;

    .line 318
    .line 319
    const/16 v2, 0x8

    .line 320
    .line 321
    invoke-direct {v1, v2}, Lx3;-><init>(I)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 325
    .line 326
    .line 327
    :cond_15
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->G()V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public final onStop()V
    .locals 2

    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->sfResumePending:Z

    .line 1
    invoke-super {p0}, Le6;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-string v0, "try {\n    window.__sdBg = true;\n    if(typeof pfint !== \'undefined\' && pfint) { clearInterval(pfint); pfint = null; window.__sdWasPfint = true; }\n    if(typeof afint !== \'undefined\' && afint) { clearInterval(afint); afint = null; window.__sdWasAfint = true; }\n    if(typeof cssint !== \'undefined\' && cssint) { clearInterval(cssint); cssint = null; window.__sdWasCssint = true; }\n} catch(e) {}"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final s()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lpa0;

    .line 14
    .line 15
    invoke-direct {v2, v1}, Lpa0;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v3, 0x1e

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const/4 v5, 0x1

    .line 24
    if-lt v1, v3, :cond_0

    .line 25
    .line 26
    new-instance v1, Llk1;

    .line 27
    .line 28
    invoke-direct {v1, v0, v2, v5}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/16 v3, 0x1a

    .line 33
    .line 34
    if-lt v1, v3, :cond_1

    .line 35
    .line 36
    new-instance v1, Lmk1;

    .line 37
    .line 38
    invoke-direct {v1, v0, v2, v4}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance v1, Llk1;

    .line 43
    .line 44
    invoke-direct {v1, v0, v2, v4}, Llk1;-><init>(Landroid/view/Window;Lpa0;I)V

    .line 45
    .line 46
    .line 47
    :goto_0
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->T:Z

    .line 48
    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    sget-object v0, Lcom/melodix/music/AppSingleton;->z:Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "bigwindow"

    .line 54
    .line 55
    invoke-static {v0, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v5, v4

    .line 63
    :cond_3
    :goto_1
    const/16 v0, 0x400

    .line 64
    .line 65
    if-eqz v5, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2, v0}, Landroid/view/Window;->addFlags(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Lst;->g()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Lst;->u()V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Lst;->v()V

    .line 89
    .line 90
    .line 91
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroid/view/View;->requestApplyInsets()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 103
    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/view/View;->requestApplyInsets()V

    .line 107
    .line 108
    .line 109
    :cond_5
    if-eqz v5, :cond_6

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_6
    sget v4, Lcom/melodix/music/AppSingleton;->U:I

    .line 113
    .line 114
    :goto_3
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string v1, "if(window.SF_CONFIG){ window.SF_CONFIG.statusBarHeight = "

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v1, "; } document.documentElement.style.setProperty(\'--sf-safe-area-top\', \'"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, "px\');"

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const/4 v1, 0x0

    .line 146
    invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 147
    .line 148
    .line 149
    :cond_7
    return-void
.end method

.method public final t()Landroid/app/PictureInPictureParams;
    .locals 8

    .line 1
    new-instance v0, Landroid/app/PictureInPictureParams$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/app/PictureInPictureParams$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->b0:Landroid/util/Rational;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Landroid/util/Rational;

    .line 12
    .line 13
    invoke-direct {v1, v2, v2}, Landroid/util/Rational;-><init>(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0, v1}, Landroid/app/PictureInPictureParams$Builder;->setAspectRatio(Landroid/util/Rational;)Landroid/app/PictureInPictureParams$Builder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v3, 0x1a

    .line 23
    .line 24
    if-lt v1, v3, :cond_5

    .line 25
    .line 26
    if-ge v1, v3, :cond_1

    .line 27
    .line 28
    sget-object p0, Lu00;->j:Lu00;

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    invoke-static {}, Li1;->n()V

    .line 32
    .line 33
    .line 34
    const v1, 0x7f080124

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v3, "com.melodix.music.PIP_PREV"

    .line 42
    .line 43
    invoke-virtual {p0, v3}, Lcom/melodix/music/MainActivity;->y(Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    new-instance v4, Landroid/app/RemoteAction;

    .line 48
    .line 49
    const-string v5, "Previous"

    .line 50
    .line 51
    invoke-direct {v4, v1, v5, v5, v3}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Li1;->n()V

    .line 55
    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/melodix/music/MainActivity;->U:Z

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    const v1, 0x7f080121

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const v1, 0x7f080122

    .line 66
    .line 67
    .line 68
    :goto_0
    invoke-static {p0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-boolean v3, p0, Lcom/melodix/music/MainActivity;->U:Z

    .line 73
    .line 74
    const-string v5, "Play"

    .line 75
    .line 76
    const-string v6, "Pause"

    .line 77
    .line 78
    if-eqz v3, :cond_3

    .line 79
    .line 80
    move-object v3, v6

    .line 81
    goto :goto_1

    .line 82
    :cond_3
    move-object v3, v5

    .line 83
    :goto_1
    iget-boolean v7, p0, Lcom/melodix/music/MainActivity;->U:Z

    .line 84
    .line 85
    if-eqz v7, :cond_4

    .line 86
    .line 87
    move-object v5, v6

    .line 88
    :cond_4
    const-string v6, "com.melodix.music.PIP_PLAY_PAUSE"

    .line 89
    .line 90
    invoke-virtual {p0, v6}, Lcom/melodix/music/MainActivity;->y(Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    new-instance v7, Landroid/app/RemoteAction;

    .line 95
    .line 96
    invoke-direct {v7, v1, v3, v5, v6}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Li1;->n()V

    .line 100
    .line 101
    .line 102
    const v1, 0x7f080113

    .line 103
    .line 104
    .line 105
    invoke-static {p0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v3, "com.melodix.music.PIP_NEXT"

    .line 110
    .line 111
    invoke-virtual {p0, v3}, Lcom/melodix/music/MainActivity;->y(Ljava/lang/String;)Landroid/app/PendingIntent;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance v3, Landroid/app/RemoteAction;

    .line 116
    .line 117
    const-string v5, "Next"

    .line 118
    .line 119
    invoke-direct {v3, v1, v5, v5, p0}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 120
    .line 121
    .line 122
    const/4 p0, 0x3

    .line 123
    new-array p0, p0, [Landroid/app/RemoteAction;

    .line 124
    .line 125
    const/4 v1, 0x0

    .line 126
    aput-object v4, p0, v1

    .line 127
    .line 128
    aput-object v7, p0, v2

    .line 129
    .line 130
    const/4 v1, 0x2

    .line 131
    aput-object v3, p0, v1

    .line 132
    .line 133
    invoke-static {p0}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    :goto_2
    invoke-virtual {v0, p0}, Landroid/app/PictureInPictureParams$Builder;->setActions(Ljava/util/List;)Landroid/app/PictureInPictureParams$Builder;

    .line 138
    .line 139
    .line 140
    :cond_5
    invoke-virtual {v0}, Landroid/app/PictureInPictureParams$Builder;->build()Landroid/app/PictureInPictureParams;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    return-object p0
.end method

.method public final u()Z
    .locals 3

    # The signature check runs for every build, preview included: security is
    # never skipped. A preview simply must not open a browser or close itself.

    .line 1
    new-instance v0, Lcom/melodix/music/AndBridge;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/melodix/music/AndBridge;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/melodix/music/AndBridge;->isSignatureValid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".preview"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :gate_browser

    const-string v2, "signature-refused"

    invoke-static {v2}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :gate_browser
    .line 11
    .line 12
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 13
    .line 14
    const-string v1, "android.intent.action.VIEW"

    .line 15
    .line 16
    const-string v2, "https://github.com/Souxch06/Melodix"

    .line 17
    .line 18
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    const/high16 v1, 0x10000000

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :catch_0
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public final v(Z)V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->L:Landroid/widget/ImageButton;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iput-boolean p1, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->Y:Z

    .line 21
    .line 22
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->T:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/Thread;

    .line 37
    .line 38
    new-instance v2, Lbl0;

    .line 39
    .line 40
    invoke-direct {v2, v0, p0}, Lbl0;-><init>(Ljava/lang/String;Lcom/melodix/music/MainActivity;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 47
    .line 48
    .line 49
    :cond_2
    if-nez p1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->F()V

    .line 52
    .line 53
    .line 54
    :cond_3
    const/4 v0, 0x0

    .line 55
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->t()Landroid/app/PictureInPictureParams;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {p0, v1}, Li1;->A(Lcom/melodix/music/MainActivity;Landroid/app/PictureInPictureParams;)Z

    .line 60
    .line 61
    .line 62
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move v1, v0

    .line 65
    :goto_0
    if-nez v1, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->x()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->G()V

    .line 71
    .line 72
    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->B(Z)V

    .line 76
    .line 77
    .line 78
    :cond_4
    :goto_1
    return-void
.end method

.method public final w(Lp80;)V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lp80;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->m:Z

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    sput v0, Lcom/melodix/music/AppSingleton;->n:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-wide/16 v2, 0xc8

    .line 46
    .line 47
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    new-instance v2, Ls4;

    .line 54
    .line 55
    const/16 v3, 0xa

    .line 56
    .line 57
    invoke-direct {v2, p0, v3}, Ls4;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    const-wide/16 v1, 0x190

    .line 105
    .line 106
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    new-instance v1, Lcl0;

    .line 113
    .line 114
    invoke-direct {v1, p0, p1}, Lcl0;-><init>(Lcom/melodix/music/MainActivity;Lp80;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    if-eqz p0, :cond_4

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 124
    .line 125
    .line 126
    :cond_4
    return-void
.end method

.method public final x()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    check-cast v2, Landroid/view/ViewGroup;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v2, v1

    .line 18
    :goto_0
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->X:Landroid/widget/ImageView;

    .line 26
    .line 27
    return-void
.end method

.method public final y(Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const/high16 v1, 0xc000000

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {p0, p1, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->S:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-boolean v1, Lcom/melodix/music/WebService;->r:Z

    .line 7
    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    sget-boolean v1, Lcom/melodix/music/AppSingleton;->l:Z

    .line 11
    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    sget-object v1, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    new-instance v2, Lr4;

    .line 19
    .line 20
    const/4 v3, 0x5

    .line 21
    invoke-direct {v2, v0, v3}, Lr4;-><init>(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->S:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const-string v0, "spotify_uri"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public final postNativeUiReady()V
    .locals 3

    new-instance v0, Lcom/melodix/music/NativeUiUpdateRunnable;
    const-string v1, ""
    const/4 v2, 0x0
    invoke-direct {v0, p0, v1, v1, v2}, Lcom/melodix/music/NativeUiUpdateRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    return-void
.end method

.method public final postNativeUiRoute(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/melodix/music/NativeUiUpdateRunnable;
    const-string v1, ""
    const/4 v2, 0x2
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/melodix/music/NativeUiUpdateRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    return-void
.end method

.method public final postNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Lcom/melodix/music/NativeUiUpdateRunnable;
    const/4 v1, 0x1
    invoke-direct {v0, p0, p1, p2, v1}, Lcom/melodix/music/NativeUiUpdateRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    return-void
.end method

.method public final showNativeUi()V
    .locals 5

    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    iget-object v1, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v1, :hide_splash_progress
    const/16 v2, 0x8
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :hide_splash_progress
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->R:Landroid/widget/ProgressBar;
    if-eqz v1, :show_native_root
    const/16 v2, 0x8
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :show_native_root
    const v0, 0x7f09022f
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :hide_legacy_settings
    const/4 v2, 0x0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :hide_legacy_settings
    const v0, 0x7f090060
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :style_native_controls
    const/16 v2, 0x8
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :style_native_controls
    # The play/pause buttons are ImageViews styled in XML (white circle + black
    # glyph); no runtime patching is needed any more.
    const/4 v2, 0x0

    :style_mini_play_button

    :set_default_screen
    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeSearchWatcherAttached:Z
    if-nez v0, :check_default_screen
    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :check_default_screen
    check-cast v1, Landroid/widget/EditText;
    new-instance v2, Lcom/melodix/music/NativeSearchWatcher;
    invoke-direct {v2, p0, v1}, Lcom/melodix/music/NativeSearchWatcher;-><init>(Lcom/melodix/music/MainActivity;Landroid/widget/EditText;)V
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V
    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeSearchWatcherAttached:Z

    :check_default_screen
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-nez v0, :show_done
    const-string v0, "home"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V

    :show_done
    const-string v0, "ready"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    return-void
.end method

.method public final setNativeScreen(Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :native_screen_abort

    # Compare with the previous destination before overwriting it: a nav tap
    # fades the shell in, a repeated feed update does not.
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;

    if-eqz v1, :native_fade_flag

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :native_fade_flag

    const/4 v0, 0x0

    :native_fade_flag
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeFadeNextScreen:Z

    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;

    # The browse grid belongs to the empty search screen only.
    const v0, 0x7f09024f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :native_genre_hidden_once

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :native_genre_hidden_once
    const-string v0, "search"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const v2, 0x7f090232
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :library_panel
    if-eqz v1, :hide_search_panel
    const/4 v3, 0x0
    goto :set_search_panel
    :hide_search_panel
    const/16 v3, 0x8
    :set_search_panel
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :library_panel
    const-string v0, "library"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const v2, 0x7f090234
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :back_button
    if-eqz v1, :hide_library_panel
    const/4 v3, 0x0
    goto :set_library_panel
    :hide_library_panel
    const/16 v3, 0x8
    :set_library_panel
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :back_button
    # The back arrow must exist on both screens the user can enter from a row
    # or the mini player. The old test overwrote the detail flag with the
    # player flag, so the button was hidden everywhere.
    const-string v0, "detail"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :native_back_check_player
    const/4 v1, 0x1
    goto :set_back_button_visibility
    :native_back_check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :native_back_show
    const-string v0, "settings"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :native_back_show
    goto :set_back_button_visibility
    :native_back_show
    const/4 v1, 0x1
    :set_back_button_visibility
    const v2, 0x7f090231
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :player_panel
    if-eqz v1, :hide_back_button
    const/4 v3, 0x0
    goto :set_back_button
    :hide_back_button
    const/16 v3, 0x8
    :set_back_button
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :player_panel
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const v2, 0x7f090239
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :native_full_player_panel
    if-eqz v1, :show_native_rows
    const/16 v3, 0x8
    goto :set_native_rows
    :show_native_rows
    const/4 v3, 0x0
    :set_native_rows
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :native_full_player_panel
    const v2, 0x7f09023a
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :native_mini_player
    if-eqz v1, :hide_native_full_player
    const/4 v3, 0x0
    goto :set_native_full_player
    :hide_native_full_player
    const/16 v3, 0x8
    :set_native_full_player
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :native_mini_player
    # Hide the whole card (row + progress line), not just the row, and keep it
    # hidden until Spotify reports a track.
    const v2, 0x7f09024c
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :native_tab_bar
    if-eqz v1, :hide_native_mini_player
    iget-boolean v3, p0, Lcom/melodix/music/MainActivity;->nativeHasTrack:Z
    if-eqz v3, :show_native_mini_player
    :hide_native_mini_player
    const/16 v3, 0x8
    goto :set_native_mini_player
    :show_native_mini_player
    const/4 v3, 0x0
    :set_native_mini_player
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :native_tab_bar
    const v2, 0x7f09024e
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :screen_title
    if-eqz v1, :show_native_tab_bar
    const/16 v3, 0x8
    goto :set_native_tab_bar
    :show_native_tab_bar
    const/4 v3, 0x0
    :set_native_tab_bar
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :screen_title
    const-string v0, "home"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :title_search
    const-string v4, "Accueil"
    goto :write_screen_title
    :title_search
    const-string v0, "search"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :title_library
    const-string v4, "Rechercher"
    goto :write_screen_title
    :title_library
    const-string v0, "library"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :title_player
    const-string v4, "Votre bibliothèque"
    goto :write_screen_title
    :title_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :title_settings
    const-string v4, "Lecture en cours"
    goto :write_screen_title
    :title_settings
    const-string v0, "settings"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :title_detail
    const-string v4, "Paramètres"
    goto :write_screen_title
    :title_detail
    const-string v0, "detail"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :screen_done
    const-string v4, "Détails"
    :write_screen_title
    iput-object v4, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    const v5, 0x7f090230
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v6
    if-eqz v6, :screen_done
    check-cast v6, Landroid/widget/TextView;
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :screen_done
    const-string v3, "home"
    const v2, 0x7f090246
    invoke-virtual {p0, p1, v3, v2}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    const-string v3, "search"
    const v2, 0x7f090247
    invoke-virtual {p0, p1, v3, v2}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    const-string v3, "library"
    const v2, 0x7f090248
    invoke-virtual {p0, p1, v3, v2}, Lcom/melodix/music/MainActivity;->styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V

    iget-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeFadeNextScreen:Z

    if-eqz v0, :native_fade_done

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->nativeFadeNextScreen:Z

    invoke-static {p0}, Lcom/melodix/music/MainActivity;->fadeNativeScreen(Lcom/melodix/music/MainActivity;)V

    :native_fade_done
    :native_screen_abort
    return-void
.end method

.method public final styleNativeTab(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    invoke-virtual {p0, p3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :native_tab_style_done
    if-eqz v0, :native_tab_inactive
    const v2, -0x1
    const v4, -0xe128a0
    goto :native_tab_apply

    :native_tab_inactive
    const v2, -0x4c4c4d
    const v4, -0x4c4c4d

    :native_tab_apply
    instance-of v3, v1, Landroid/widget/TextView;
    if-nez v3, :native_tab_as_group
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v3
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCompoundDrawableTintList(Landroid/content/res/ColorStateList;)V
    goto :native_tab_style_done

    :native_tab_as_group
    instance-of v3, v1, Landroid/view/ViewGroup;
    if-eqz v3, :native_tab_style_done
    check-cast v1, Landroid/view/ViewGroup;
    const/4 v3, 0x0
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    if-eqz v5, :native_tab_text_child
    instance-of v6, v5, Landroid/widget/ImageView;
    if-eqz v6, :native_tab_text_child
    check-cast v5, Landroid/widget/ImageView;
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setColorFilter(I)V

    :native_tab_text_child
    const/4 v3, 0x1
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    if-eqz v5, :native_tab_style_done
    instance-of v6, v5, Landroid/widget/TextView;
    if-eqz v6, :native_tab_style_done
    check-cast v5, Landroid/widget/TextView;
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :native_tab_style_done
    return-void
.end method

.method private static fadeNativeScreen(Lcom/melodix/music/MainActivity;)V
    .locals 4

    const v0, 0x7f09022f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :fade_done

    # Start slightly transparent instead of fully invisible: the shell gradient
    # is opaque, so a lower alpha would flash the WebView underneath, and a
    # cancelled animation can never leave the screen blank.
    const/high16 v1, 0x3f600000

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/high16 v2, 0x3f800000

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v2, 0xb4

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :fade_done
    return-void
.end method

.method public final applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    const-string v0, "home-greeting"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_profile_image
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v2, :apply_done
    const-string v3, "home"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    const v2, 0x7f090230
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :apply_done
    check-cast v2, Landroid/widget/TextView;
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-void

    :check_profile_image
    const-string v0, "profile-image"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_initial_search
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->setNativeProfileImage(Ljava/lang/String;)V
    return-void

    :check_initial_search
    const-string v0, "initial-search"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_screen_title
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v2, :apply_done
    const-string v3, "search"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :native_initial_search_submit
    check-cast v1, Landroid/widget/EditText;
    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :native_initial_search_submit
    const-string v2, "Résultats de recherche"
    const-string v3, "[]"
    invoke-virtual {p0, v2, v3}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    const-string v2, "window.searchMediaItems"
    invoke-virtual {p0, v2, p2}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :check_screen_title
    const-string v0, "screen-title"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_detail_data
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :apply_done
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    const v0, 0x7f090230
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :apply_done
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    return-void

    :check_detail_data
    const-string v0, "detail"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_player
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v2, :apply_done
    const-string v3, "detail"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    if-eqz v2, :native_route_default_title
    invoke-virtual {p0, v2, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void
    :native_route_default_title
    const-string v2, "Détails"
    invoke-virtual {p0, v2, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :check_player
    const-string v0, "player"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_home
    invoke-virtual {p0, p2}, Lcom/melodix/music/MainActivity;->updateNativePlayer(Ljava/lang/String;)V
    return-void

    :check_home
    const-string v0, "home"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_media
    const-string v2, "home"
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    :apply_home
    const-string v2, "Accueil"
    invoke-virtual {p0, v2, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :check_media
    const-string v0, "media:"
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :check_settings
    const/4 v0, 0x6
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v2
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    if-eqz v3, :apply_done
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    iget-object v5, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v5, :apply_done
    const-string v6, "library"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :media_detail
    iget-object v8, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    if-eqz v8, :library_default_title
    invoke-virtual {p0, v8, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void
    :library_default_title
    const-string v8, "Votre bibliothèque"
    invoke-virtual {p0, v8, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :media_detail
    const-string v6, "detail"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :apply_done
    iget-object v8, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    if-eqz v8, :detail_default_title
    invoke-virtual {p0, v8, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void
    :detail_default_title
    const-string v8, "Playlist"
    invoke-virtual {p0, v8, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :check_settings
    const-string v0, "settings"
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :check_search
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v2, :apply_done
    const-string v3, "settings"
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    const-string v2, "Paramètres"
    invoke-virtual {p0, v2, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :check_search
    const-string v0, "search:"
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :apply_done
    const/4 v0, 0x7
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v2
    iget-object v3, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    if-eqz v3, :apply_done
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    iget-object v5, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v5, :apply_done
    const-string v6, "search"
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :apply_done
    const-string v8, "Résultats de recherche"
    invoke-virtual {p0, v8, p2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V

    :apply_done
    return-void
.end method

.method public final updateNativePlayer(Ljava/lang/String;)V
    .locals 12

    :try_start_native_player
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v1, "track"
    const-string v2, "Aucune lecture en cours"
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :native_player_no_track
    const/4 v1, 0x1
    goto :native_player_track_flag
    :native_player_no_track
    const/4 v1, 0x0
    :native_player_track_flag
    iput-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeHasTrack:Z
    const-string v1, "artist"
    const-string v3, ""
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3

    const v1, 0x7f090236
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    if-eqz v4, :native_player_large_title
    check-cast v4, Landroid/widget/TextView;
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :native_player_large_title
    const v1, 0x7f09023b
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    if-eqz v4, :native_player_artist
    check-cast v4, Landroid/widget/TextView;
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :native_player_artist
    const v1, 0x7f090237
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    if-eqz v4, :native_player_large_artist
    check-cast v4, Landroid/widget/TextView;
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :native_player_large_artist
    const v1, 0x7f09023c
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v4
    if-eqz v4, :native_player_progress
    check-cast v4, Landroid/widget/TextView;
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v1, "cover"
    const-string v2, ""
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    const v8, 0x7f090244
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_large_artwork
    check-cast v9, Landroid/widget/ImageView;
    const/16 v8, 0xc0
    invoke-static {v9, v2, v8}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :native_player_large_artwork
    const v8, 0x7f090245
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_progress
    check-cast v9, Landroid/widget/ImageView;
    const/16 v8, 0x2d0
    invoke-static {v9, v2, v8}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :native_player_progress
    const-string v1, "duration"
    const-wide/16 v6, 0x0
    invoke-virtual {v0, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J
    move-result-wide v2
    const-string v1, "position"
    const-wide/16 v6, 0x0
    invoke-virtual {v0, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J
    move-result-wide v4
    invoke-static {v4, v5}, Lcom/melodix/music/MainActivity;->formatNativeTime(J)Ljava/lang/String;
    move-result-object v11
    invoke-static {v2, v3}, Lcom/melodix/music/MainActivity;->formatNativeTime(J)Ljava/lang/String;
    move-result-object v10
    const v8, 0x7f09023d
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_play_state
    check-cast v9, Landroid/widget/ProgressBar;
    const/16 v8, 0x3e8
    invoke-virtual {v9, v8}, Landroid/widget/ProgressBar;->setMax(I)V
    const-wide/16 v6, 0x0
    cmp-long v8, v2, v6
    if-lez v8, :native_player_zero_progress
    const-wide/16 v6, 0x3e8
    mul-long v4, v4, v6
    div-long v4, v4, v2
    long-to-int v4, v4
    goto :native_player_set_progress
    :native_player_zero_progress
    const/4 v4, 0x0
    :native_player_set_progress
    invoke-virtual {v9, v4}, Landroid/widget/ProgressBar;->setProgress(I)V

    const v8, 0x7f09024d
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_mini_progress
    check-cast v9, Landroid/widget/ProgressBar;
    invoke-virtual {v9, v4}, Landroid/widget/ProgressBar;->setProgress(I)V

    :native_player_mini_progress
    const v8, 0x7f09024a
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_label_duration
    check-cast v9, Landroid/widget/TextView;
    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :native_player_label_duration
    const v8, 0x7f09024b
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_play_state
    check-cast v9, Landroid/widget/TextView;
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :native_player_play_state
    const-string v1, "playing"
    const/4 v6, 0x0
    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z
    move-result v6
    const v8, 0x7f090238
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_large_button
    check-cast v9, Landroid/widget/ImageView;
    if-eqz v6, :native_player_mini_play
    const v7, 0x7f080121
    goto :native_player_mini_set
    :native_player_mini_play
    const v7, 0x7f080122
    :native_player_mini_set
    invoke-virtual {v9, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    :native_player_large_button
    const v8, 0x7f09023e
    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v9
    if-eqz v9, :native_player_try_done
    check-cast v9, Landroid/widget/ImageView;
    if-eqz v6, :native_player_large_play
    const v7, 0x7f080121
    goto :native_player_large_set
    :native_player_large_play
    const v7, 0x7f080122
    :native_player_large_set
    invoke-virtual {v9, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    :native_player_try_done
    # Show the mini player card only when a track exists, and never while the
    # full player is open.
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v1, :native_player_mini_visibility
    const-string v2, "player"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :native_player_mini_visibility
    iget-boolean v1, p0, Lcom/melodix/music/MainActivity;->nativeHasTrack:Z
    if-eqz v1, :native_player_mini_visible
    const/16 v1, 0x8
    goto :native_player_mini_apply
    :native_player_mini_visible
    const/4 v1, 0x0
    :native_player_mini_apply
    const v2, 0x7f09024c
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :native_player_mini_visibility
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :native_player_mini_visibility
    :try_end_native_player
    .catch Lorg/json/JSONException; {:try_start_native_player .. :try_end_native_player} :catch_native_player
    return-void
    :catch_native_player
    move-exception v0
    return-void
.end method

.method private static formatNativeTime(J)Ljava/lang/String;
    .locals 6

    const-wide/16 v0, 0x3e8
    div-long v0, p0, v0
    const-wide/16 v2, 0x3c
    div-long v2, v0, v2
    const-wide/16 v4, 0x3c
    rem-long v4, v0, v4

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v1, ":"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-wide/16 v2, 0xa
    cmp-long v1, v4, v2
    if-ltz v1, :native_time_pad
    const-string v1, "0"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :native_time_pad
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    # Rendering rows always means the list is the visible content, so leave the
    # browse grid and restore the scrolling list.
    const v0, 0x7f090239

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :native_rows_visible

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :native_rows_visible
    const v0, 0x7f09024f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :native_genre_gone

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :native_genre_gone
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;

    const v0, 0x7f090230
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :find_native_content
    check-cast v1, Landroid/widget/TextView;
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :find_native_content
    const v0, 0x7f090235
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :render_native_done
    check-cast v2, Landroid/widget/LinearLayout;
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    # Always use the row list. The shelf renderer swallowed the 32-card feed
    # and left the XML "Loading your music…" placeholder on screen.

    :native_rows_list
    :try_start_native_rows
    new-instance v3, Lorg/json/JSONArray;
    invoke-direct {v3, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I
    move-result v4
    if-lez v4, :native_rows_empty

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "detail"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :native_rows_start_loop
    const/4 v0, 0x0
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v6
    const-string v8, ""
    const-string v9, ""
    if-eqz v6, :native_rows_create_banner
    const-string v0, "image"
    invoke-virtual {v6, v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_rows_banner_uri
    const-string v0, "cover"
    const-string v1, ""
    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
    :native_rows_banner_uri
    const-string v0, "id"
    invoke-virtual {v6, v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_rows_create_banner
    const-string v0, "uri"
    const-string v1, ""
    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    :native_rows_create_banner
    invoke-static {p0, p1, v4, v8, v9}, Lcom/melodix/music/NativeUiRowFactory;->createPlaylistBanner(Lcom/melodix/music/MainActivity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    move-result-object v0
    if-eqz v0, :native_rows_start_loop
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :native_rows_start_loop
    const-string v8, ""
    const/4 v5, 0x0
    :native_rows_loop
    if-ge v5, v4, :native_rows_try_done
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;
    move-result-object v6
    if-eqz v6, :native_row_scalar
    const-string v0, "section"
    const-string v1, ""
    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_build_card
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :native_row_build_card
    move-object v8, v9
    invoke-static {p0, v9}, Lcom/melodix/music/NativeUiRowFactory;->createSectionHeader(Lcom/melodix/music/MainActivity;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    if-eqz v0, :native_row_build_card
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :native_row_build_card
    const-string v0, "settingValue"
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    # Empty settingValue = content row (cover + title + subtitle): it must reach the content factory.
    if-eqz v1, :native_row_create_standard
    invoke-static {p0, v6}, Lcom/melodix/music/NativeSettingsRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v0
    goto :native_row_created

    :native_row_create_standard
    invoke-static {p0, v6}, Lcom/melodix/music/NativeUiRowFactory;->create(Lcom/melodix/music/MainActivity;Lorg/json/JSONObject;)Landroid/widget/LinearLayout;
    move-result-object v0

    :native_row_created
    if-eqz v0, :native_row_increment
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    goto :native_row_increment

    :native_row_scalar
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;
    move-result-object v0
    new-instance v6, Landroid/widget/TextView;
    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v0, 0x41700000
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const v0, -0x1
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v0, 0x10
    invoke-virtual {v6, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v0, -0x1
    const/4 v7, -0x2
    invoke-direct {v1, v0, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :native_row_increment
    add-int/lit8 v5, v5, 0x1
    goto :native_rows_loop

    :native_rows_empty
    new-instance v6, Landroid/widget/TextView;
    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "search"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :native_rows_default_empty
    const-string v0, "Recherchez un artiste, un titre, un album ou une playlist ci-dessus"
    goto :native_rows_set_empty

    :native_rows_default_empty
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "detail"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :native_rows_check_home
    const-string v0, "Chargement de la playlist…"
    goto :native_rows_set_empty

    :native_rows_check_home
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "home"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :native_rows_check_library
    const-string v0, "Chargement de votre accueil…"
    goto :native_rows_set_empty

    :native_rows_check_library
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "library"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :native_rows_default_text
    const-string v0, "Chargement de votre bibliothèque…"
    goto :native_rows_set_empty

    :native_rows_default_text
    const-string v0, "Rien à afficher pour le moment"
    :native_rows_set_empty
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v0, 0x41800000
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const v0, -0x4a3f48
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v0, 0x11
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setGravity(I)V
    const/16 v0, 0x18
    invoke-virtual {v6, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v0, -0x1
    const/4 v7, -0x2
    invoke-direct {v1, v0, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {v2, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :native_rows_try_done
    :try_end_native_rows
    .catch Lorg/json/JSONException; {:try_start_native_rows .. :try_end_native_rows} :catch_native_rows
    return-void

    :catch_native_rows
    move-exception v0
    return-void

    :render_native_done
    return-void
.end method

.method public final runNativeJavascript(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;
    if-eqz v0, :native_js_done
    const/4 v1, 0x0
    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :native_js_done
    return-void
.end method

.method public final runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-static {p2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "("
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, ");"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {p0, v3}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativeHomeClick(Landroid/view/View;)V
    .locals 4

    const-string v0, "home"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    if-eqz v1, :home_request
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    const/16 v3, 0x8
    if-le v2, v3, :home_request
    const-string v2, "Accueil"
    invoke-virtual {p0, v2, v1}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    :home_request
    const-string v0, "window.__sfNativeRequestHome && window.__sfNativeRequestHome();"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativeSearchClick(Landroid/view/View;)V
    .locals 5

    const-string v0, "search"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const/4 v0, 0x0
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    const-string v0, "Rechercher"
    const-string v1, "[]"
    invoke-virtual {p0, v0, v1}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    # Focus the field and raise the keyboard once the panel is laid out. The
    # search page itself opens when a query is typed or submitted.
    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :native_search_click_done
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z
    new-instance v2, Lcom/melodix/music/NativeSearchFocusRunnable;
    invoke-direct {v2, p0, v1}, Lcom/melodix/music/NativeSearchFocusRunnable;-><init>(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    const-wide/16 v3, 0xfa
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :native_search_click_done
    const v0, 0x7f09024f

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :native_search_genre_shown

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :native_search_genre_shown
    return-void
.end method

.method public final performNativeLiveSearch(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :live_search_done
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :live_search_done

    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v1, :live_search_done
    const-string v2, "search"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :live_search_done

    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    const-string v1, "window.searchMediaItems"
    invoke-virtual {p0, v1, v0}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V

    :live_search_done
    return-void
.end method

.method public final onNativeSearchSubmit(Landroid/view/View;)V
    .locals 6

    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :native_search_submit_done
    check-cast v0, Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V
    const-string v4, "input_method"
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :read_search_text
    check-cast v4, Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;
    move-result-object v5
    const/4 v2, 0x0
    invoke-virtual {v4, v5, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :read_search_text
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-eqz v2, :native_search_submit_done

    iput-object v1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    const-string v2, "search"
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v2, "Résultats de recherche"
    const-string v3, "[]"
    invoke-virtual {p0, v2, v3}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    # A submitted query navigates at once; the shell exposes this even when
    # the playback bridge never started.
    const-string v2, "(window.__sfSubmitSearch||window.searchMediaItems)"
    invoke-virtual {p0, v2, v1}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V

    :native_search_submit_done
    return-void
.end method

.method public final onNativeLibraryClick(Landroid/view/View;)V
    .locals 3

    :try_start_lib
    const-string v0, "library"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "playlists"
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->styleNativeLibraryChips(Ljava/lang/String;)V
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    if-eqz v2, :lib_fetch
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x8
    if-le v0, v1, :lib_fetch
    const-string v0, "Votre bibliothèque"
    invoke-virtual {p0, v0, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    :lib_fetch
    const-string v0, "window.__sfOpenLibrary && window.__sfOpenLibrary()"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    :try_end_lib
    .catch Ljava/lang/Throwable; {:try_start_lib .. :try_end_lib} :catch_lib

    return-void

    :catch_lib
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method

.method public final onNativeLibraryCategoryClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v0
    if-eqz v0, :native_library_category_done
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->styleNativeLibraryChips(Ljava/lang/String;)V
    const-string v1, "library"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "Votre bibliothèque"
    const-string v2, "[]"
    invoke-virtual {p0, v1, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    # The chips called the bridge-only fetchMediaItems, which made them dead
    # buttons whenever the bridge had not started.
    const-string v1, "window.__sfOpenLibraryCategory"
    invoke-virtual {p0, v1, v0}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V

    :native_library_category_done
    return-void
.end method

.method public final onNativeGenreClick(Landroid/view/View;)V
    .locals 2

    # One handler for the whole browse grid: the tag carries the search term.
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :native_genre_done

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :native_genre_done

    # Keep the browse grid until results land (a failed search must not leave a
    # blank screen); only the header echoes the choice.
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->performNativeLiveSearch(Ljava/lang/String;)V

    const-string v1, "screen-title"

    invoke-virtual {p0, v1, v0}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    :native_genre_done
    return-void
.end method

.method public final styleNativeLibraryChips(Ljava/lang/String;)V
    .locals 7

    # Highlight the selected library filter: green pill, dark label, and every
    # other chip back to its neutral look.
    const v0, 0x7f090234
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :chips_done
    check-cast v0, Landroid/widget/HorizontalScrollView;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :chips_done
    check-cast v0, Landroid/widget/LinearLayout;
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I
    move-result v1
    const/4 v2, 0x0

    :chip_loop
    if-ge v2, v1, :chips_done
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;
    move-result-object v3
    if-nez v3, :chip_next
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v4
    if-nez v4, :chip_next
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    check-cast v3, Landroid/widget/TextView;
    if-eqz v5, :chip_inactive
    const v4, 0xff1ed760
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v6
    invoke-virtual {v3, v6}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    const v4, -0xededee
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V
    goto :chip_next

    :chip_inactive
    const/4 v4, 0x0
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    const v4, -0x1
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    :chip_next
    add-int/lit8 v2, v2, 0x1
    goto :chip_loop

    :chips_done
    return-void
.end method

.method public final onNativeBackClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnScreen:Ljava/lang/String;
    if-eqz v0, :native_back_default
    goto :native_back_restore
    :native_back_default
    const-string v0, "home"

    :native_back_restore
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeReturnExpectedId:Ljava/lang/String;
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeReturnSearch:Ljava/lang/String;
    iput-object v1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;

    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeReturnTitle:Ljava/lang/String;
    if-eqz v2, :native_back_title_default
    goto :native_back_title_ready
    :native_back_title_default
    const-string v2, "Accueil"
    const-string v3, "library"
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_back_check_search
    const-string v2, "Votre bibliothèque"
    goto :native_back_title_ready
    :native_back_check_search
    const-string v3, "search"
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :native_back_title_ready
    const-string v2, "Résultats de recherche"

    :native_back_title_ready
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->nativeReturnJson:Ljava/lang/String;
    if-eqz v4, :native_back_empty_json
    goto :native_back_render
    :native_back_empty_json
    const-string v4, "[]"

    :native_back_render
    invoke-virtual {p0, v2, v4}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public final openNativeRow(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    if-eqz p1, :native_row_click_done

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_click_done

    # Settings rows toggle their value through the shell; they never navigate.
    const-string v2, "spotify:settings:"
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :native_row_check_collection
    const-string v2, "window.__sfToggleSpotifySetting"
    invoke-virtual {p0, v2, p1}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :native_row_check_collection
    # Collections open the native detail screen. Tracks, episodes and anything
    # else are handed to the WebView so Spotify plays them.
    const/4 v1, 0x0
    const-string v2, ":playlist:"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, ":album:"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, ":artist:"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, ":show:"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, "/playlist/"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, "/album/"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, "/artist/"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, "/show/"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, ":collection"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    const-string v2, "/collection"
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    or-int/2addr v1, v3

    if-eqz v1, :native_open_single

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnScreen:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnTitle:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnJson:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnExpectedId:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnSearch:Ljava/lang/String;

    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    const-string v1, "detail"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v2, "[]"
    if-eqz p2, :native_collection_default_title
    move-object v3, p2
    goto :native_collection_title_ready
    :native_collection_default_title
    const-string v3, "Détails"
    :native_collection_title_ready
    invoke-virtual {p0, v3, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    # fetchMediaItems only exists in the playback bridge; __sfOpenCollection
    # falls back to a real navigation so a playlist still opens without it.
    const-string v1, "window.__sfOpenCollection"
    invoke-virtual {p0, v1, p1}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V
    goto :native_row_click_done

    :native_open_single
    const-string v1, "window.__sfNativeOpenUri"
    invoke-virtual {p0, v1, p1}, Lcom/melodix/music/MainActivity;->runNativeFunction(Ljava/lang/String;Ljava/lang/String;)V

    :native_row_click_done
    return-void
.end method

.method public final onNativeSettingsClick(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->openNativeSettings()V
    return-void
.end method

.method public final openNativeSettings()V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v0, :native_settings_default_screen
    const-string v1, "settings"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :native_settings_save_return
    return-void

    :native_settings_save_return
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnScreen:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnTitle:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnJson:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnExpectedId:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnSearch:Ljava/lang/String;
    goto :native_settings_show

    :native_settings_default_screen
    const-string v0, "home"
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnScreen:Ljava/lang/String;
    const-string v0, "Accueil"
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnTitle:Ljava/lang/String;

    :native_settings_show
    const-string v0, "settings"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "Paramètres"
    const-string v2, "[]"
    invoke-virtual {p0, v1, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "window.__sfRequestSpotifySettings && window.__sfRequestSpotifySettings();"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V

    :native_settings_done
    return-void
.end method

.method public final setNativeProfileImage(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :native_profile_done
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_profile_done
    const v0, 0x7f090249
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :native_profile_done
    check-cast v1, Landroid/widget/ImageView;
    const/16 v2, 0x90
    invoke-static {v1, p1, v2}, Lcom/melodix/music/NativeImageLoader;->load(Landroid/widget/ImageView;Ljava/lang/String;I)V

    :native_profile_done
    return-void
.end method

.method public final onNativePlayPauseClick(Landroid/view/View;)V
    .locals 1

    # __sfTogglePlayback lives in the always-loaded native shell: it reads the
    # real player label, marks the user intent (pause must stay a pause) and
    # refreshes the native player immediately. The old chain stays as fallback.
    const-string v0, "(function(){if(typeof window.__sfTogglePlayback===\'function\'){window.__sfTogglePlayback();return;}try{var p=document.querySelector(\'button[data-testid=\"control-button-playpause\"]\')||window.pBtn;var label=p&&p.getAttribute?String(p.getAttribute(\'aria-label\')||\'\'):\'\';var playing=/paus/i.test(label);if(!label&&typeof window.__sfGetPlaybackSnapshot===\'function\'){var snap=window.__sfGetPlaybackSnapshot();playing=snap?Boolean(snap.playing):Boolean(window.playing);}if(typeof window.__sfMarkUserPlaybackIntent===\'function\'){window.__sfMarkUserPlaybackIntent(!playing);}if(typeof window.actPlayPause===\'function\'){window.actPlayPause(!playing);return;}if(p&&typeof p.click===\'function\'){p.click();}}catch(e){}})();"

    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativePlayerExpandClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v0, :save_player_return_state
    const-string v1, "player"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :native_player_expand_done

    :save_player_return_state
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnScreen:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnTitle:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnJson:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedId:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnExpectedId:Ljava/lang/String;
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->nativeReturnSearch:Ljava/lang/String;
    const-string v2, "player"
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V

    :native_player_expand_done
    return-void
.end method

.method public final onNativePlayerPreviousClick(Landroid/view/View;)V
    .locals 1

    # A skip is an explicit user action: the shell releases the pause latch and
    # the hold before moving, then refreshes the native player.
    const-string v0, "(function(){if(typeof window.__sfSkip===\'function\'){window.__sfSkip(\'back\');return;}var b=document.querySelector(\'[data-testid=\"control-button-skip-back\"]\');if(b){b.click();}})();"

    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativePlayerNextClick(Landroid/view/View;)V
    .locals 1

    # A skip is an explicit user action: the shell releases the pause latch and
    # the hold before moving, then refreshes the native player.
    const-string v0, "(function(){if(typeof window.__sfSkip===\'function\'){window.__sfSkip(\'forward\');return;}var b=document.querySelector(\'[data-testid=\"control-button-skip-forward\"]\');if(b){b.click();}})();"

    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativePlayerShuffleClick(Landroid/view/View;)V
    .locals 1

    const-string v0, "(function(){if(typeof window.actShuffle===\'function\'){window.actShuffle();return;}var b=document.querySelector(\'[data-testid=\"control-button-shuffle\"]\');if(b){b.click();}})();"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method

.method public final onNativePlayerRepeatClick(Landroid/view/View;)V
    .locals 1

    const-string v0, "(function(){if(typeof window.actRepeat===\'function\'){window.actRepeat();return;}var b=document.querySelector(\'[data-testid=\"control-button-repeat\"]\');if(b){b.click();}})();"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    return-void
.end method
