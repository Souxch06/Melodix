.class Lcom/melodix/music/PreviewPlayerChrome$4;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerChrome;->closeAnimated(Landroid/app/Activity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$p:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 413
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 414
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1300(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 415
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1302(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerChrome;->access$1402(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    .line 416
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$a:Landroid/app/Activity;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "onNativeBackClick"

    const-class v6, Landroid/view/View;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$a:Landroid/app/Activity;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 419
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v4, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1402(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    .line 422
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V

    .line 423
    :cond_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 424
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_0

    .line 419
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v5, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1402(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    .line 422
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V

    .line 423
    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 424
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    .line 425
    :cond_3
    throw v4

    .line 417
    :catch_0
    move-exception v4

    .line 419
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v4, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1402(Lcom/melodix/music/PreviewPlayerChrome;Z)Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    .line 422
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1100(Lcom/melodix/music/PreviewPlayerChrome;)V

    .line 423
    :cond_4
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 424
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->val$p:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$4;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v3}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;F)V

    .line 426
    :cond_5
    return-void
.end method
