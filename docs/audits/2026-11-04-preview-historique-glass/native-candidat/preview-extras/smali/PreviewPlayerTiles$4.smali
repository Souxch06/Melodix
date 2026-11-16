.class Lcom/melodix/music/PreviewPlayerTiles$4;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->showPanel(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    :cond_0
    return-void
.end method
