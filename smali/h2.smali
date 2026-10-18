.class public final Lh2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 10
    iput p1, p0, Lh2;->a:I

    iput-object p2, p0, Lh2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Loi1;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x3

    .line 2
    iput p2, p0, Lh2;->a:I

    .line 3
    .line 4
    iput-object p1, p0, Lh2;->b:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget v0, p0, Lh2;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lh2;->b:Ljava/lang/Object;

    .line 4
    .line 5
    sparse-switch v0, :sswitch_data_0

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :sswitch_0
    check-cast v1, Loi1;

    .line 13
    .line 14
    invoke-interface {v1}, Loi1;->b()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :sswitch_1
    check-cast v1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    iput-object p0, v1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->F:Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    iput-boolean p0, v1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->s:Z

    .line 25
    .line 26
    return-void

    .line 27
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x3 -> :sswitch_0
    .end sparse-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget v0, p0, Lh2;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lh2;->b:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Loi1;

    .line 10
    .line 11
    invoke-interface {p0}, Loi1;->a()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->m:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/high16 p1, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-wide/16 v0, 0x12c

    .line 59
    .line 60
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :pswitch_1
    new-instance p1, Ljava/util/ArrayList;

    .line 69
    .line 70
    check-cast p0, Lq5;

    .line 71
    .line 72
    iget-object v0, p0, Lq5;->n:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    :goto_0
    if-ge v1, v0, :cond_3

    .line 82
    .line 83
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lam0;

    .line 88
    .line 89
    iget-object v2, v2, Lam0;->b:Lcm0;

    .line 90
    .line 91
    iget-object v2, v2, Lcm0;->x:Landroid/content/res/ColorStateList;

    .line 92
    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    invoke-static {p0, v2}, Loy;->h(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    return-void

    .line 102
    :pswitch_2
    check-cast p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 103
    .line 104
    const/4 p1, 0x0

    .line 105
    iput-object p1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->F:Landroid/view/ViewPropertyAnimator;

    .line 106
    .line 107
    iput-boolean v1, p0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->s:Z

    .line 108
    .line 109
    return-void

    .line 110
    nop

    .line 111
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 5

    .line 1
    iget v0, p0, Lh2;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lh2;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    :pswitch_0
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_1
    check-cast v1, Loi1;

    .line 13
    .line 14
    invoke-interface {v1}, Loi1;->c()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_2
    new-instance p0, Ljava/util/ArrayList;

    .line 19
    .line 20
    check-cast v1, Lq5;

    .line 21
    .line 22
    iget-object p1, v1, Lq5;->n:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, 0x0

    .line 32
    :goto_0
    if-ge v0, p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lam0;

    .line 39
    .line 40
    iget-object v2, v2, Lam0;->b:Lcm0;

    .line 41
    .line 42
    iget-object v3, v2, Lcm0;->x:Landroid/content/res/ColorStateList;

    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    iget-object v2, v2, Lcm0;->B:[I

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v3, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-static {v1, v2}, Loy;->g(Landroid/graphics/drawable/Drawable;I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-void

    .line 63
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
