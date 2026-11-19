.class Lcom/melodix/music/PreviewPlayerSheet$3;
.super Ljava/lang/Object;
.source "PreviewPlayerSheet.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerSheet;->dragListener()Landroid/view/View$OnTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastAt:J

.field lastDy:F

.field moves:I

.field rejected:Z

.field speed:F

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerSheet;

.field vertical:Z

.field x:F

.field y:F


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .line 76
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$000(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_d

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_3

    .line 77
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 78
    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez p1, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->y:F

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    iput v2, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastDy:F

    iput v2, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->speed:F

    iput v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->moves:I

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastAt:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return v0

    .line 79
    :cond_1
    const/4 v3, 0x5

    if-ne p1, v3, :cond_2

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    return v0

    .line 80
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->x:F

    sub-float/2addr v3, v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->y:F

    sub-float/2addr p2, v4

    .line 81
    const/4 v4, 0x2

    const/high16 v5, 0x3f800000    # 1.0f

    if-ne p1, v4, :cond_7

    .line 82
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-nez p1, :cond_5

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    if-nez p1, :cond_5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-gtz p1, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_5

    .line 83
    :cond_3
    cmpl-float p1, p2, v2

    if-lez p1, :cond_4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v1, 0x3fa66666    # 1.3f

    mul-float/2addr p1, v1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_4

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    goto :goto_0

    :cond_4
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    .line 85
    :cond_5
    :goto_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-eqz p1, :cond_6

    .line 86
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastAt:J

    sub-long v6, v3, v6

    long-to-float p1, v6

    const v1, 0x49742400    # 1000000.0f

    div-float/2addr p1, v1

    invoke-static {v5, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastDy:F

    sub-float v1, p2, v1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->speed:F

    iput p2, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastDy:F

    iput-wide v3, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->lastAt:J

    iget p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->moves:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->moves:I

    .line 87
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-static {v2, p2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 88
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v1

    invoke-static {v2, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    div-float/2addr p2, p1

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float/2addr p2, p1

    const p1, 0x3eb33333    # 0.35f

    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    sub-float/2addr v5, p1

    invoke-virtual {v1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 90
    :cond_6
    return v0

    .line 92
    :cond_7
    const/4 v3, 0x3

    if-eq p1, v0, :cond_9

    if-ne p1, v3, :cond_8

    goto :goto_1

    .line 99
    :cond_8
    return v0

    .line 94
    :cond_9
    :goto_1
    if-ne p1, v0, :cond_b

    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    const/high16 v4, 0x42b40000    # 90.0f

    invoke-static {p1, v4}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result p1

    int-to-float p1, p1

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const v6, 0x3e23d70a    # 0.16f

    mul-float/2addr v4, v6

    invoke-static {p1, v4}, Ljava/lang/Math;->max(FF)F

    move-result p1

    cmpl-float p1, p2, p1

    if-gtz p1, :cond_a

    iget p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->moves:I

    if-lt p1, v3, :cond_b

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_b

    iget p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->speed:F

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p2, v5}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_b

    :cond_a
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V

    goto :goto_2

    .line 95
    :cond_b
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$500(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/view/View;->setAlpha(F)V

    goto :goto_2

    .line 96
    :cond_c
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v2, 0x104

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Landroid/view/animation/OvershootInterpolator;

    const v2, 0x3f8ccccd    # 1.1f

    invoke-direct {p2, v2}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 97
    :goto_2
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    return v0

    .line 76
    :cond_d
    :goto_3
    return v0
.end method
