.class Lcom/melodix/music/PreviewPlayerSheet$1;
.super Ljava/lang/Object;
.source "PreviewPlayerSheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerSheet;->showSheet(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerSheet;

.field final synthetic val$content:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerSheet;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 49
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$000(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$100(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerSheet;->access$200(Lcom/melodix/music/PreviewPlayerSheet;)F

    move-result v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    const/high16 v2, 0x43960000    # 300.0f

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerSheet;->access$300(Lcom/melodix/music/PreviewPlayerSheet;F)I

    move-result v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerSheet;->access$400(Lcom/melodix/music/PreviewPlayerSheet;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 51
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    const v1, 0x3ecccccd    # 0.4f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 52
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$1;->val$content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x17c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    const v2, 0x3f333333    # 0.7f

    invoke-direct {v1, v2}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 53
    return-void

    .line 49
    :cond_2
    :goto_1
    return-void
.end method
