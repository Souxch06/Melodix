.class Lcom/melodix/music/PreviewPlayerPlayButton$1;
.super Ljava/lang/Object;
.source "PreviewPlayerPlayButton.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerPlayButton;->setImageResource(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerPlayButton;I)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 28
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_1

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->getRootView()Landroid/view/View;

    move-result-object v0

    const-string v1, "previewPlayerArtCard"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    iget v0, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->val$id:I

    const v2, 0x7f080122

    if-ne v0, v2, :cond_2

    const v0, 0x3f6b851f    # 0.92f

    .line 32
    :goto_1
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerPlayButton;->access$0(Lcom/melodix/music/PreviewPlayerPlayButton;)F

    move-result v2

    cmpl-float v2, v2, v0

    if-eqz v2, :cond_0

    .line 33
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerPlayButton$1;->this$0:Lcom/melodix/music/PreviewPlayerPlayButton;

    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerPlayButton;->access$1(Lcom/melodix/music/PreviewPlayerPlayButton;F)V

    .line 34
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 35
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_3

    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    move-result v2

    if-nez v2, :cond_3

    .line 36
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    .line 31
    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_1

    .line 37
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method
