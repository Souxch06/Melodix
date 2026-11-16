.class Lcom/melodix/music/PreviewPlayerMode$9;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->onWindowVisibilityChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 247
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$9;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$9;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$3000(Lcom/melodix/music/PreviewPlayerMode;)V

    return-void
.end method
