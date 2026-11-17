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

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;->ownHaptic:Z

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 254
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 255
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    .line 256
    const/4 v0, 0x3

    const/4 v2, 0x1

    if-eqz p2, :cond_1

    if-eq p2, v2, :cond_1

    if-eq p2, v0, :cond_1

    return v1

    .line 257
    :cond_1
    if-nez p2, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerChrome$PressEffect;->ownHaptic:Z

    if-eqz v3, :cond_2

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 258
    :cond_2
    if-nez p2, :cond_3

    goto :goto_0

    :cond_3
    move v2, v1

    .line 259
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 260
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    const/high16 v3, 0x3f800000    # 1.0f

    if-lt p2, v0, :cond_4

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result p2

    if-nez p2, :cond_4

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setScaleY(F)V

    goto :goto_2

    .line 261
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const p2, 0x3f733333    # 0.95f

    if-eqz v2, :cond_5

    move v0, p2

    goto :goto_1

    :cond_5
    move v0, v3

    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    if-eqz v2, :cond_6

    move v3, p2

    :cond_6
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v2, 0x96

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 262
    :goto_2
    return v1
.end method
