.class final Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerChrome;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DismissGesture"
.end annotation


# instance fields
.field private rejected:Z

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;

.field private vertical:Z

.field private x:F

.field private y:F


# direct methods
.method private constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 456
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$1;)V
    .locals 0

    .line 456
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .line 459
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 460
    :goto_0
    const/4 v1, 0x0

    if-eqz v0, :cond_f

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1500(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_4

    .line 461
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 462
    const/4 v3, 0x1

    if-nez v2, :cond_3

    .line 463
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iput v2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iput p2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->y:F

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    .line 464
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return v3

    .line 466
    :cond_3
    const/4 v4, 0x5

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    if-ne v2, v4, :cond_4

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p1, v6}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    return v3

    .line 467
    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v7, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->x:F

    sub-float/2addr v4, v7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v7, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->y:F

    sub-float/2addr p2, v7

    .line 468
    const/4 v7, 0x2

    if-ne v2, v7, :cond_9

    .line 469
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-nez p1, :cond_7

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    if-nez p1, :cond_7

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1700(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-gtz p1, :cond_5

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1700(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_7

    .line 470
    :cond_5
    cmpl-float p1, p2, v6

    if-lez p1, :cond_6

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v1, 0x3fa66666    # 1.3f

    mul-float/2addr p1, v1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_6

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    goto :goto_1

    :cond_6
    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    .line 472
    :cond_7
    :goto_1
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-eqz p1, :cond_8

    invoke-static {v6, p2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p2, p1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    .line 473
    :cond_8
    return v3

    .line 475
    :cond_9
    if-eq v2, v3, :cond_b

    const/4 v4, 0x3

    if-ne v2, v4, :cond_a

    goto :goto_2

    .line 482
    :cond_a
    return v3

    .line 476
    :cond_b
    :goto_2
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 477
    :cond_c
    if-ne v2, v3, :cond_d

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-eqz p1, :cond_d

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-static {p1, v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1700(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const v4, 0x3e23d70a    # 0.16f

    mul-float/2addr v2, v4

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_d

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1800(Lcom/melodix/music/PreviewPlayerChrome;)V

    goto :goto_3

    .line 478
    :cond_d
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-lt p1, p2, :cond_e

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result p1

    if-nez p1, :cond_e

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p1, v6}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    goto :goto_3

    .line 479
    :cond_e
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v4, 0xc8

    invoke-virtual {p1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p2, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1900(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture$1;

    invoke-direct {p2, p0, v0}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture$1;-><init>(Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 480
    :goto_3
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    return v3

    .line 460
    :cond_f
    :goto_4
    return v1
.end method
