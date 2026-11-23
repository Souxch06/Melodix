.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;->onClick(Landroid/content/DialogInterface;I)V
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
.field final synthetic this$3:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;Ljava/lang/String;)V
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

    .line 326
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;->this$3:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;->val$name:Ljava/lang/String;

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

    .line 326
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 2

    .line 327
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;->this$3:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2;->this$2:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$22;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22;->val$a:Landroid/app/Activity;

    const-string v1, "\"done\""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ajout\u00e9 \u00e0 \u00ab "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$22$1$1$2$1;->val$name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " \u00bb"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "Playlist introuvable, r\u00e9essaie"

    :goto_0
    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
