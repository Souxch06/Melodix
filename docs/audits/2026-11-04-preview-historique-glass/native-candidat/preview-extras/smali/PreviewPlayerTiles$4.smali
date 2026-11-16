.class Lcom/melodix/music/PreviewPlayerTiles$4;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$body:Landroid/widget/TextView;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$body:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .prologue
    .line 115
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$6(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$4;->val$body:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$7(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V

    return-void
.end method
