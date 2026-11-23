.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->addFollow(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$show:Landroid/webkit/ValueCallback;

.field final synthetic val$w:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 388
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$w:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$show:Landroid/webkit/ValueCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 389
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$w:Landroid/webkit/WebView;

    const-string v0, "(function(act){try{var bs=document.querySelectorAll(\'main button,[data-testid=\"action-bar-row\"] button\');var b=null;for(var i=0;i<bs.length;i++){var t=(bs[i].textContent||\'\').trim();if(/^(Suivre|Abonn\u00e9\u00b7?e?|Abonn\u00e9|Follow|Following|S\'abonner|Se d\u00e9sabonner)$/i.test(t)){b=bs[i];break}}if(!b)return \'absent\';var on=/^(Abonn|Following|Se d\u00e9sabonner)/i.test((b.textContent||\'\').trim());if(act===\'tap\'){b.click();return on?\'off\':\'on\'}return on?\'on\':\'off\'}catch(e){return \'error\'}})(\'tap\')"

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$show:Landroid/webkit/ValueCallback;

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 390
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;->val$w:Landroid/webkit/WebView;

    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$29$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$29;)V

    const-wide/16 v1, 0x5dc

    invoke-virtual {p1, v0, v1, v2}, Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
