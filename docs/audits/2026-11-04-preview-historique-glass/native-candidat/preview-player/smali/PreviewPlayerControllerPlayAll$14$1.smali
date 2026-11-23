.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$14$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 211
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 212
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$a:Landroid/app/Activity;

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;

    iget-object p2, p2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$id:Ljava/lang/String;

    const-string v0, "Supprimer de cette playlist|Remove from this playlist"

    const-string v1, "Supprim\u00e9 de la playlist"

    invoke-static {p1, p2, v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->pageMenu(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
