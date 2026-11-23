.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 390
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 390
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$w:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$show:Landroid/webkit/ValueCallback;

    const-string v2, "(function(act){try{var bs=document.querySelectorAll(\'main button,[data-testid=\"action-bar-row\"] button\');var b=null;for(var i=0;i<bs.length;i++){var t=(bs[i].textContent||\'\').trim();if(/^(Suivre|Abonn\u00e9\u00b7?e?|Abonn\u00e9|Follow|Following|S\'abonner|Se d\u00e9sabonner)$/i.test(t)){b=bs[i];break}}if(!b)return \'absent\';var on=/^(Abonn|Following|Se d\u00e9sabonner)/i.test((b.textContent||\'\').trim());if(act===\'tap\'){b.click();return on?\'off\':\'on\'}return on?\'on\':\'off\'}catch(e){return \'error\'}})(\'read\')"

    invoke-virtual {v0, v2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
