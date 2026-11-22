.class Lcom/melodix/music/PreviewPlayerController$7;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field final synthetic val$rowsForMenu:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V
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

    .line 571
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$7;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController$7;->val$rowsForMenu:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 571
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$7;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$7;->val$rowsForMenu:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    return-void
.end method
