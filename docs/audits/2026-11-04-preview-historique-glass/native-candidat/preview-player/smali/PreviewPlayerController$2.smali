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

.field private final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;J)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController$2;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    .line 129
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->val$id:J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerController;->access$5(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v6

    cmp-long v0, v0, v6

    if-eqz v0, :cond_1

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->access$6(Lcom/melodix/music/PreviewPlayerController;Z)V

    .line 131
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v1, "non confirm\u00e9e apr\u00e8s 5 s"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$7(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 132
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$8(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$9(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v10

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$10(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "playing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$11(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    sub-long v0, v6, v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_1
    add-long/2addr v0, v10

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    long-to-double v0, v0

    invoke-static {v5, v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$12(Lcom/melodix/music/PreviewPlayerController;D)V

    .line 133
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0, v6, v7}, Lcom/melodix/music/PreviewPlayerController;->access$13(Lcom/melodix/music/PreviewPlayerController;J)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$14(Lcom/melodix/music/PreviewPlayerController;D)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$10(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "playing"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$15(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerController;->access$16(Lcom/melodix/music/PreviewPlayerController;Z)V

    .line 134
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$17(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$18(Lcom/melodix/music/PreviewPlayerController;)V

    .line 135
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$2;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    const-string v1, "R\u00e9essayer"

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_2
    move-wide v0, v2

    .line 132
    goto :goto_1

    :cond_3
    move v0, v4

    .line 133
    goto :goto_2
.end method
