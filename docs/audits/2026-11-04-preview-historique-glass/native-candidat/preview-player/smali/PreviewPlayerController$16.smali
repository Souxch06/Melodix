.class Lcom/melodix/music/PreviewPlayerController$16;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->showDiagnostics()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field final synthetic val$seq:I

.field final synthetic val$until:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;IJ)V
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

    .line 1332
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$16;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController$16;->val$seq:I

    iput-wide p3, p0, Lcom/melodix/music/PreviewPlayerController$16;->val$until:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1333
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$16;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4900(Lcom/melodix/music/PreviewPlayerController;)I

    move-result v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$16;->val$seq:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$16;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController$16;->val$until:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$16;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$4200(Lcom/melodix/music/PreviewPlayerController;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 1334
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$16;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$5200(Lcom/melodix/music/PreviewPlayerController;)V

    .line 1335
    return-void
.end method
