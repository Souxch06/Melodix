.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->onReceiveValue(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 324
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 324
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$w:Landroid/webkit/WebView;

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;)V

    const-string v2, "JSON.stringify(window.__sfPlNames||null)"

    invoke-virtual {v0, v2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 337
    return-void
.end method
