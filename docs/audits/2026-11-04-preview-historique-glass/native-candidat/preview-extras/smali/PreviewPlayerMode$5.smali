.class Lcom/melodix/music/PreviewPlayerMode$5;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->invoke()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field final synthetic val$g:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;J)V
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

    .line 178
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 179
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$500(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1200(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$2400(Lcom/melodix/music/PreviewPlayerMode;)V

    .line 180
    :cond_0
    return-void
.end method
