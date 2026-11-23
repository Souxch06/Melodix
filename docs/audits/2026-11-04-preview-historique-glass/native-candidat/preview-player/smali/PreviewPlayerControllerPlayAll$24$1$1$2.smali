.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$names:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;Ljava/util/ArrayList;)V
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

    .line 331
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;->this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;->val$names:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 332
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;->val$names:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 333
    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;->this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;

    iget-object p2, p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

    iget-object p2, p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object p2, p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$w:Landroid/webkit/WebView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function(name){var menus=document.querySelectorAll(\'[role=\"menu\"]\');var m=menus[menus.length-1];var b=m?m.querySelectorAll(\'button,[role=\"menuitem\"]\'):[];window.__sfMenuJob=\'missing\';for(var j=0;j<b.length;j++)if((b[j].textContent||\'\').trim()===name){b[j].click();window.__sfMenuJob=\'done\';break}setTimeout(function(){document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))},300);return window.__sfMenuJob})("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2$1;

    invoke-direct {v1, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;Ljava/lang/String;)V

    invoke-virtual {p2, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 334
    return-void
.end method
