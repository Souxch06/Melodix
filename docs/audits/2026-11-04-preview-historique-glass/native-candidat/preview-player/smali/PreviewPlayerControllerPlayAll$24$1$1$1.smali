.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->onReceiveValue(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 333
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$1;->this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    .line 334
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$1;->this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$w:Landroid/webkit/WebView;

    const-string v0, "document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
