.class Lcom/melodix/music/PreviewPlayerController$11;
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

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;J)V
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

    .line 1211
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController$11;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1212
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4300(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4400(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController$11;->val$id:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1213
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$4302(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->access$2800(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v2

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerController;->access$2902(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$3800(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$3900(Lcom/melodix/music/PreviewPlayerController;)V

    .line 1214
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$11;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 1215
    if-eqz v0, :cond_0

    const-string v2, "Commande non confirm\u00e9e"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1217
    :cond_0
    return-void
.end method
