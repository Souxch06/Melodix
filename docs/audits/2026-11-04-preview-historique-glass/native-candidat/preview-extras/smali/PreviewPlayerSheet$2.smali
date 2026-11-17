.class Lcom/melodix/music/PreviewPlayerSheet$2;
.super Ljava/lang/Object;
.source "PreviewPlayerSheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerSheet$2;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$2;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerSheet;->access$0(Lcom/melodix/music/PreviewPlayerSheet;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerSheet$2;->this$0:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismissImmediately()V

    .line 49
    :cond_0
    return-void
.end method
