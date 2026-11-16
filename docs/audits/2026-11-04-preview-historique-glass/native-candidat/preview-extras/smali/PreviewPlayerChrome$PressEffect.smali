.class final Lcom/melodix/music/PreviewPlayerChrome$PressEffect;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerChrome;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PressEffect"
.end annotation


# instance fields
.field private final ownHaptic:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;->ownHaptic:Z

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v0, 0x1

    const v3, 0x3f733333    # 0.95f

    const/4 v1, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    .line 101
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 109
    :cond_0
    :goto_0
    return v1

    .line 102
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 103
    if-eqz v2, :cond_2

    if-eq v2, v0, :cond_2

    if-ne v2, v6, :cond_0

    .line 104
    :cond_2
    if-nez v2, :cond_3

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;->ownHaptic:Z

    if-eqz v5, :cond_3

    invoke-virtual {p1, v6}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 105
    :cond_3
    if-nez v2, :cond_4

    .line 106
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 107
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v2, v5, :cond_5

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {p1, v4}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    :cond_4
    move v0, v1

    .line 105
    goto :goto_1

    .line 108
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    if-eqz v0, :cond_6

    move v2, v3

    :goto_2
    invoke-virtual {v5, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    if-eqz v0, :cond_7

    :goto_3
    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    :cond_6
    move v2, v4

    goto :goto_2

    :cond_7
    move v3, v4

    goto :goto_3
.end method
