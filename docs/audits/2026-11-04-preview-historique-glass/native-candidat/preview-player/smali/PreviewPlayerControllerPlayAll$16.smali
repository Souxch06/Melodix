.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$d:F

.field final synthetic val$panel:Landroid/view/View;

.field final synthetic val$w:Landroid/view/Window;


# direct methods
.method constructor <init>(Landroid/view/View;FLandroid/view/Window;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 221
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$panel:Landroid/view/View;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$d:F

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$w:Landroid/view/Window;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 5

    .line 222
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$panel:Landroid/view/View;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$panel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x44160000    # 600.0f

    iget v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$d:F

    mul-float/2addr v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 223
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$panel:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v1, 0x118

    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v4, 0x40000000    # 2.0f

    invoke-direct {v3, v4}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 224
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$16;->val$w:Landroid/view/Window;

    const v3, 0x3f19999a    # 0.6f

    invoke-static {p1, v0, v3, v1, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->dim(Landroid/view/Window;FFJ)V

    .line 225
    return-void
.end method
