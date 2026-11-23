.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 298
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;

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

    .line 298
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;->val$a:Landroid/app/Activity;

    const-string v1, "\"done\""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$18;->val$ok:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, "Action non trouv\u00e9e dans le menu Spotify"

    :goto_0
    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
