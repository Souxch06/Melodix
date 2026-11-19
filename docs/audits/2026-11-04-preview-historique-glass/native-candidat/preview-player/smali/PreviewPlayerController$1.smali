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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;

.field final synthetic val$diag:I

.field final synthetic val$diagId:J


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

    .line 121
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    iput-wide p3, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diagId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 121
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerController$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .line 123
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$000(Lcom/melodix/music/PreviewPlayerController;)[J

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    aget-wide v1, v0, v1

    iget-wide v3, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diagId:J

    cmp-long v0, v1, v3

    if-eqz v0, :cond_0

    return-void

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$100(Lcom/melodix/music/PreviewPlayerController;)[J

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 125
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$1;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$300(Lcom/melodix/music/PreviewPlayerController;)[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerController$1;->val$diag:I

    const-string v2, "true"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p1, "action invoqu\u00e9e"

    goto :goto_0

    .line 126
    :cond_1
    const-string v2, "false"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "action refus\u00e9e"

    goto :goto_0

    :cond_2
    const-string p1, "r\u00e9sultat indisponible"

    :goto_0
    aput-object p1, v0, v1

    .line 127
    return-void
.end method
