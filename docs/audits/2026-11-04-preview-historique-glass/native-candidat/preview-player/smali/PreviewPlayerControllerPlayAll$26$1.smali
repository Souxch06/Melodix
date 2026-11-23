.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;->onReceiveValue(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 360
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 360
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26;->val$w:Landroid/webkit/WebView;

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1$1;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$26$1;)V

    const-string v2, "(window.__sfMenuJob===\'done\'?location.pathname:\'\')"

    invoke-virtual {v0, v2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 362
    return-void
.end method
