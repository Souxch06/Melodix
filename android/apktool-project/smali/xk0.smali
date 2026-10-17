.class public final synthetic Lxk0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic j:Lhz0;

.field public final synthetic k:Landroid/os/Handler;

.field public final synthetic l:Lcom/melodix/music/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lhz0;Landroid/os/Handler;Lcom/melodix/music/MainActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lxk0;->j:Lhz0;

    .line 5
    .line 6
    iput-object p2, p0, Lxk0;->k:Landroid/os/Handler;

    .line 7
    .line 8
    iput-object p3, p0, Lxk0;->l:Lcom/melodix/music/MainActivity;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-object v0, p0, Lxk0;->j:Lhz0;

    .line 8
    .line 9
    iget-object v1, p0, Lxk0;->k:Landroid/os/Handler;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    if-eq p2, v2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x3

    .line 17
    if-eq p2, p0, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    iget-object p0, v0, Lhz0;->j:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ljava/lang/Runnable;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    iput-object p0, v0, Lhz0;->j:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/high16 p1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-wide/16 p1, 0x96

    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return v2

    .line 56
    :cond_2
    new-instance p2, Lo6;

    .line 57
    .line 58
    const/16 v3, 0xc

    .line 59
    .line 60
    iget-object p0, p0, Lxk0;->l:Lcom/melodix/music/MainActivity;

    .line 61
    .line 62
    invoke-direct {p2, p1, v3, p0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iput-object p2, v0, Lhz0;->j:Ljava/lang/Object;

    .line 66
    .line 67
    const-wide/16 v3, 0xbb8

    .line 68
    .line 69
    invoke-virtual {v1, p2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const p1, 0x3f51eb85    # 0.82f

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 92
    .line 93
    .line 94
    return v2
.end method
