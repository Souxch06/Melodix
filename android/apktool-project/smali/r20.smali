.class public final Lr20;
.super Landroid/animation/AnimatorListenerAdapter;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;Z)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lr20;->a:I

    iput-boolean p2, p0, Lr20;->b:Z

    iput-object p1, p0, Lr20;->c:Ljava/lang/Object;

    .line 12
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Ls20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lr20;->a:I

    .line 3
    .line 4
    iput-object p1, p0, Lr20;->c:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-boolean v0, p0, Lr20;->b:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget v0, p0, Lr20;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :pswitch_0
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lr20;->b:Z

    .line 12
    .line 13
    return-void

    .line 14
    nop

    .line 15
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget v0, p0, Lr20;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, Lr20;->c:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast v2, Lcom/melodix/music/MainActivity;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->m:Z

    .line 15
    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->l:Z

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-boolean p0, p0, Lr20;->b:Z

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    :cond_0
    iget-object p0, v2, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/16 p1, 0x8

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p0, v2, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void

    .line 43
    :pswitch_0
    check-cast v2, Ls20;

    .line 44
    .line 45
    iget-boolean p1, p0, Lr20;->b:Z

    .line 46
    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iput-boolean v1, p0, Lr20;->b:Z

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    iget-object p0, v2, Ls20;->z:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ljava/lang/Float;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    const/4 p1, 0x0

    .line 65
    cmpl-float p0, p0, p1

    .line 66
    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    iput v1, v2, Ls20;->A:I

    .line 70
    .line 71
    invoke-virtual {v2, v1}, Ls20;->f(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const/4 p0, 0x2

    .line 76
    iput p0, v2, Ls20;->A:I

    .line 77
    .line 78
    iget-object p0, v2, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 81
    .line 82
    .line 83
    :goto_0
    return-void

    .line 84
    nop

    .line 85
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
