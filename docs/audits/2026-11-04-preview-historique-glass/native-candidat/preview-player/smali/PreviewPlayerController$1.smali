.class Lcom/melodix/music/PreviewPlayerController$1;
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
    .line 157
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 158
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$0(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$id:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$3(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$4(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$5(Lcom/melodix/music/PreviewPlayerController;)V

    .line 159
    :cond_0
    return-void
.end method
