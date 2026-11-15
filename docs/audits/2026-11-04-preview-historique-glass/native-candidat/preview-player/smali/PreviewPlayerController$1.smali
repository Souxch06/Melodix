.class Lcom/melodix/music/PreviewPlayerController$1;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->onStopTrackingTouch(Landroid/widget/SeekBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field private final synthetic val$diag:I

.field private final synthetic val$diagId:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;IJ)V
    .locals 1

    .prologue
    .line 114
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    iput-wide p3, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diagId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerController$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 116
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$0(Lcom/melodix/music/PreviewPlayerController;)[J

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    aget-wide v0, v0, v1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diagId:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 120
    :goto_0
    return-void

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1(Lcom/melodix/music/PreviewPlayerController;)[J

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 118
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$3(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    const-string v0, "true"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "action invoqu\u00e9e"

    :goto_1
    aput-object v0, v1, v2

    goto :goto_0

    .line 119
    :cond_1
    const-string v0, "false"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "action refus\u00e9e"

    goto :goto_1

    :cond_2
    const-string v0, "r\u00e9sultat indisponible"

    goto :goto_1
.end method
