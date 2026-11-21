.class Lcom/melodix/music/PreviewPlayerController$6;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private dim:Z

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 713
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 716
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 717
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$4300(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController$6;->dim:Z

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController$6;->dim:Z

    .line 718
    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerController$6;->dim:Z

    if-eqz v1, :cond_2

    const/high16 v1, 0x3f000000    # 0.5f

    goto :goto_1

    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 719
    :goto_1
    const v2, 0x7f090238

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f09023e

    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 720
    if-eqz v2, :cond_3

    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 721
    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 722
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4300(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4200(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1a4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 723
    :cond_5
    return-void
.end method
