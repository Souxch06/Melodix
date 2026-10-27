.class public final Lr70;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Z

.field public final b:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public c:Lp80;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lr70;->d:I

    iput-object p1, p0, Lr70;->e:Ljava/lang/Object;

    .line 14
    invoke-direct {p0, v0}, Lr70;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Lz70;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lr70;->d:I

    .line 15
    iput-object p1, p0, Lr70;->e:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lr70;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lr70;->a:Z

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lr70;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/melodix/music/WebService;->r:Z

    .line 2
    .line 3
    iget-object p0, p0, Lr70;->e:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->G:Landroid/webkit/WebView;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const-string v2, "https://open.spotify.com/"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    const-string v2, "https://open\\.spotify\\.com/intl-[a-zA-Z]{2}/"

    .line 32
    .line 33
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 57
    .line 58
    .line 59
    const v0, 0x7f110118

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->E(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    sget-boolean v0, Lcom/melodix/music/MainActivity;->i0:Z

    .line 74
    .line 75
    const/4 v1, 0x1

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    sput-boolean v1, Lcom/melodix/music/MainActivity;->i0:Z

    .line 79
    .line 80
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 81
    .line 82
    invoke-static {}, Lm9;->c()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const v1, 0x7f11011c

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const/4 v2, 0x0

    .line 94
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->f0:Landroid/os/Handler;

    .line 102
    .line 103
    new-instance v0, Lx3;

    .line 104
    .line 105
    const/16 v1, 0xb

    .line 106
    .line 107
    invoke-direct {v0, v1}, Lx3;-><init>(I)V

    .line 108
    .line 109
    .line 110
    const-wide/16 v1, 0x7d0

    .line 111
    .line 112
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    invoke-virtual {p0, v1}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 121
    .line 122
    .line 123
    return-void
.end method
