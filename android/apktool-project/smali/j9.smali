.class public final synthetic Lj9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lj9;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public synthetic constructor <init>(Llt0;)V
    .locals 0

    .line 8
    const/4 p1, 0x1

    iput p1, p0, Lj9;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 5

    .line 1
    iget p0, p0, Lj9;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    packed-switch p0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Les0;->b(Ljava/util/List;)[Li41;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :pswitch_0
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->d0:Landroid/os/Handler;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->Z:Landroid/view/View;

    .line 36
    .line 37
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->a0:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->x()V

    .line 40
    .line 41
    .line 42
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    const/16 v3, 0x1a

    .line 46
    .line 47
    if-lt v1, v3, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_0

    .line 54
    .line 55
    iget-boolean v4, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 56
    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->B(Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->H()V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iput-boolean v0, p0, Lcom/melodix/music/MainActivity;->c0:Z

    .line 67
    .line 68
    if-lt v1, v3, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    new-instance v0, Landroid/util/Rational;

    .line 77
    .line 78
    invoke-direct {v0, v2, v2}, Landroid/util/Rational;-><init>(II)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/melodix/music/MainActivity;->b0:Landroid/util/Rational;

    .line 82
    .line 83
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->T:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-lez v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->V:Ljava/lang/String;

    .line 96
    .line 97
    new-instance v1, Ljava/lang/Thread;

    .line 98
    .line 99
    new-instance v2, Lbl0;

    .line 100
    .line 101
    invoke-direct {v2, v0, p0}, Lbl0;-><init>(Ljava/lang/String;Lcom/melodix/music/MainActivity;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 108
    .line 109
    .line 110
    :cond_1
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->F()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->H()V

    .line 114
    .line 115
    .line 116
    :cond_2
    :goto_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 117
    .line 118
    return-object p0

    .line 119
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
