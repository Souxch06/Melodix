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
.field rejected:Z

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerSheet;

.field vertical:Z

.field x:F

.field y:F


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8

    .prologue
    const/high16 v7, 0x41400000    # 12.0f

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 73
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$0(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v4

    .line 74
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 75
    if-nez v0, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->y:F

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    goto :goto_0

    .line 76
    :cond_2
    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_0

    .line 77
    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->x:F

    sub-float/2addr v1, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iget v3, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->y:F

    sub-float/2addr v2, v3

    .line 78
    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    .line 79
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    if-nez v0, :cond_5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v3, v7}, Lcom/melodix/music/PreviewPlayerSheet;->access$3(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v3, v7}, Lcom/melodix/music/PreviewPlayerSheet;->access$3(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_5

    .line 80
    :cond_4
    cmpl-float v0, v2, v5

    if-lez v0, :cond_6

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3fa66666    # 1.3f

    mul-float/2addr v0, v1

    cmpl-float v0, v2, v0

    if-lez v0, :cond_6

    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    .line 82
    :cond_5
    :goto_1
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto/16 :goto_0

    .line 80
    :cond_6
    iput-boolean v4, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->rejected:Z

    goto :goto_1

    .line 84
    :cond_7
    if-eq v0, v4, :cond_8

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 85
    :cond_8
    if-ne v0, v4, :cond_9

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    const/high16 v1, 0x42b40000    # 90.0f

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerSheet;->access$3(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const v3, 0x3e23d70a    # 0.16f

    mul-float/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    cmpl-float v0, v2, v0

    if-lez v0, :cond_9

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V

    .line 88
    :goto_2
    iput-boolean v6, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->vertical:Z

    goto/16 :goto_0

    .line 86
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$5(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_2

    .line 87
    :cond_a
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$3;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$1(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_2
.end method
