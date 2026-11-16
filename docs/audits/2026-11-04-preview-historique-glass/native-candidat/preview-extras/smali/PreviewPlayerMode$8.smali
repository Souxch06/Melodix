.class Lcom/melodix/music/PreviewPlayerMode$8;
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

    .prologue
    .line 157
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$8;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$8;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$21(Lcom/melodix/music/PreviewPlayerMode;)V

    return-void
.end method
