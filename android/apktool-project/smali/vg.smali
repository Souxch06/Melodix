.class public final Lvg;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lvg;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lvg;->b:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget v0, p0, Lvg;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lvg;->b:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/Float;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/high16 v0, 0x437f0000    # 255.0f

    .line 19
    .line 20
    mul-float/2addr p1, v0

    .line 21
    float-to-int p1, p1

    .line 22
    check-cast p0, Ls20;

    .line 23
    .line 24
    iget-object v0, p0, Ls20;->c:Landroid/graphics/drawable/StateListDrawable;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ls20;->d:Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ls20;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/lang/Float;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    check-cast p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Lfm0;

    .line 53
    .line 54
    if-eqz p0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lfm0;->j:Lem0;

    .line 57
    .line 58
    iget v1, v0, Lem0;->i:F

    .line 59
    .line 60
    cmpl-float v1, v1, p1

    .line 61
    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    iput p1, v0, Lem0;->i:F

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    iput-boolean p1, p0, Lfm0;->n:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Lfm0;->invalidateSelf()V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void

    .line 73
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
