.class Lcom/melodix/music/PreviewPlayerTiles$4;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->showWebPanel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$previous:I

.field private final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/view/View;I)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$root:Landroid/view/View;

    iput p3, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$previous:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "ignored"    # Landroid/content/DialogInterface;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$12(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$root:Landroid/view/View;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$previous:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
