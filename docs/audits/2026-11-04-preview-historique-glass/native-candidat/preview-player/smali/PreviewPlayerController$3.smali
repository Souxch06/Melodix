.class Lcom/melodix/music/PreviewPlayerController$3;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->tapPlayPause()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field private final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 0

    .prologue
    .line 618
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController$3;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 619
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$20(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->val$id:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 620
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->access$22(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$23(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$24(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$25(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$26(Lcom/melodix/music/PreviewPlayerController;)V

    .line 621
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 622
    if-eqz v0, :cond_0

    const-string v1, "Commande non confirm\u00e9e"

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 624
    :cond_0
    return-void
.end method
