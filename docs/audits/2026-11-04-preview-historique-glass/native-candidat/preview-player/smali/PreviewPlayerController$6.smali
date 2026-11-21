.class Lcom/melodix/music/PreviewPlayerController$6;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->oembed(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 412
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController$6;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerController$6;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerController$6;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 413
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$6;->val$path:Ljava/lang/String;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->oembedCover(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 414
    if-nez v0, :cond_0

    return-void

    .line 415
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$6;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$4200(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/melodix/music/PreviewPlayerController$6$1;

    invoke-direct {v2, p0, v0}, Lcom/melodix/music/PreviewPlayerController$6$1;-><init>(Lcom/melodix/music/PreviewPlayerController$6;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 419
    :catchall_0
    move-exception v0

    :goto_0
    return-void
.end method
