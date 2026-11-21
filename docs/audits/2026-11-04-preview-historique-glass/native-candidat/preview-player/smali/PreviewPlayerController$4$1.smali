.class Lcom/melodix/music/PreviewPlayerController$4$1;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerController$4;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController$4;Ljava/lang/String;)V
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

    .line 371
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 372
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController$4;->val$key:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerController$4;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$4000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController$4;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController$4;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerController$4;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerController$4;->val$key:Ljava/lang/String;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->rememberCover(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerController$4;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerController$4;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$4$1;->this$1:Lcom/melodix/music/PreviewPlayerController$4;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerController$4;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->restoreCover(Landroid/app/Activity;Ljava/lang/String;)V

    .line 374
    return-void

    .line 372
    :cond_1
    :goto_0
    return-void
.end method
