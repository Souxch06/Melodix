.class Lcom/melodix/music/PreviewPlayerController$12;
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

    .line 1226
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1226
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v1, -0x1

    invoke-static {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$4602(Lcom/melodix/music/PreviewPlayerController;J)J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$4700(Lcom/melodix/music/PreviewPlayerController;F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1600(Lcom/melodix/music/PreviewPlayerController;)V

    return-void
.end method
