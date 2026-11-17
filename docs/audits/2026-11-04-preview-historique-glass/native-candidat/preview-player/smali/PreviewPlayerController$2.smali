.class Lcom/melodix/music/PreviewPlayerController$2;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->onStopTrackingTouch(Landroid/widget/SeekBar;)V
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

    .line 125
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController$2;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 126
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$400(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->val$id:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->access$500(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$402(Lcom/melodix/music/PreviewPlayerController;Z)Z

    .line 128
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v4, "non confirm\u00e9e apr\u00e8s 5 s"

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerController;->access$600(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 129
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerController;->access$800(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v4

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerController;->access$900(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v6

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v8}, Lcom/melodix/music/PreviewPlayerController;->access$1000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "playing"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-wide/16 v10, 0x0

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v8}, Lcom/melodix/music/PreviewPlayerController;->access$1100(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v12

    sub-long v12, v0, v12

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    goto :goto_0

    :cond_1
    move-wide v12, v10

    :goto_0
    add-long/2addr v6, v12

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-double v4, v4

    invoke-static {v2, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->access$702(Lcom/melodix/music/PreviewPlayerController;D)D

    .line 130
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$1202(Lcom/melodix/music/PreviewPlayerController;J)J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$1302(Lcom/melodix/music/PreviewPlayerController;D)D

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$1000(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$1500(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    move v1, v3

    :goto_1
    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$1402(Lcom/melodix/music/PreviewPlayerController;Z)Z

    .line 131
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1600(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1700(Lcom/melodix/music/PreviewPlayerController;)V

    .line 132
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_3

    const-string v1, "R\u00e9essayer"

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 133
    :cond_3
    return-void

    .line 126
    :cond_4
    :goto_2
    return-void
.end method
