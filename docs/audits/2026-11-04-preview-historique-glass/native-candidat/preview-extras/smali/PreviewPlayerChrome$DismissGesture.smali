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

    .prologue
    .line 325
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;)V
    .locals 0

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;-><init>(Lcom/melodix/music/PreviewPlayerChrome;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

    .prologue
    const/high16 v9, 0x41400000    # 12.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 328
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_2

    const/4 v2, 0x0

    .line 329
    :goto_0
    if-eqz v2, :cond_0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$12(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_0
    move v0, v1

    .line 351
    :cond_1
    :goto_1
    return v0

    .line 328
    :cond_2
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$2(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f09023a

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    goto :goto_0

    .line 330
    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    .line 331
    if-nez v3, :cond_5

    .line 332
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iput v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iput v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->y:F

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    .line 333
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    goto :goto_1

    .line 335
    :cond_5
    const/4 v4, 0x5

    if-ne v3, v4, :cond_6

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    invoke-virtual {v2, v7}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1

    .line 336
    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->x:F

    sub-float/2addr v4, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    iget v6, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->y:F

    sub-float/2addr v5, v6

    .line 337
    const/4 v6, 0x2

    if-ne v3, v6, :cond_a

    .line 338
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-nez v1, :cond_8

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    if-nez v1, :cond_8

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3, v9}, Lcom/melodix/music/PreviewPlayerChrome;->access$13(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float v1, v1, v3

    if-gtz v1, :cond_7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v3, v9}, Lcom/melodix/music/PreviewPlayerChrome;->access$13(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float v1, v1, v3

    if-lez v1, :cond_8

    .line 339
    :cond_7
    cmpl-float v1, v5, v7

    if-lez v1, :cond_9

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v3, 0x3fa66666    # 1.3f

    mul-float/2addr v1, v3

    cmpl-float v1, v5, v1

    if-lez v1, :cond_9

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    .line 341
    :cond_8
    :goto_2
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-eqz v1, :cond_1

    invoke-static {v7, v5}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setAlpha(F)V

    goto/16 :goto_1

    .line 339
    :cond_9
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->rejected:Z

    goto :goto_2

    .line 344
    :cond_a
    if-eq v3, v0, :cond_b

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 345
    :cond_b
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 346
    :cond_c
    if-ne v3, v0, :cond_d

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const/high16 v4, 0x42b40000    # 90.0f

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerChrome;->access$13(Lcom/melodix/music/PreviewPlayerChrome;F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const v6, 0x3e23d70a    # 0.16f

    mul-float/2addr v4, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    cmpl-float v3, v5, v3

    if-lez v3, :cond_d

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$14(Lcom/melodix/music/PreviewPlayerChrome;)V

    .line 349
    :goto_3
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerChrome$DismissGesture;->vertical:Z

    goto/16 :goto_1

    .line 347
    :cond_d
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_e

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v3

    if-nez v3, :cond_e

    invoke-virtual {v2, v7}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v2, v8}, Landroid/view/View;->setAlpha(F)V

    goto :goto_3

    .line 348
    :cond_e
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v8}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v4, 0xc8

    invoke-virtual {v2, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_3
.end method
