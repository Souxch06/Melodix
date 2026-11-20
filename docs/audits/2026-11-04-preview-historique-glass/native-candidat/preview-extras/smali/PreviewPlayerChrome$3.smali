.class Lcom/melodix/music/PreviewPlayerChrome$3;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerChrome;->followStatus(Landroid/view/View;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;

.field final synthetic val$p:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V
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

    .line 193
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 193
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    return-void
.end method
