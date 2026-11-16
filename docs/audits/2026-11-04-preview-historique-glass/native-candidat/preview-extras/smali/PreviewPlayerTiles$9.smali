.class Lcom/melodix/music/PreviewPlayerTiles$9;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 178
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$402(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$508(Lcom/melodix/music/PreviewPlayerTiles;)J

    return-void
.end method
