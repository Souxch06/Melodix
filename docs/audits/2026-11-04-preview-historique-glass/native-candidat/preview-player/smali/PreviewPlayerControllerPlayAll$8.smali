.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerControllerPlayAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field drag:Z

.field dy:F

.field final slop:I

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dlg:Landroid/app/Dialog;

.field y0:F


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/Activity;Landroid/app/Dialog;)V
    .locals 0

    .line 154
    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->val$dlg:Landroid/app/Dialog;

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 155
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->slop:I

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 157
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->y0:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->drag:Z

    goto :goto_0

    .line 158
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->y0:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->slop:I

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->drag:Z

    .line 159
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->drag:Z

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 162
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 163
    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->y0:F

    return v1

    .line 164
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->y0:F

    sub-float/2addr p1, v2

    const/4 v2, 0x0

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->dy:F

    .line 165
    const/4 p1, 0x2

    if-ne v0, p1, :cond_1

    iget p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->dy:F

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->setTranslationY(F)V

    return v1

    .line 166
    :cond_1
    if-eq v0, v1, :cond_3

    const/4 p1, 0x3

    if-ne v0, p1, :cond_2

    goto :goto_0

    .line 171
    :cond_2
    return v1

    .line 167
    :cond_3
    :goto_0
    iget p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->dy:F

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x3e800000    # 0.25f

    mul-float/2addr v0, v3

    cmpl-float p1, p1, v0

    if-lez p1, :cond_4

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->val$dlg:Landroid/app/Dialog;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->close(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    goto :goto_1

    .line 168
    :cond_4
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v2, 0xb4

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 169
    :goto_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$8;->drag:Z

    return v1
.end method
