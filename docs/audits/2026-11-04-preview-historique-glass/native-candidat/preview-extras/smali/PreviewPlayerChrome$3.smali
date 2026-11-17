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

.field private final synthetic val$p:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 177
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$13(Lcom/melodix/music/PreviewPlayerChrome;F)V

    return-void
.end method
